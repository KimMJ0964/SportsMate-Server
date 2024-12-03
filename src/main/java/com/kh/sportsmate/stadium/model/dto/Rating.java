package com.kh.sportsmate.stadium.model.dto;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.stadium.model.dto
 * fileName       : Rating
 * author         : jun
 * date           : 2024. 12. 3.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 12. 3.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class Rating {
    private String memNo;
    private String skill;
    private String manner;
}
