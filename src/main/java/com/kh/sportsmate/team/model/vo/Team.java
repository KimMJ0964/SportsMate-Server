package com.kh.sportsmate.team.model.vo;

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
public class Team {
	private int teamNo;
	private String teamName;
	private String teamExplan;
	private int teamMaxPerson;
	private String teamType;
	private String activityDays;
	private String activityTime;
	private String activityArea;
	private String status;
	private double score;
	private int teamPoint;
	private Date teamEnrollDate;
	private String application;
	private int memNo;
}
