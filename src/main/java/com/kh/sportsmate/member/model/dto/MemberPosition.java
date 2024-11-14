package com.kh.sportsmate.member.model.dto;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class MemberPosition {
	private int memNo;
    private String memEmail;
    private String memPwd;
    private String memName;
    private String memGender;
    private String memAdd;
    private String memBirth;
    private String memPhone;
    private double memRank;
    private Date memEnrollDate;
    private String memStatus;
    private int memAge;
    private String position;
}
