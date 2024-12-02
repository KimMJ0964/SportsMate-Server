package com.kh.sportsmate.team.model.dto;

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
public class TeamMatchInfoDto {
	private int myTeamNo;
	private int enemyTeamNo;
	private int myScore;
	private int enemyScore;
	private int myTeamPoint;
	private int enemyTeamPoint;
	private int matchNo;
	private String myTeamName;
	private String enemyTeamName;
	private String myTeamProfile;
	private String enemyTeamProfile;
	private String stadiumName;
	private String status;
}
