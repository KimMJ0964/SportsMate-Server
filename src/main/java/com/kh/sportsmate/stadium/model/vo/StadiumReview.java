package com.kh.sportsmate.stadium.model.vo;

import lombok.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class StadiumReview {
	private int reviewNo;
	private int stadiumNo;
	private int memNo;
	private double reviewStar;
	private String reviewContent;
	private Date reviewDate;
	
	public StadiumReview(String reviewContent, double reviewStar, int stadiumNo, int memNo) {
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.stadiumNo = stadiumNo;
		this.memNo = memNo;
	}
}