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
public class RecruitListQueryStringDto {
    private String category;
    private String searchArea;
    private String filter;
    private int page;
}
