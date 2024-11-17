package com.kh.sportsmate.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class BoardFile {
	private int fileNo;
	private int refBoardNo;
	private int refTeamBoardNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String status;
	
	public BoardFile(int refBoardNo, String originName, String changeName, String filePath) {
		this.refBoardNo = refBoardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}
}
