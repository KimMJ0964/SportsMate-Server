package com.kh.sportsmate.place.model.vo;

import lombok.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class PlaceReview {
	private int reviewNo;
	private int placeNo;
	private int memNo;
	private double reviewStar;
	private String reviewContent;
	private Date reviewDate;
	
	public PlaceReview(String reviewContent, double reviewStar, int placeNo, int memNo) {
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.placeNo = placeNo;
		this.memNo = memNo;
	}
}
