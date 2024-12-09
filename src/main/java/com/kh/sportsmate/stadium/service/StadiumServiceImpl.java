package com.kh.sportsmate.stadium.service;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.sportsmate.admin.model.dao.AdminDao;
import com.kh.sportsmate.admin.model.dto.StadiumPenaltyDTO;
import com.kh.sportsmate.match.model.dao.MatchDao;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.stadium.model.dto.GameResultDTO;
import com.kh.sportsmate.stadium.model.dto.Rating;
import com.kh.sportsmate.stadium.model.dto.TeamScore;
import com.kh.sportsmate.team.model.dao.TeamDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.StadiumDetailmodal;
import com.kh.sportsmate.stadium.model.dto.StadiumReviewDto;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.dto.WeatherResponse;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
@Transactional(readOnly = true)
@Service
public class StadiumServiceImpl implements StadiumService {
    private final StadiumDao stadiumDao;
    private final SqlSessionTemplate sqlSession;
    private final MatchDao matchDao;
    private final MemberDao memberDao;
    private final TeamDao teamDao;
	private final AdminDao adminDao;

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
	public StadiumSearch getStadiumById(int stadiumNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WeatherResponse getWeather(String location) {
		// TODO Auto-generated method stub
		return null;
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

	@Override
	public List<StadiumDetailmodal> getStadiumReservation(int teamNo) {
		return stadiumDao.StadiumReservation(sqlSession, teamNo);
	}

	@Override
	public int getTeamNoByMemNo(int memNo) {
		return stadiumDao.getTeamNoByMemNo(sqlSession, memNo);
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

    /**
     * 경기 결과 입력
     * @param gameResultDTO 경기 결과 파싱 객체(List<Rating> ratings, TeamScore teamScore,  String matchNo)
     * @return
     */
    @Transactional
    @Override
    public int insertGameResult(GameResultDTO gameResultDTO) {
        int updateTotalPointResult = 1;
        int updateMannerTotalPointResult = 1;
        int updateAvgPointResult = 1;
        int updateMemberMannerPointResult = 1;

        List<Rating> ratingList = gameResultDTO.getRatings();
        TeamScore score = gameResultDTO.getTeamScore();
        log.info("평점 리스트 : {}", ratingList);
        log.info("경기 결과 : {}", score);

        // 1. 경기 카테고리 받아 오기
        String category = matchDao.selectCategory(sqlSession, gameResultDTO.getMatchNo());
        log.info("카테고리 : {}", category);
        for (Rating rating : ratingList) {
            // 평점 계산
            // 총점 + 현재 평점 / 총 경기수
            // 1. 현재 총점 (select) + 현재 평점 / 총 경기수(Select)
            // 현재 총점 , 총 경기수 select (매치 번호로 category 가져와야함)

            // 2. 총 평점 update
            Map<String, Object> map = new HashMap<>();
            map.put("memNo", rating.getMemNo());
            map.put("teamNo", rating.getTeamNo());
            map.put("skill", rating.getSkill());
            map.put("manner", rating.getManner());
            map.put("category", category);
            updateTotalPointResult *= memberDao.updateTotalPoint(sqlSession, map);
            updateMannerTotalPointResult *= memberDao.updateMannerTotalPoint(sqlSession,map);
            updateAvgPointResult *= memberDao.updateAvgPoint(sqlSession, map);
            updateMemberMannerPointResult *= memberDao.updateMemberMannerPoint(sqlSession,map);
            log.info("총 평점 update 결과 : {}",updateTotalPointResult);
            log.info("평균 평점 update 결과 : {}",updateAvgPointResult);
            log.info("총 매너 평점 update 결과 : {}",updateMannerTotalPointResult);
            log.info("평균 매너 평점 update 결과 : {}",updateMemberMannerPointResult);
        }
            /*
            * 경기 결과 저장
            * 1. teamAScore , teamBScore 각각 MATCH 테이블에서 update
            * 2. team_record 테이블에 teamNo로
            * */
        int updateGameResult = matchDao.updateGameResult(sqlSession, score);
        int updateTeamRecordResult = teamDao.updateTeamRecord(sqlSession, score);
        log.info("Match 테이블 update 결과 : {}",updateGameResult);
        log.info("TEAM_RECORD 테이블 update 결과 : {}",updateTeamRecordResult);

        return updateTotalPointResult * updateMannerTotalPointResult * updateAvgPointResult
                *updateMemberMannerPointResult * updateGameResult * updateTeamRecordResult;
    }

	/**
	 * 패널티 횟수 조회 후 패널티 신고 등록
	 * @param penaltyInfo
	 * @return
	 */
	@Override
	public int insertPenalty(StadiumPenaltyDTO penaltyInfo) {
		int pnCount = adminDao.selectPenaltyCount(sqlSession, penaltyInfo.getMemNo());
		log.info("패널티 카운트 조회 결과 : {}",pnCount);
		penaltyInfo.setPnCount(pnCount);
		return stadiumDao.insertPenalty(sqlSession, penaltyInfo);

	}
}
