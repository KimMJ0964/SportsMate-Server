package com.kh.sportsmate.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.sportsmate.ranking.dao.RankingDao;
import com.kh.sportsmate.ranking.vo.Ranking;

@Service
public class RankingServiceImpl implements RankingService{
	
	private final RankingDao rankingDao;
	
	public RankingServiceImpl(RankingDao rankingDao) {
		this.rankingDao = rankingDao;
	}

	@Override
	public List<Ranking> getAllTeams() {
		return rankingDao.getAllTeams();
	}
}
