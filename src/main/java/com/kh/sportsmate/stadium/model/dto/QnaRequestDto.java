package com.kh.sportsmate.stadium.model.dto;

import java.sql.Date;

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
public class QnaRequestDto {
	
	private int qMemNo;         // 선수 식별 번호
    private int stadiumNo;      // 경기장 번호
    private String matchQTitle; // 문의 제목
    private String matchQDetail;// 문의 내용
}
