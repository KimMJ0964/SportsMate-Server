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
	private double reviewStart;
	private String reviewContent;
	private Date reviewDate;
}
