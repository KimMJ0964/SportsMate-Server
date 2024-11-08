package com.kh.sportsmate.board.model.vo;

import lombok.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class Board {
	private int boardNo;
	private int memNo;
	private String title;
	private String content;
	private Date createDate;
	private Date modifyDate;
	private int view;
	private int likeCount;
	private String type;
	
	/* 조인*/
	private String memName;
}
