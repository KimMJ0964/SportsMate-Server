package com.kh.sportsmate.stadium.service;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.dto.MatchInfoDto;
import com.kh.sportsmate.stadium.model.dto.QnaRequestDto;
import com.kh.sportsmate.stadium.model.dto.StadiumApplicationDto;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.StadiumQnaDto;
import com.kh.sportsmate.stadium.model.dto.StadiumReviewDto;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.dto.WeatherResponse;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class StadiumServiceImpl implements StadiumService{

	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final StadiumDao stadiumDao;

	@Override
	public int getSearchResultCount(String stadiumName, String stadiumAddress, String stadiumCategory,
			String stadiumStartTime, String stadiumEndTime, String selectedDate, String activityArea) {
		 Map<String, Object> params = new HashMap<>();
		    params.put("stadiumName", stadiumName);
		    params.put("stadiumAddress", stadiumAddress);
		    params.put("stadiumCategory", stadiumCategory);
		    params.put("stadiumStartTime", stadiumStartTime);
		    params.put("stadiumEndTime", stadiumEndTime);
		    params.put("selectedDate", selectedDate);
		    params.put("activityArea", activityArea);
		    return stadiumDao.getSearchResultCount(sqlSession, params);
	}

	@Override
	public List<StadiumSearch> getPaginatedStadiums(PageInfo pi, String stadiumName, String stadiumAddress,
			String stadiumCategory, String stadiumStartTime, String stadiumEndTime, String selectedDate, String activityArea) {
		 Map<String, Object> params = new HashMap<>();
		    params.put("stadiumName", stadiumName);
		    params.put("stadiumAddress", stadiumAddress);
		    params.put("stadiumCategory", stadiumCategory);
		    params.put("stadiumStartTime", stadiumStartTime);
		    params.put("stadiumEndTime", stadiumEndTime);
		    params.put("selectedDate", selectedDate);
		    params.put("activityArea", activityArea);

		    // 페이징 정보 추가
		    params.put("startRow", (pi.getCurrentPage() - 1) * pi.getBoardLimit());
		    params.put("boardLimit", pi.getBoardLimit());

		    return stadiumDao.getPaginatedStadiums(sqlSession, params);
	}

	@Override
	public StadiumDetail getStadiumDetail(int stadiumNo) {
		return stadiumDao.getStadiumDetail(sqlSession, stadiumNo);
	}

	@Override
	public List<StadiumReviewDto> getPagedReviewsByStadiumNo(int stadiumNo, int currentPage, int boardLimit) {
		int offset = (currentPage - 1) * boardLimit;
		return stadiumDao.selectReviewsByStadiumNo(sqlSession, stadiumNo, offset, boardLimit);
	}

	@Override
	public int getReviewCount(int stadiumNo) {
		return stadiumDao.selectReviewCountByStadiumNo(sqlSession, stadiumNo);
	}
	
	/* 구장 신청하기 모달 */
	// 팀장 번호 가져오기
    @Override
    public int getTeamLeaderNo(int teamNo) {
        return stadiumDao.getTeamLeaderNo(sqlSession, teamNo);
    }

    // 활성화된 팀 멤버 가져오기
    @Override
    public List<StadiumApplicationDto> getTeamMembers(int teamNo) {
        return stadiumDao.getTeamMembers(sqlSession, teamNo);
    }

    // 로그인한 사용자의 팀 번호 가져오기
    @Override
    public Integer getTeamNoByMember(int memNo) {
        return stadiumDao.getTeamNoByMember(sqlSession, memNo);
    }
    
	
	@Override
	public boolean insertQna(StadiumQnaDto stadiumQnaDto) {
	    int result = stadiumDao.insertQna(sqlSession, stadiumQnaDto);
	    return result > 0;
	}

	@Override
	public int selectInquiryCount(int memNo) {
		return stadiumDao.selectInquiryCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<StadiumQna> inquiryList(int memNo, PageInfo pi) {
		return stadiumDao.inquiryList(sqlSession, memNo, pi);
	}

	@Override
	public int inquiryUpdate(StadiumQna sq) {
		return stadiumDao.inquiryUpdate(sqlSession, sq);
	}

	@Override
	public List<WeatherResponse> getWeatherByAddress(String address) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MatchInfoDto> getPendingMatches(Map<String, Object> params) {
		return stadiumDao.getPendingMatches(sqlSession, params);
	}
}
