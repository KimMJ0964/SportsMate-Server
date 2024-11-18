package com.kh.sportsmate.team.model.dto;

import java.sql.Date;

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
public class TeamMemberInfo {
	private int teamNo;
	private int memNo;
	private String status;
	private Date memEnrollDate;
	
	private String ability;
	private String position;
	private String memName;
}
