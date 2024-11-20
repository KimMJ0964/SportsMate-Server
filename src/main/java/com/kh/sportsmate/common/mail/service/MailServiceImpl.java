package com.kh.sportsmate.common.mail.service;

import com.kh.sportsmate.common.redis.service.RedisService;
import com.kh.sportsmate.common.template.Template;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * packageName    : com.kh.sportsmate.common.mail.service
 * fileName       : MailServiceImpl
 * author         : jun
 * date           : 2024. 11. 20.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 20.        jun       최초 생성
 */
@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService{
    @Autowired
    private final JavaMailSender sender;
    @Autowired
    private final RedisService redisService;

    /**
     * 이메일 인증번호 이메일 전송
     * @param email 인증 대상 이메일
     * @return 전송 성공/실패 여부
     */
    @Override
    public boolean sendAuthCodeMail(String email) {
        // 인증번호 발급(6자리)
        String authCode = Template.creatAuthCode();

        // redis에 발급된 인증번호 저장
        redisService.setCode(email, authCode);

        try {
            MimeMessage message = sender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");

            helper.setSubject("SportsMate 이메일 인증");
            helper.setTo(email);

            // HTML 내용 설정
            String body = "<h3>요청하신 인증 번호입니다.</h3>";
            body += "<h1>" + authCode + "</h1>";
            body += "<h3>감사합니다.</h3>";

            helper.setText(body, true); // true로 설정하면 HTML로 처리

            sender.send(message);
            return true;
        } catch (MailException | MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 인증번호 검증
     * @param email 검증 대상 이메일
     * @param inputAuthCode 검증 대상 인증번호
     * @return 인증코드 비교 결과
     */
    @Override
    public boolean checkAuthCode(String email, String inputAuthCode) {
        String redisAuthCode = redisService.getCode(email);
        if(redisAuthCode.equals(inputAuthCode)){
            return true;
        }
        return false;
    }
}
