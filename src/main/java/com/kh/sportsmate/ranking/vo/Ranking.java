package com.kh.sportsmate.ranking.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Ranking {
	private String teamName;
	private int teamPoint;
	private int rank;
}
