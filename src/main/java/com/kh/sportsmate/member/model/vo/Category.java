package com.kh.sportsmate.member.model.vo;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.member.model.vo
 * fileName       : Category
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
public class Category {
    private int memNo;              // 사용자 식별 번호
    private String socPosition;     // 축구 포지션
    private String socSkill;        // 축구 실력
    private String futPosition;     // 풋살 포지션
    private String futSkill;        // 풋살 실력
    private String basketPosition;  // 농구 포지션
    private String basketSkill;     // 농구 실력
    private String basePosition;    // 야구 포지션
    private String baseSkill;       // 야구 실력

}
