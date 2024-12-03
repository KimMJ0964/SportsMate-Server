package com.kh.sportsmate.stadium.model.dto;

import lombok.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class StadiumQnaDto {
	private int matchQnaNo;
	private int qMemNo;
	private int stadiumNo;
	private String matchQTitle;
	private String matchQDetail;
	private String matchA;
	private String stadiumName;
	private Date matchQnaDate;
}
