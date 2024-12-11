package com.kh.sportsmate.stadium.model.vo;

import lombok.*;

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
public class Schedule {
	private int stadiumNo; // 구장 식별 번호
	private Time stadiumStartTime; // 구장 운영 시작 시간
    private Time stadiumEndTime;
	private Date accessDate;

}
