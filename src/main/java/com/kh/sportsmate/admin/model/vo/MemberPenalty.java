package com.kh.sportsmate.admin.model.vo;

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
public class MemberPenalty {
	private int memNo;
	private String pnContent;
	private Date pnDate;
	private int pnCount;
	private String pnReporter;
	private String pnGround;
	private String pnCommunity;
	private String pnComment;
	private String pnType;
	
}
