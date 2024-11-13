package com.kh.sportsmate.member.model.dto;

import lombok.*;

import java.util.List;

/**
 * packageName    : com.kh.sportsmate.member.model.dto
 * fileName       : ManagerEnrollDto
 * author         : jun
 * date           : 2024. 11. 13.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 13.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class ManagerEnrollDto {
    private String memEmail;
    private String memPwd;
    private String memName;
    private String memGender;
    private String year;
    private String month;
    private String day;
    private String phone1;
    private String phone2;
    private String phone3;
    private String memAdd; // 수정 필요
    private String category;
    private String stadiumName;
    private int zipcode;
    private String baseAdd;
    private String detailAdd;
    private int price;
    private String startTime;
    private String endTime;
    private List<String> amenities;
    private List<String> rental;
}
