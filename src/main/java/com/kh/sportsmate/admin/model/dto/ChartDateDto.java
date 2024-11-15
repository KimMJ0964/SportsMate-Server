package com.kh.sportsmate.admin.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChartDateDto {
	private int today;
	private int oneDay;
	private int twoDay;
	private int threeDay;
	private int fourDay;
}
