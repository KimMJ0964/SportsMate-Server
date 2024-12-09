package com.kh.sportsmate.team.model.dto;

import java.util.ArrayList;

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
public class RankingDto {

	private int teamNo; // 팀 번호
	private String teamName; // 팀 이름
	private int teamPoint; // 팀 점수
	private String teamCategory; // 팀 카테고리
	
	// 이미지 관련 필드
	private int fileNo; // 파일 번호
	private String filePath; // 이미지 파일 경로
	private String changeName; // 변경된 이미지 파일 이름
}
