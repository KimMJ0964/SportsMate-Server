package com.kh.sportsmate.member.model.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class ProfileFile {
	private int fileNo;
	private int memNo;
	private int teamNo;
	private String originName;
	private String changeName;
	private String filePath;
}
