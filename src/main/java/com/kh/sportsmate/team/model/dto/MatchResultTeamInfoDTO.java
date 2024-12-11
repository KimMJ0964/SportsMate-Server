package com.kh.sportsmate.team.model.dto;

import lombok.*;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * packageName    : com.kh.sportsmate.team.model.dto
 * fileName       : MatchResultTeamInfoDTO
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
public class MatchResultTeamInfoDTO {
    private int teamANo;
    private int teamBNo;
    private String teamAName;
    private String teamBName;
    private String teamAChangeName;
    private String teamBChangeName;
}
