package com.kh.sportsmate.match.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderCreateFormDto {
	private String name;
    private int totalPrice;
}
