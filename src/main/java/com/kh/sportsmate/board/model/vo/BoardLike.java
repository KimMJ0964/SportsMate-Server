package com.kh.sportsmate.board.model.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class BoardLike {
	private int boardNo;
	private int memNo;
	private String status;
}
