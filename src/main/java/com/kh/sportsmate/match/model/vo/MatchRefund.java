package com.kh.sportsmate.match.model.vo;
import java.sql.Date;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class MatchRefund {
	private int refundNo;
	private int matchNo;
	private Date refundDate;
	private String refundContent;
	private int refundPrice;
	private String status;
}
