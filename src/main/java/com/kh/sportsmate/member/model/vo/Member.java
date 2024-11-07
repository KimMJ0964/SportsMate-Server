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
    private String memAdd;
    private int memAge;
    private String memPhone;
    private double memRank;
    private Date memEnrollDate;
    private String memStatus;
}
