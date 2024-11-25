package com.kh.sportsmate.stadium.service;

import java.sql.Time;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StadiumServiceImpl implements StadiumService{

	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final StadiumDao stadiumDao;

	@Override
	public int getSearchResultCount(String stadiumName, String stadiumAddress, String stadiumCategory,
			String stadiumStartTime, String stadiumEndTime, String selectedDate) {
		 Map<String, Object> params = new HashMap<>();
		    params.put("stadiumName", stadiumName);
		    params.put("stadiumAddress", stadiumAddress);
		    params.put("stadiumCategory", stadiumCategory);
		    params.put("stadiumStartTime", stadiumStartTime);
		    params.put("stadiumEndTime", stadiumEndTime);
		    params.put("selectedDate", selectedDate);
		    return stadiumDao.getSearchResultCount(sqlSession, params);
	}

	@Override
	public List<StadiumSearch> getPaginatedStadiums(PageInfo pi, String stadiumName, String stadiumAddress,
			String stadiumCategory, String stadiumStartTime, String stadiumEndTime, String selectedDate) {
		 Map<String, Object> params = new HashMap<>();
		    params.put("stadiumName", stadiumName);
		    params.put("stadiumAddress", stadiumAddress);
		    params.put("stadiumCategory", stadiumCategory);
		    params.put("stadiumStartTime", stadiumStartTime);
		    params.put("stadiumEndTime", stadiumEndTime);
		    params.put("selectedDate", selectedDate);

		    // 페이징 정보 추가
		    params.put("startRow", (pi.getCurrentPage() - 1) * pi.getBoardLimit());
		    params.put("boardLimit", pi.getBoardLimit());

		    return stadiumDao.getPaginatedStadiums(sqlSession, params);
	}
}
