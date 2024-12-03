package com.kh.sportsmate.stadium.model.vo;

import lombok.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class StadiumQna {
	private int matchQnaNo;
	private int qMemNo;
	private int stadiumNo;
	private String matchQTitle;
	private String matchQDetail;
	private String matchA;
	private Date matchQnaDate;
}
