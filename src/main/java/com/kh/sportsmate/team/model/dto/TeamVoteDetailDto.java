package com.kh.sportsmate.team.model.dto;

import com.kh.sportsmate.team.model.vo.TeamVote;

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
public class TeamVoteDetailDto {
	private int voteNo;
	private int teamNo;
	private String status;
	private String voteTitle;
	private String voteOne;
	private String voteTwo;
	private String voteThree;
	private String voteFour;
	private String voteFive;
	private String voteContent;
	private String memNo;
	private int check;
	private int mostVotedOption;
	private int selectCount;
}
