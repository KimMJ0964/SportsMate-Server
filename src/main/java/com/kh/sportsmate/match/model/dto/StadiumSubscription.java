package com.kh.sportsmate.match.model.dto;

import java.sql.Date;
import java.sql.Time;

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
public class StadiumSubscription { // 신청하기
	private int stadiumNo;
	private int memNoA;
	private int memNoB;
	private int stadiumPrice;
	private String selectedDate;
	private String stadiumStartTime;
	private String stadiumEndTime;

}