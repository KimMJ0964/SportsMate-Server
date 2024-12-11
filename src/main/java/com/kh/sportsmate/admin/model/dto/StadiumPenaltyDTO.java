package com.kh.sportsmate.admin.model.dto;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.admin.model.dto
 * fileName       : StadiumPenaltyDTO
 * author         : jun
 * date           : 2024. 12. 9.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 12. 9.        jun       최초 생성
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class StadiumPenaltyDTO {
    private int memNo;
    private int pnReporter;
    private int pnGround;
    private String pnContent;
    private int pnCount;
}
