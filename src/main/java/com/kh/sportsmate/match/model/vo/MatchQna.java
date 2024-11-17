package com.kh.sportsmate.match.model.vo;
import java.sql.Date;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class MatchQna {
	private int matchQnaNo;
	private int matchNo;
	private int qMemNo;
	private int aMemNo;
	private String matchQTitle;
	private String matchQDetail;
	private String matchA;
	private String qnaDate;
}
