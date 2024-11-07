package com.kh.sportsmate.service;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Transactional(readOnly = true)
public class MemberServiceImpl implements MemberService {
    private final SqlSessionTemplate sqlSession;
    private final MemberDao memberDao;

    public MemberServiceImpl(SqlSessionTemplate sqlSession, MemberDao memberDao) {
        this.sqlSession = sqlSession;
        this.memberDao = memberDao;
    }

    @Override
    public Member loginMember(Member m) {
        return memberDao.loginMember(sqlSession,m);
    }

    @Transactional
    @Override
    public int insertMember(MemberEnrollDto m, Profile profile) {
        int result1 = 0;
        int result2 = 1;
        int result3 = 0;
        String memBirth = m.getYear() + "." + m.getMonth() + "." + m.getDay(); // 생년월일 concatenate
        String memPhone = m.getPhone1() + "-" + m.getPhone2() + "-" + m.getPhone3(); // 전화번호
        Member processedMember = new Member(m.getMemEmail(), m.getMemPwd(), m.getMemName(),
                m.getMemGender(), m.getMemAdd(), memBirth, memPhone, "Y");
        result1 = memberDao.insertMember(sqlSession, processedMember);

        System.out.println("memNo : " + processedMember.getMemNo());
        if (profile != null) {
            profile.setMemNo(processedMember.getMemNo());
            result2 = memberDao.insertProfile(sqlSession, profile);
        }

        // 종목 관련 내용을 담을 객체
        Category c = new Category(processedMember.getMemNo(),
                m.getSoccerPosition(), m.getSoccerSkill(), m.getFutsalPosition(),
                m.getFutsalSkill(), m.getBasketballPosition(), m.getBasketballSkill(), m.getBasketballPosition(), m.getBasketballSkill());
        System.out.println(c);
        result3 = memberDao.insertCategory(sqlSession, c);
        return result1 * result2 * result3;
    }
}
