package com.kh.sportsmate.common.naverAPI;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Map;

import static com.kh.sportsmate.common.template.Template.get;

/**
 * packageName    : com.kh.sportsmate.common.naverAPI
 * fileName       : naverAPI
 * author         : jun
 * date           : 2024. 12. 2.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 12. 2.        jun       최초 생성
 */
@Slf4j
@Component
public class naverAPI {
    @Value("${sns.naver.clientId}")
    private String naverClientID;
    @Value("${sns.naver.clientSecret}")
    private String naverClientSecret;

    /**
     * 네이버 로그인을 위한 AccessToken 요청
     * @param authorizeCode 인가 코드
     * @param state
     * @param redirectURI
     * @return
     */
    public String getAccessToken(String authorizeCode, String state, String redirectURI){
        String accessToekn = "";
        String refreshToken = "";
        String reqURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";

        reqURL += "client_id=" + naverClientID;
        reqURL += "&client_secret=" + naverClientSecret;
        reqURL += "&redirect_uri=" + redirectURI;
        reqURL += "&code=" + authorizeCode;
        reqURL += "&state=" + state;
        log.info("URL : {}", reqURL);
        HttpURLConnection conn = Template.connect(reqURL);
        try {
            int responseCode = conn.getResponseCode();
            log.info("naver getAccessToken responseCode : {}", responseCode); // 응답 코드 로그 출력
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null){
                res.append(inputLine);
            }
            br.close();

            JsonObject totalObj = JsonParser.parseString(res.toString()).getAsJsonObject();
            accessToekn = totalObj.get("access_token").getAsString();
            refreshToken = totalObj.get("refresh_token").getAsString();
            log.info("naver accessToken : {}", accessToekn);
            log.info("naver re : {}", refreshToken);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return accessToekn;
    }

    /**
     * 네이버 사용자 정보 조회
     * @param accessToken 정보 조회를 위한 accessToken
     * @return Member 객체(memEmail, memName, memGender, memPhone, memBirth)
     */
    public Member getUserInfo(String accessToken){
        Member m = new Member();
        String header = "Bearer " + accessToken;
        String reqURL = "https://openapi.naver.com/v1/nid/me";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);

        String responseBody = get(reqURL, requestHeaders);
        JsonObject memberInfo = JsonParser.parseString(responseBody).getAsJsonObject();
        log.info("memberInfo : {}", memberInfo);
        memberInfo = memberInfo.getAsJsonObject("response");
        log.info("result : {}", memberInfo);
        String birthYear = memberInfo.get("birthyear").getAsString();
        String birthDay = memberInfo.get("birthday").getAsString().replace("-", ".");
        String birth = birthYear.concat(".").concat(birthDay);

        m.setMemName(memberInfo.get("name").getAsString());
        m.setMemEmail(memberInfo.get("email").getAsString());
        m.setMemGender(memberInfo.get("gender").getAsString());
        m.setMemPhone(memberInfo.get("mobile").getAsString());
        m.setMemBirth(birth);
        log.info("네이버 회원 정보 : {}", m);
        return m;
    }
}
