package com.kh.sportsmate.member.model.dto;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class MemberPositionDto {
	private int memNo;
    private String memEmail;
    private String memPwd;
    private String memName;
    private String memGender;
    private String memAdd;
    private String memBirth;
    private String memPhone;
    private double memSkillScore;
    private double memMannerScore;
    private Date memEnrollDate;
    private String memStatus;
    private int memAge;
    private String position;
    private String teamName;
    private String teamProfile;
    private String memberProfile;
    private double soccerAvgPoint;
    private double futsalAvgPoint;
    private double baseballAvgPoint;
    private double basketballAvgPoint;
}
