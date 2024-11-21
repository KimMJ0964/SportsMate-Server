package com.kh.sportsmate.stadium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.vo.Stadium;
@Service
public class StadiumService {
	
	@Autowired
    private StadiumDao stadiumDao;

    // 관리자 소유의 구장 정보 조회
    public Stadium getStadiumByManager(int memNo) {
        return stadiumDao.selectStadiumByManager(memNo);
    }
}
