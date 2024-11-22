package com.kh.sportsmate.stadium.model.dto;

import java.sql.Time;

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
public class StadiumImgDto {
	private int stadiumNo;
    private String originName;
    private String changeName;
    private String filePath;
    private String fileType;
}
