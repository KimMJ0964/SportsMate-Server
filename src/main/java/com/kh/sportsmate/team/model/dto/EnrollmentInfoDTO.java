package com.kh.sportsmate.team.model.dto;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.team.model.dto
 * fileName       : EnrollmentInfoDTO
 * author         : jun
 * date           : 2024. 12. 8.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 12. 8.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class EnrollmentInfoDTO {
    private boolean soccer;
    private boolean futsal;
    private boolean basketball;
    private boolean baseball;

    public EnrollmentInfoDTO() {
        this.soccer = false;
        this.futsal = false;
        this.basketball = false;
        this.baseball = false;
    }
}
