package com.kh.sportsmate.common.mail.service;

import com.kh.sportsmate.member.model.dto.MemberEnrollDto;

/**
 * packageName    : com.kh.sportsmate.common.mail.service
 * fileName       : MailService
 * author         : jun
 * date           : 2024. 11. 20.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 20.        jun       최초 생성
 */

public interface MailService {
    // 인증번호 메일 전송
    boolean sendAuthCodeMail(String email);
    // 인증번호 검증
    boolean checkAuthCode(String email, String inputAuthCode);

    boolean tmpPwdIssue(String encPwd, String email);
}
