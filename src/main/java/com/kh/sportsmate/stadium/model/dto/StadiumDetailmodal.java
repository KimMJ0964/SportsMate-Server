package com.kh.sportsmate.stadium.model.dto;

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
public class StadiumDetailmodal {
	// team 정보
	private int teamNo; // 구단 번호
	private int tmemNo; // 구단장 번호
	private String teamName; // 팀 이름
	private double Score; // 구단 평점
	private int teamPoint; // 구단 점수
	
	// team member 
	private int memNo; // 멤버 번호
	private String Status; // 멤버 상태
	
	// member 정보
	private String memName; // 멤버 이름
	
	// 추가: Match 관련 정보
    private int matchNo; // 매치 번호
    private int teamANo; // A팀 번호 (매칭 시 A팀만 저장)
    private String category; // 경기 카테고리
    private Time reservStart; // 예약 시작 시간
    private Time reservEnd; // 예약 종료 시간
    private Date accessDate; // 승인 날짜
}
