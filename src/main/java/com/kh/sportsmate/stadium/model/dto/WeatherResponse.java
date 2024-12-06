package com.kh.sportsmate.stadium.model.dto;

import lombok.Data;

@Data
public class WeatherResponse {
	private String location; 		// 위치
	private String temperature;		// 온도
    private String weatherCode;		// 날씨 코드 (예: "01" -> 맑음)
    private String description;		// 날씨 설명
}
