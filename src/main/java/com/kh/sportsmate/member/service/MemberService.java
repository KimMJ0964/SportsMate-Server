package com.kh.sportsmate.member.service;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.member.model.dto.ManagerEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.vo.Member;

import java.util.ArrayList;

/**
 * packageName    : com.kh.sportsmate.service
 * fileName       : MemberService
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
public interface MemberService {
    // 로그인
    Member loginMember(Member m);

    // 사용자 회원가입
    int insertMember(MemberEnrollDto m, Profile profile);

    // 구장 관리자 회원가입
    int insertManagerMember(ManagerEnrollDto m, ArrayList<StadiumAttachment> stadiumAttachmentImgs);

    // email 중복 검사
    int emailCheck(String email);
}
