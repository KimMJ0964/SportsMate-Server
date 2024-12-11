package com.kh.sportsmate.stadium.model.dto;

import java.sql.Time;
import java.util.List;

import com.kh.sportsmate.member.model.dto.ManagerEnrollDto;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * packageName    : com.kh.sportsmate.stadium.model.dto
 * fileName       : StadiumDto
 * author         : kyu
 * date           : 2024. 11. 21.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 21.        kyu       최초 생성
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class StadiumDto {
	private int stadiumNo;
    private int memNo;
    private String stadiumName;
    private String stadiumAdd;
    private String stadiumZipcode;
    private int stadiumPrice;
    private String stadiumCategory;
    private Time stadiumStartTime;
    private Time stadiumEndTime;
    private String status;

    // STADIUM_AM
    private char toilet;
    private char shower;
    private char smoke;
    private char park;
    private char drink;

    // STADIUM_IMG
    private String originName;
    private String changeName;
    private String filePath;
    private String imgStatus;
    private String fileType;

    // STADIUM_RENTAL
    private char ball;
    private char vest; 
}
