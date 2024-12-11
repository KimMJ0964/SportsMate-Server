package com.kh.sportsmate.stadium.model.dto;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.stadium.model.dto
 * fileName       : MatchResultMemberInfoDTO
 * author         : jun
 * date           : 2024. 12. 10.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 12. 10.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MatchResultMemberInfoDTO {
    private int teamNo;
    private int memNo;
    private String memName;
}
