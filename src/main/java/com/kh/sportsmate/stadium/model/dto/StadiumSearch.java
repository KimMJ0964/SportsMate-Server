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
public class StadiumSearch {
    private int stadiumNo; // 구장 식별 번호
    private int memNo; // 구장 관리자 번호
    private String stadiumName; // 구장명
    private String stadiumAdd; // 구장 주소
    private String stadiumZipcode; // 구장 우편번호
    private double stadiumScore; // 구장 평점
    private int stadiumPrice; // 구장 한 세션 이용요금
    private String stadiumCategory; // 구장 종목
    private Time stadiumStartTime; // 구장 운영 시작 시간
    private Time stadiumEndTime; // 구장 운영 종료 시간
    private String status; // 구장 상태
    private String selectedDate; // 날짜 가져오기

    public StadiumSearch(String stadiumName, String stadiumAdd, double stadiumScore, String stadiumCategory, 
    		Time stadiumStartTime, Time stadiumEndTime, String selectedDate, String status) {
    	this.stadiumName = stadiumName;
    	this.stadiumAdd = stadiumAdd;
    	this.stadiumScore = stadiumScore;
    	this.stadiumCategory = stadiumCategory;
    	this.stadiumStartTime = stadiumStartTime;
    	this.stadiumEndTime = stadiumEndTime;
    	this.selectedDate = selectedDate;
    	this.status = status;
    }

}

