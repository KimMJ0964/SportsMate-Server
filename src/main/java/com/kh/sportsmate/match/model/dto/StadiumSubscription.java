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
	private String stadiumAddress; //경기장 주소
	private String stadiumName; //경기장 이름
	private String matchDay; //경기일
	private String opponent; //상대팀
	private String teamName; //a팀 이름
	private String result; //a팀 전적
	private String category; //종목명
	private String referee; //심판명
	private int price; //가격
	private String payment; //결제수단
}