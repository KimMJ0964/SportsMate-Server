package com.kh.sportsmate.match.model.vo;

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
public class MatchBest {
	private int matchNo;
	private int memNo;
	private int memNoVoteCount;
	private String voteStatus;
	private int teamNo;
	
	public MatchBest (int memNo, int matchNo) {
		this.memNo = memNo;
		this.matchNo = matchNo;
	}
}
