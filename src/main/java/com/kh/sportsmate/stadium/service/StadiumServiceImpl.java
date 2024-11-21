package com.kh.sportsmate.stadium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.vo.Stadium;

@Service
public class StadiumServiceImpl implements StadiumService{

	@Autowired
    private StadiumDao stadiumDao;

    @Override
    public List<Stadium> getStadiumsByManager(int memNo) {
        return stadiumDao.selectStadiumByManager(memNo); // 여러 구장 가져오기
    }

	@Override
	public StadiumDto getStadiumByManager(int memNo) {
		return stadiumDao.selectOneStadiumByManager(memNo);
	}
}
