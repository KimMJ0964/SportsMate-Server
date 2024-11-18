package com.kh.sportsmate.admin.service;

import java.util.ArrayList;

import com.kh.sportsmate.admin.model.dto.BlockProfileDto;
import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;
import com.kh.sportsmate.common.vo.PageInfo;

public interface AdminService {
	//차트 그리기
	ArrayList<ChartDateDto> drawChart();
	
	//신고 접수 총 갯수
	int selectListCount(String category);
	int selectAllListCount();
	
	//신고 접수 목록 가져오기
	ArrayList<MemberPenalty> selectList(PageInfo pi, String category);
	
	//유저 신고 접수
	int blockUser(MemberPenalty mp);
	int blockCancle(int pnNo);
	
	//차단유저 수 가져오기
	int selectBlockListCount();
	
	//차단유저 목록 가져오기
	ArrayList<BlockProfileDto> selectBlockList(PageInfo pi);
	
	//차단해제
	int unblockUser(int memNo);
}
