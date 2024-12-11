package com.kh.sportsmate.stadium.service;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.sportsmate.admin.model.dao.AdminDao;
import com.kh.sportsmate.admin.model.dto.StadiumPenaltyDTO;
import com.kh.sportsmate.match.model.dao.MatchDao;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.stadium.model.dto.*;
import com.kh.sportsmate.team.model.dao.TeamDao;
import com.kh.sportsmate.team.model.dto.MatchResultTeamInfoDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Refund;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.sportsmate.stadium.model.vo.StadiumQna;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
@Transactional(readOnly = true)
@Service
public class StadiumServiceImpl implements StadiumService{

    private final StadiumDao stadiumDao;
    private final SqlSessionTemplate sqlSession;
    private final MatchDao matchDao;
    private final MemberDao memberDao;
    private final TeamDao teamDao;
	private final AdminDao adminDao;
    

    @Override
    public List<Stadium> getStadiumsByManager(int memNo) {
        return stadiumDao.selectStadiumByManager(sqlSession, memNo); // 여러 구장 가져오기
    }

	@Override
	public StadiumDto getStadiumByManager(int memNo) {
		return stadiumDao.selectOneStadiumByManager(sqlSession, memNo);
	}

	@Override
	public List<StadiumDto> getStadiumImagesByManager(int memNo) {
		return stadiumDao.selectStadiumImages(sqlSession, memNo);
	}

	@Override
	public int updateStadium(StadiumDto stadiumDto) {
		return stadiumDao.updateStadium(sqlSession, stadiumDto);
	}

	@Override
	public int updateAmenities(Amenities amenities) {
		return stadiumDao.updateAmenities(sqlSession, amenities);
	}

	@Override
	public int updateRental(Rental rental) {
		return stadiumDao.updateRental(sqlSession, rental);
	}

	@Override
	public boolean updateStadium(StadiumDto stadiumDto, Amenities amenities, Rental rental) {
		boolean isStadiumUpdated = stadiumDao.updateStadium(sqlSession, stadiumDto) > 0; // 구장 정보 업데이트
        boolean isAmenitiesUpdated = stadiumDao.updateAmenities(sqlSession, amenities) > 0; // 편의시설 업데이트
        boolean isRentalUpdated = stadiumDao.updateRental(sqlSession, rental) > 0; // 대여 정보 업데이트

        return isStadiumUpdated && isAmenitiesUpdated && isRentalUpdated;
	}
	
	@Override
	public List<StadiumRefundDto> getRefundPageData(int memNo) {
	    // DAO에서 VO 리스트 가져오기
	    
	    return stadiumDao.getRefundPageData(memNo);
	}

	@Override
	public boolean processRefund(int matchNo) {
	    int result = stadiumDao.updateReservationStatus(sqlSession, matchNo);
	    return result > 0;
	}


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
	public List<GameScheduleDto> getGameScheduleData(int memNo) {
		return stadiumDao.selectGameScheduleData(sqlSession, memNo);
	}

	@Override
	@Transactional
	public boolean deleteMatchAndBest(int matchNo) {
		// 1. MATCH_BEST 데이터 삭제
	    int matchBestDeleted = stadiumDao.deleteMatchBest(sqlSession, matchNo);

	    // 2. MATCH 데이터 삭제
	    int matchDeleted = stadiumDao.deleteMatch(sqlSession, matchNo);
		return matchBestDeleted > 0 && matchDeleted > 0;
	}

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
    public List<StadiumDetailmodal> getPendingMatches(int teamNo) {
        return stadiumDao.getPendingMatches(sqlSession, teamNo);
    }

	@Override
	public int getTeamNoByMemNo(int memNo) {
		return stadiumDao.getTeamNoByMemNo(sqlSession, memNo);
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
	

	@Override
	public List<GameFinishDto> getCompleteMatches(int stadiumNo) {
		return stadiumDao.getCompleteMatches(sqlSession, stadiumNo);
	}


	/**
	 * 경기 결과 디테일에 필요한 각 팀 정보 조회
	 * @param matchNo
	 * @return
	 */
	@Override
	public MatchResultTeamInfoDTO selectTeamInfo(int matchNo) {
		return teamDao.selectTeamInfo(sqlSession,matchNo);
	}

	@Override
	public int getStadiumNo(int memNo) {
		return stadiumDao.getStadiumNo(sqlSession,memNo);

	}

	@Override
	public ArrayList<MatchResultMemberInfoDTO> selectMatchMemberInfo(Map<String, Object> map) {
		return stadiumDao.selectMatchMemberInfo(sqlSession, map);
	}


}
