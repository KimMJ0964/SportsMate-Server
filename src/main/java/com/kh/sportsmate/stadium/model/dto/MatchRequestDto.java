package com.kh.sportsmate.stadium.model.dto;

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
public class MatchRequestDto {
	
	private String accessDate; // 경기 날짜
	private String startTime; // 시작 시간
	private String endTime; // 종료 시간 
	private int stadiumNo;
	
}
