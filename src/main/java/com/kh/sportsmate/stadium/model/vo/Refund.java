package com.kh.sportsmate.stadium.model.vo;

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
public class Refund {
	private int reservationNo;             // 예약 번호
    private String stadiumName;            // 경기장 이름
    private String stadiumImage;           // 경기장 이미지 파일 경로
    private String aTeamName;              // A팀 구단명
    private String aTeamProfileImage;      // A팀 구단 프로필 이미지 변경 파일명
    private String bTeamName;              // B팀 구단명
    private String bTeamProfileImage;      // B팀 구단 프로필 이미지 변경 파일명
    private String startTime;              // 경기 시작 시간
    private String endTime;                // 경기 종료 시간
    private int aTeamUserNo;               // A팀 유저 식별 번호
}
