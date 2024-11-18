package com.kh.sportsmate.board.model.dto;
import lombok.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class BoardMemberPanalty {
	private int pnNo;
	private int memNo;
	private String pnContent;
	private Date pnDate;
	private Date repDate;
	private int pnCount;
	private int pnReporter;
	private int pnGround;
	private int pnCommunity;
	private int pnComment;
	private String pnType;
	
	public BoardMemberPanalty(String pnContent, int pnCommunity) {
		this.pnContent = pnContent;
		this.pnCommunity = pnCommunity;
	}
	
	public BoardMemberPanalty(String pnContent, int pnCommunity, int pnComment) {
		this.pnContent = pnContent;
		this.pnCommunity = pnCommunity;
		this.pnComment = pnComment;
	}
}
