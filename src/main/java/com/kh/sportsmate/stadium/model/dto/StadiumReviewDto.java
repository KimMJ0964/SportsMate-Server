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
public class StadiumReviewDto {
	private int reviewNo;
	private int stadiumNo;
	private int memNo;
	private String memName;
	private double reviewStar;
	private String reviewContent;
	private Date reviewDate;
}
