package com.kh.sportsmate.common.mail.controller;

import com.kh.sportsmate.common.mail.service.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * packageName    : com.kh.sportsmate.common.mail.controller
 * fileName       : MailController
 * author         : jun
 * date           : 2024. 11. 20.
 * description    : mail 전송 관련 REST 컨트롤러
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 20.        jun       최초 생성
 */
@RestController
@RequiredArgsConstructor
public class MailController {
    @Autowired
    private final MailService mailService;

    /**
     * 인증번호 이메일 전송
     * @param email 인증 대상 이메일
     * @return 전송 여부
     */
    @PostMapping(value = "sendMail.mi")
    public String emailAuth(@RequestParam(value = "email") String email){
        boolean result = mailService.sendAuthCodeMail(email);
        if(result){
            return "NNNNY";
        }else {
            return "NNNNN";
        }

    }

    /**
     * 인증번호 확인
     * @param email 인증 대상 이메일
     * @param inputAuthCode 입력한 인증번호
     * @return 일증번호 일치 여부
     */
    @PostMapping(value = "checkAuthCode.mi")
    public String checkAuthCode(@RequestParam(value = "email") String email, @RequestParam(value = "inputAuthCode") String inputAuthCode){
        if(mailService.checkAuthCode(email,inputAuthCode)){
            return "NNNNY";
        }
        return "NNNNN";
    }
}
