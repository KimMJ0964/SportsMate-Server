package com.kh.sportsmate.stadium.model.dto;

import java.util.List;

import com.kh.sportsmate.member.model.dto.ManagerEnrollDto;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class GameSchedule {
	private Date ReservStart;
	private Date ReservEnd;
	private Date accessDate;
}
