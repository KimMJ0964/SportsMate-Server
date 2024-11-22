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
public class MyTeamDto {
	private int teamNo;
	private int memNo;
	private String teamName;
	private String teamDescription;
	private int teamMaxPerson;
	private String teamCategory;
	private String activityDays;
	private String activityTime;
	private String activityArea;
	private String status;
	private double score;
	private int teamPoint;
	private Date teamEnrollDate;
	private String application; // 모집 여부
	
	private String memName;
	private int teamMemberCount;
	private String teamProfile;
}
