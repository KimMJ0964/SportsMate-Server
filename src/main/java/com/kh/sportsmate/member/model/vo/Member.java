package com.kh.sportsmate.member.model.vo;

import lombok.*;

import java.sql.Date;

/**
 * packageName    : com.kh.sportsmate.member.model.dao
 * fileName       : Member
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class Member {
    private int memNo;
    private String memEmail;
    private String memPwd;
    private String memName;
    private String memGender;
    private String memZipcode;
    private String memAdd;
    private String memBirth;
    private String memPhone;
    private double memRank;
    private Date memEnrollDate;
    private String memStatus;

    public Member(String memEmail, String memPwd, String memName, String memGender, String memZipcode, String memAdd, String memBirth, String memPhone, String memStatus) {
        this.memEmail = memEmail;
        this.memPwd = memPwd;
        this.memName = memName;
        this.memGender = memGender;
        this.memZipcode = memZipcode;
        this.memAdd = memAdd;
        this.memBirth = memBirth;
        this.memPhone = memPhone;
        this.memStatus = memStatus;
    }
}


