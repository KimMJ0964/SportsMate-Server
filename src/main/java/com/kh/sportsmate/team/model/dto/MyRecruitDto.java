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
public class MyRecruitDto {
	private int applicationNo;
	private int teamNo;
	private int memNo;
	private String approveOrNot;
	private Date applicationDate;
	private String introduce;
	
	private String teamName;
	private String memName;
	private int memAge;
	private String memGender;
	private String ability;
	private String position;
	private double memRank;
	private String memberProfile;
	private String teamProfile;
}
