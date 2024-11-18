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
public class TeamBoard {
	private int boardNo;
	private int memNo;
	private int teamNo;
	private String title;
	private String content;
	private Date createDate;
	private Date modifyDate;
	private int view;
	private String status;
	private int likeCount;
	private String type;
	
	/* 조인*/
	private String memName;
}

