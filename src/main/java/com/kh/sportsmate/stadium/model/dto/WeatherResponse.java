package com.kh.sportsmate.stadium.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
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
public class WeatherResponse {
	private String date;       // 날짜 (yyyy-MM-dd 형식)
    private String dayOfWeek;  // 요일 (월, 화, 수 등)
    private String condition;  // 날씨 상태 (맑음, 구름 많음 등)
    private double minTemp;    // 최저 기온
    private double maxTemp;    // 최고 기온
    private String icon;       // 날씨 아이콘 이미지 URL
}
