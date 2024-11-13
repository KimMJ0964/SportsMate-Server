package com.kh.sportsmate.admin.service;

import java.util.ArrayList;

import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;

public interface AdminService {
	ArrayList<ChartDateDto> drawChart();
	ArrayList<MemberPenalty> selectReportList();
}
