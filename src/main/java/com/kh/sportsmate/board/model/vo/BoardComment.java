package com.kh.sportsmate.board.model.vo;

import lombok.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class BoardComment {
	private int comNo;
	private int refBoardNo;
	private int memNo;
	private Date comCreateDate;
	private Date comModifyDate;
	private String status;
	private int comParentNo;
	private String comContent;
	
	/* 조인 */
	private String memName;
}
