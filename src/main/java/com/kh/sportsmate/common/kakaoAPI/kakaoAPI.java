package com.kh.sportsmate.common.kakaoAPI;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.*;
import java.net.*;


/**
 * packageName    : com.kh.sportsmate.common.kakaoAPI
 * fileName       : kakaoAPI
 * author         : jun
 * date           : 2024. 11. 29.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 29.        jun       최초 생성
 */
@Slf4j
@Component
public class kakaoAPI {
    @Value("${sns.kakao.clientId}")
    private String clientId;
    @Value("${sns.kakao.redirectURI}")
    private String redirectURI;

    /**
     * 카카오 로그인을 위한 AccessToken 요청 API
     *
     * @param authorizeCode 인가 코드
     * @return accessToken
     */
    public String getAccessToken(String authorizeCode) {
        String accessToken = "";
        String refreshToken = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            HttpURLConnection conn = Template.connect(reqURL);

            conn.setRequestMethod("POST");
            conn.setDoOutput(true); // OutputStream으로 POST 데이터를 넘겨주겠다는 옵션(default : false)

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=" + clientId);
            sb.append("&redirect_uri=" + redirectURI);
            sb.append("&code=" + authorizeCode);
            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();
            log.info("kakao getAccessToken responseCode : {}", responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine = "";
            String res = "";

            while ((inputLine = br.readLine()) != null) {
                res += inputLine;
            }
            log.info("response body : {}", res);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(res);

            accessToken = element.getAsJsonObject().get("access_token").getAsString();
            refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + accessToken);
            System.out.println("refresh_token : " + refreshToken);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return accessToken;
    }

    /**
     * 카카오 사용자 정보 조회 API
     *
     * @param accessToken 정보 조회를 위한 accessToken
     * @return Member 객체(memEmail, memName, memGender, memPhone, memBirth)
     */
    public Member getUserInfo(String accessToken) {
        Member m = new Member();
        String apiURL = "https://kapi.kakao.com/v2/user/me";

        HttpURLConnection conn = Template.connect(apiURL);
        try {
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

            int responseCode = conn.getResponseCode();
            log.info("카카오 getUserInfo 응답 코드 : {}", responseCode);

            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            }

            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            String result = res.toString();
            log.info("카카오 getUser responseBody : {}", result);
            JsonObject totalObj = JsonParser.parseString(result).getAsJsonObject();
            JsonObject kakaoAccount = totalObj.getAsJsonObject().get("kakao_account").getAsJsonObject();
            log.info("kakaoAccount : {}", kakaoAccount);

            String phoneNum = kakaoAccount.get("phone_number").getAsString().replace("+82 ", "0");
            String birthYear = kakaoAccount.get("birthyear").getAsString();
            String birthDay = kakaoAccount.get("birthday").getAsString().substring(0, 2) + "." + kakaoAccount.get("birthday").getAsString().substring(2);
            String birth = birthYear.concat(".").concat(birthDay);
            String gender;
            if (kakaoAccount.has("gender")) {
                gender = kakaoAccount.get("gender").getAsString();
                m.setMemGender((gender.equals("male") ? "M" : "F"));
            }

            m.setMemEmail(kakaoAccount.get("email").getAsString());
            m.setMemName(kakaoAccount.get("name").getAsString());
            m.setMemPhone(phoneNum);
            m.setMemBirth(birth);

            log.info("카카오에서 가져온 member 정보 : {}", m);

            br.close();
        } catch (ProtocolException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return m;
    }


}
