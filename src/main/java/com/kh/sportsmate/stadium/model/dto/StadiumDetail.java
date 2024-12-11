package com.kh.sportsmate.stadium.model.dto;

import java.util.List;


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
public class StadiumDetail {
	private int stadiumNo; // 구장 번호
	private int teamNo; // 팀 번호
    private int memNo; // 구장 관리자 식별 번호
    private String stadiumName; // 구장명
    private String stadiumZipcode; // 구장 우편번호
    private String stadiumAddress; // 구장 주소
    private double stadiumScore; // 구장 평점
    private int stadiumPrice; // 구장 가격
    private String stadiumCategory; // 구장 종목
    private String stadiumStartTime; // 예약 가능 시작 시간
    private String stadiumEndTime; // 예약 가능 종료 시간
    private String status; // 구장 상태

    // StadiumRental 정보
    private String ball; // 공 대여 여부
    private String vest; // 조끼 대여 여부

    // StadiumAm 정보
    private String toilet; // 화장실 유무
    private String shower; // 샤워실 유무
    private String smoke; // 흡연 구역 유무
    private String park; // 주차장 유무
    private String drink; // 음료 구비 유무
    
    // 이미지 필드 추가
    private String filePath; // 파일 경로
    private String changeName; // 변경된 파일 이름
    
    // StadiumReview 정보
    private List<StadiumReviewDto> reviews; 
}