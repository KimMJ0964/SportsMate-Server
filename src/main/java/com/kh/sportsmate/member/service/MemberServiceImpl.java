package com.kh.sportsmate.member.service;

import com.kh.sportsmate.Attachment.model.dao.AttachmentDao;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.kh.sportsmate.common.template.Template;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.member.model.dto.ManagerEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.LoginLog;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import lombok.RequiredArgsConstructor;

/**
 * packageName    : com.kh.sportsmate.service
 * fileName       : MemberServiceImpl
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MemberServiceImpl implements MemberService {
    private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
    private final SqlSessionTemplate sqlSession;
    private final MemberDao memberDao;
    private final StadiumDao stadiumDao;
    private final AttachmentDao attachmentDao;

    /**
     * 로그인한 멤버 정보 (R)
     *
     * @param m
     * @return
     */
    @Override
    public Member loginMember(Member m) {
        int result = 1;
        Member loginUser = memberDao.loginMember(sqlSession, m);

        if (loginUser != null) {
            //로그인 로그 객체 추가
            LoginLog loginLog = new LoginLog();
            loginLog.setMemNo(loginUser.getMemNo());

            // 로그인 기록 추가
            result = memberDao.loginLog(sqlSession, loginLog);
        }

        return loginUser;
    }

    /**
     * 일반 사용자 회원가입
     *
     * @param m
     * @param profile
     * @return
     */
    @Transactional
    @Override
    public int insertMember(MemberEnrollDto m, Profile profile) {
        int result1 = 0;
        int result2 = 1;
        int result3 = 0;
        String memAdd = m.getMemberBaseAdd() + " , " + m.getMemberDetailAdd();
        String memBirth = m.getYear() + "." + m.getMonth() + "." + m.getDay(); // 생년월일 concatenate
        String memPhone = m.getPhone1() + "-" + m.getPhone2() + "-" + m.getPhone3(); // 전화번호
        Member processedMember = new Member(m.getMemEmail(), m.getMemPwd(), m.getMemName(),
                m.getMemGender(), m.getMemberZipcode(), memAdd, memBirth, memPhone, "Y");
        result1 = memberDao.insertMember(sqlSession, processedMember);

        System.out.println("memNo : " + processedMember.getMemNo());
        if (profile != null) {
            profile.setMemNo(processedMember.getMemNo());
            result2 = attachmentDao.insertProfile(sqlSession, profile);
        }

        // 종목 관련 내용을 담을 객체
        Category c = new Category(processedMember.getMemNo(),
                m.getSoccerPosition(), m.getSoccerSkill(), m.getFutsalPosition(),
                m.getFutsalSkill(), m.getBasketballPosition(), m.getBasketballSkill(),
                m.getBaseballPosition(), m.getBaseballSkill());
        System.out.println(c);
        result3 = memberDao.insertCategory(sqlSession, c);
        return result1 * result2 * result3;
    }

    /**
     * 구장 관리자 회원가입 및 구장 등록
     *
     * @param m
     * @param stadiumAttachmentImgs
     * @return
     */
    @Transactional
    @Override
    public int insertManagerMember(ManagerEnrollDto m, ArrayList<StadiumAttachment> stadiumAttachmentImgs) {
        int result1 = 0; // 멤버 insert 결과
        int result2 = 0; // 구장 insert 결과
        int result3 = 1; // 편의시설 insert 결과
        int result4 = 1; // 대여 물품 insert 결과
        int result5 = 1; // 구장 Attachment Insert 결과
        // 사용자 정보 결합
        String memBirth = m.getYear() + "." + m.getMonth() + "." + m.getDay(); // 생년월일 concatenate
        String memPhone = m.getPhone1() + "-" + m.getPhone2() + "-" + m.getPhone3(); // 전화번호
        String memAdd = m.getMemberBaseAdd() + ", " + m.getMemberDetailAdd();
        // 구장 주소 결합
        String stadiumAdd = m.getBaseAdd() + " " + m.getDetailAdd();

        // 멤버 객체 생성
        Member processedMember = new Member(m.getMemEmail(), m.getMemPwd(), m.getMemName(),
                m.getMemGender(), m.getMemberZipcode(), memAdd, memBirth, memPhone, "M");
        result1 = memberDao.insertMember(sqlSession, processedMember);

        // 구장 객체 생성
        Time sqlStartTime = null;
        Time sqlEndTime = null;
        // SQL Time으로 형변환
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        try {
            Date startTime = sdf.parse(m.getStartTime());
            Date endTime = sdf.parse(m.getEndTime());
            sqlStartTime = new Time(startTime.getTime());
            sqlEndTime = new Time(endTime.getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Stadium stadiumInfo = new Stadium(processedMember.getMemNo(), m.getStadiumName(), stadiumAdd, m.getZipcode(),
                m.getPrice(), m.getCategory(), sqlStartTime, sqlEndTime);
        result2 = stadiumDao.insertStadium(sqlSession, stadiumInfo);

        System.out.println("구장 inset : " + result2);
        // 편의 시설 객체 생성
        Amenities am = new Amenities();
        am.setStadiumNo(stadiumInfo.getStadiumNo());
        if (m.getAmenities() != null &&!m.getAmenities().isEmpty()) {
            for (String amenities : m.getAmenities()) {
                switch (amenities) {
                    case "toilet":
                        am.setToilet('Y');
                        break;
                    case "drink":
                        am.setDrink('Y');
                        break;
                    case "parkingLot":
                        am.setPark('Y');
                        break;
                    case "smoke":
                        am.setSmoke('Y');
                        break;
                    case "shower":
                        am.setShower('Y');
                        break;
                }
            }
            result3 = stadiumDao.insertAmenities(sqlSession, am);
        }
        System.out.println("am : " + am);

// 대여 물품 객체 생성
        Rental rental = new Rental();
        rental.setStadiumNo(stadiumInfo.getStadiumNo());
        if (m.getRental() != null && !m.getRental().isEmpty()) {
            for (String rentalEquipment : m.getRental()) {
                switch (rentalEquipment) {
                    case "ball":
                        rental.setBall('Y');
                        break;
                    case "vest":
                        rental.setVest('Y');
                        break;
                }
            }
            result4 = stadiumDao.insertRental(sqlSession, rental);
        }

        if (!stadiumAttachmentImgs.isEmpty()) {
            for (StadiumAttachment att : stadiumAttachmentImgs) {
                att.setStadiumNo(stadiumInfo.getStadiumNo());
            }
            System.out.println("stadiumAtt : " + stadiumAttachmentImgs);
            result5 = stadiumDao.insertStadiumAttachment(sqlSession, stadiumAttachmentImgs);
        }
        return result1 * result2 * result3 * result4 * result5;

    }

    /**
     * 이메일 중복 확인
     * @param email
     * @return
     */
    @Override
    public int emailCheck(String email) {
        return memberDao.selectEmail(sqlSession, email);
    }

    /**
     * 이메일 찾기
     * @param memInfo 기본 정보(memName, memBirth)
     * @return
     */
    @Override
    public String searchEmail(MemberEnrollDto memInfo) {
        String memBirth = memInfo.getYear() + "." + memInfo.getMonth() + "." + memInfo.getDay(); // 생년월일 concatenate
        Member m = new Member();
        m.setMemName(memInfo.getMemName());
        m.setMemBirth(memBirth);
        String email = memberDao.searchEmail(sqlSession, m);
        if(email != null){
//            int atIndex = email.indexOf('@');
//            String id = email.substring(0, atIndex);
//            String domain = email.substring(atIndex);
//            int middle = id.length() / 2;
//            String maskedEmail = id.substring(0, middle -1) + "**" + id.substring(middle + 1)
//                    + domain;
//            log.info("마스킹 이메일 : {}",maskedEmail);
//            return maskedEmail;
            return Template.maskingEmail(email);
        }
        return null;
    }

    /**
     * 임시 비밀번호로 비밀번호 수정
     * @param memInfo 기본 정보(memEmail, memName)
     * @return Update 성공 여부
     */
    @Override
    @Transactional
    public int updatePwd(MemberEnrollDto memInfo) {
        return memberDao.updatePwd(sqlSession,memInfo);
    }

    @Override
    public Map<Integer, Member> confirmMember(Member m) {
        // 핸드폰 번호로 기존 멤버 여부 확인
        Member resultMember = memberDao.confirmMember(sqlSession, m);
        log.info("resultMember : {}", resultMember);
        Map<Integer, Member> resultMap = new HashMap<>();
        if(resultMember == null){ // 기존 회원이 아닌 경우
            resultMap.put(1, null);
            return resultMap;
        }else if(resultMember.getMemEmail().equals(m.getMemEmail())){ // 기존 회원과 도메인이 동일한 경우
            resultMap.put(2, resultMember);
            return resultMap;
        }else{ // 존재는 하는데 도메인이 다른경우
            resultMap.put(3, resultMember);
            return resultMap;
        }
    }
}