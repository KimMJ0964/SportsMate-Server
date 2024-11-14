package com.kh.sportsmate.stadium.model.vo;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.stadium.model.vo
 * fileName       : Amenities
 * author         : jun
 * date           : 2024. 11. 13.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 13.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class Amenities {
    private int stadiumNo; // 구장 식별 번호
    private char drink; // 자판기 여부
    private char toilet; // 화장실 여부
    private char shower; // 샤워실 여부
    private char smoke; // 흡연실 여부
    private char park; // 주차장 여부
}
