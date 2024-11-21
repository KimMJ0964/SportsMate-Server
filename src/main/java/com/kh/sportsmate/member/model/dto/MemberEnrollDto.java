package com.kh.sportsmate.member.model.dto;

import lombok.*;

import java.util.List;

/**
 * packageName    : com.kh.sportsmate.member.model.dto
 * fileName       : MemberEnroll
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class MemberEnrollDto {
	private int memNo;                  // 사용자 식별 번호
    private String memEmail;            // 이메일
    private String memPwd;              // 비밀번호
    private String memName;             // 이름
    private String memGender;           // 성별
    private String year;                // 생년원일(연도)
    private String month;               // 생년원일(월)
    private String day;                 // 생년원일(일)
    private String phone1;              // 핸드폰 번호(앞자리)
    private String phone2;              // 핸드폰 번호(중간)
    private String phone3;              // 핸드폰 번호(끝)
    private String memberZipcode;       // 멤버 우편번호
    private String memberBaseAdd;       // 멤버 기본 주소
    private String memberDetailAdd;     // 멤버 상세 주소
    private List<String> category;      // 선택 종목
    private String soccerPosition;      // 축구 포지션
    private String soccerSkill;         // 축구 실력
    private String futsalPosition;      // 풋살 포지션
    private String futsalSkill;         // 풋살 실력
    private String basketballPosition;  // 농구 포지션
    private String basketballSkill;     // 농구 실력
    private String baseballPosition;    // 야구 포지션
    private String baseballSkill;       // 야구 실력
}
