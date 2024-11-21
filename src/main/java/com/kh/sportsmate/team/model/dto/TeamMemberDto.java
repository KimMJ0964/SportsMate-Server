package com.kh.sportsmate.team.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 마이페이지 팀 정보 가져오는 DTO
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class TeamMemberDto {
	private int teamNo;
	private int memNo;
	private String status;
	private Date memEnrollDate;
	
	private String ability;
	private String position;
	private String memName;
}
