package com.kh.sportsmate.team.model.dto;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.team.model.dto
 * fileName       : RecruitDetailDto
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
public class RecruitDetailDto {
    private int teamNo;
    private String teamName;
    private String teamCategory;
    private int memberCount;
    private String activityArea;
    private String teamDescription;
    private String teamProfileChangeName;
    private String thumbnailChangeName;
}
