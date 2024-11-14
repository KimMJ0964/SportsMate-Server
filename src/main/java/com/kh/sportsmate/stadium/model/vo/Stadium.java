package com.kh.sportsmate.stadium.model.vo;

import lombok.*;

import java.sql.Time;

/**
 * packageName    : com.kh.sportsmate.stadium.model.vo
 * fileName       : Stadium
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
public class Stadium {
    private int stadiumNo; // 구장 식별 번호
    private int memNo; // 구장 관리자 번호
    private String stadiumName; // 구장명
    private String stadiumAdd; // 구장 주소
    private String stadiumZipcode; // 구장 우편번호
    private double stadiumScore; // 구장 평점
    private int stadiumPrice; // 구장 한 세션 이용요금
    private String stadiumCategory; // 구장 종목
    private Time stadiumStartTime; // 구장 운영 시작 시간
    private Time stadiumEndTime; // 구장 운영 종료 시간
    private String status; // 구장 상태

    public Stadium(int memNo, String stadiumName, String stadiumAdd, String stadiumZipcode, int stadiumPrice,
                   String stadiumCategory, Time stadiumStartTime, Time stadiumEndTime) {
        this.memNo = memNo;
        this.stadiumName = stadiumName;
        this.stadiumAdd = stadiumAdd;
        this.stadiumZipcode = stadiumZipcode;
        this.stadiumPrice = stadiumPrice;
        this.stadiumCategory = stadiumCategory;
        this.stadiumStartTime = stadiumStartTime;
        this.stadiumEndTime = stadiumEndTime;
    }

    public Stadium(String stadiumZipcode, String stadiumName, String stadiumAdd, String stadiumCategory, Time stadiumStartTime, Time stadiumEndTime, int stadiumPrice) {
        this.stadiumZipcode = stadiumZipcode;
        this.stadiumName = stadiumName;
        this.stadiumAdd = stadiumAdd;
        this.stadiumCategory = stadiumCategory;
        this.stadiumStartTime = stadiumStartTime;
        this.stadiumEndTime = stadiumEndTime;
        this.stadiumPrice = stadiumPrice;
    }
}
