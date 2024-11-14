package com.kh.sportsmate.ranking.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.sportsmate.ranking.vo.Ranking;
import com.kh.sportsmate.service.RankingService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RankingController {
	
	private final RankingService rankingService;
	
	@GetMapping("/rankings")
	public String getAllRankings(Model model) {
		List<Ranking> ranking = rankingService.getAllTeams();
		for (int i = 0; i < ranking.size(); i++) {
			ranking.get(i).setRank(i + 1); // 순위 설정
		}
		model.addAttribute("ranking", ranking);
		return "ranking";
	}
}
