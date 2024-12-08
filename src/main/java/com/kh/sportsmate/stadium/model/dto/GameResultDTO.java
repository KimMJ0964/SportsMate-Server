package com.kh.sportsmate.stadium.model.dto;

import lombok.*;

import java.util.List;

/**
 * packageName    : com.kh.sportsmate.stadium.model.dto
 * fileName       : GameResultDTO
 * author         : jun
 * date           : 2024. 12. 3.
 * description    : 경기 결과 DTO
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
public class GameResultDTO {
    private List<Rating> ratings;
    private TeamScore teamScore;
    private String matchNo;
}
