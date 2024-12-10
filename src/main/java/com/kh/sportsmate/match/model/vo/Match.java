package com.kh.sportsmate.match.model.vo;

import java.sql.Date;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class Match {
	private int matchNo;
	private int stadiumNo;
	private int teamANo;
	private int teamBNo;
	private int scoreA;
	private int scoreB;
	private String category;
	private String reservStart;
	private String reservEnd;
	private String accessDate;
}
