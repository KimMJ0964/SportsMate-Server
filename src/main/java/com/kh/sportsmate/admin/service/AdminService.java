package com.kh.sportsmate.admin.service;

import java.util.ArrayList;

import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;
import com.kh.sportsmate.common.vo.PageInfo;

public interface AdminService {
	//차트 그리기
	ArrayList<ChartDateDto> drawChart();
	
	//신고 접수 총 갯수
	int selectListCount();
	
	//신고 접수 목록 가져오기
	ArrayList<MemberPenalty> selectList(PageInfo pi);
}
