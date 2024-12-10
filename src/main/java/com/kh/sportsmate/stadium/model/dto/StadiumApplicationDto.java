package com.kh.sportsmate.stadium.model.dto;

import java.util.List;

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
public class StadiumApplicationDto {
	
	/* 팀 테이블 */
	private int teamNo; // 구단 번호
	private int teamLeaderNo; // 구단장 번호 (TEAM.MEM_NO)
	private String teamName; // 구단 이름
	private double score; // 구단 평점
	private int teamPoint; // 구단 점수
	
	/* 팀멤버 테이블 */
	private int tmemNo; // 팀멤버 번호 (TEAM_MEMBER.MEM_NO)
	private String status; // 멤버 상태 
	
	/* 멤버 테이블 */
	private String memName; // 멤버이름
}
