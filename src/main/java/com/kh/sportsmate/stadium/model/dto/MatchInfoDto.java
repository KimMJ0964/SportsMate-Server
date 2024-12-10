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
public class MatchInfoDto {
	/* 팀 테이블 정보 */
    private String teamName;   // A팀 이름
    private double score;      // A팀 평점
    private int teamPoint;     // A팀 점수

    /* 매치 테이블 정보 */
    private int matchNo;       // 매치 번호
    private int teamANo;       // A팀 번호
    private Time reservStart; // 예약 시작 시간 (HH:mm 형식)
    private Time reservEnd;   // 예약 종료 시간 (HH:mm 형식)
    private Date accessDate;  // 승인 날짜 (YYYY-MM-DD 형식)
}
