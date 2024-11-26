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
public class TeamBoardCommentDto {
	private int comNo;
	private int refTeamBoardNo;
	private int memNo;
	private Date comCreateDate;
	private Date comModifyDate;
	private String status;
	private int comParentNo;
	private String comContent;
	
	/* 조인 */
	private String memName;
	private String changeName;
}