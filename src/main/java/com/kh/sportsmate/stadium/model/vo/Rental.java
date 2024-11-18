package com.kh.sportsmate.stadium.model.vo;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.stadium.model.vo
 * fileName       : Rental
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
public class Rental {
    private int stadiumNo; // 구장 식별 번호
    private char ball; // 공 대여 여부
    private char vest; // 조끼 대여 여부
}
