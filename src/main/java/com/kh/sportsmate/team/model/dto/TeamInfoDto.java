package com.kh.sportsmate.team.model.dto;

import java.sql.Date;
import java.util.ArrayList;

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
public class TeamInfoDto {
	private int teamNo;
	private int memNo;
	private String teamName;
	private String teamDescription;
	private int teamMaxPerson;
	private String teamCategory;
	private String activityTime;
	private String activityArea;
	private String status;
	private double score;
	private int teamPoint;
	private Date teamEnrollDate;
	private String application;
	private char monday;
	private char tuesday;
	private char wednesday;
	private char thursday;
	private char friday;
	private char saturday;
	private char sunday;
	 private ArrayList activityDays;
}
