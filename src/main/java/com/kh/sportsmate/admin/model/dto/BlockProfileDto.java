package com.kh.sportsmate.admin.model.dto;

import java.sql.Date;

import com.kh.sportsmate.Attachment.model.vo.Profile;

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
public class BlockProfileDto {
	private int pnNo;
	private int memNo;
	private String memEmail;
	private Date pnDate;
	private int pnCount;
	private String pnContent;
	private String originName;
    private String changeName;
    private String filePath;
}
