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
    private String stadiumAddress; // 구장 주소
    private String stadiumZipcode; // 구장 우편번호
    private double stadiumScore; // 구장 평점
    private int stadiumPrice; // 구장 한 세션 이용요금
    private String stadiumCategory; // 구장 종목
    private String stadiumStartTime; // 구장 운영 시작 시간
    private String stadiumEndTime; // 구장 운영 종료 시간
    private String status; // 구장 상태
    private String selectedDate; // 날짜 가져오기
    private String activityArea; // 지역코드

    public StadiumSearch(String stadiumName, String stadiumAddress, String stadiumCategory, 
    		String stadiumStartTime, String stadiumEndTime, String selectedDate, String activityArea) {
    	this.stadiumName = stadiumName;
    	this.stadiumAddress = stadiumAddress;
    	this.stadiumCategory = stadiumCategory;
    	this.stadiumStartTime = stadiumStartTime;
    	this.stadiumEndTime = stadiumEndTime;
    	this.selectedDate = selectedDate;
    	this.activityArea = activityArea;
    }
}

