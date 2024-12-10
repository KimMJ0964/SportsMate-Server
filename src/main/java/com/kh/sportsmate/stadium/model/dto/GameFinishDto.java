package com.kh.sportsmate.stadium.model.dto;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class GameFinishDto {
	private int matchNo;        // 경기 번호
    private String aaTeamImage;  // A팀 이미지
    private String bbTeamImage;  // B팀 이미지
    private String aaTeamName;   // A팀 이름
    private String bbTeamName;   // B팀 이름
    private String reservStart; // 경기 시작 시간
    private String reservEnd;   // 경기 종료 시간
    private String accessDate;  // 예약 날짜

}
