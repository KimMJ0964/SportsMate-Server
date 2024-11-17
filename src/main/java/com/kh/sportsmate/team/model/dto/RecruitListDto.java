package com.kh.sportsmate.team.model.dto;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.team.model.dto
 * fileName       : RecruitListDto
 * author         : jun
 * date           : 2024. 11. 17.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 17.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class RecruitListDto {
    private int teamNo;
    private String teamName;
    private String activityArea;
    private String filePath;
    private String changeName;
    private int teamMemberCount;

}
