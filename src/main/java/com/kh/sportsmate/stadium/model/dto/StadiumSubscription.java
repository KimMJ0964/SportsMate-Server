package com.kh.sportsmate.stadium.model.dto;

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
	private int memNo;
	private int stadiumPrice;
	private String selectedDate;
	private Time stadiumStartTime;
    private Time stadiumEndTime;
    
}
