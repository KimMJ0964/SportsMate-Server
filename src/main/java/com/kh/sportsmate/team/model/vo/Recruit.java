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
public class Recruit {
	private int applicationNo;
	private int teamNo;
	private int memNo;
	private String approveOrNot;
	private Date applicationDate;
	private String introduce;
}
