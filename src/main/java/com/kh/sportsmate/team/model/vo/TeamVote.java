package com.kh.sportsmate.team.model.vo;

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
public class TeamVote {
	private int voteNo;
	private int teamNo;
	private String status;
	private String voteTitle;
	private String voteOne;
	private String voteTwo;
	private String voteThree;
	private String voteFour;
	private String voteFive;
}
