package com.kh.sportsmate.stadium.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.sportsmate.match.model.dao.MatchDao;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.stadium.model.dto.GameResultDTO;
import com.kh.sportsmate.stadium.model.dto.Rating;
import com.kh.sportsmate.stadium.model.dto.TeamScore;
import com.kh.sportsmate.team.model.dao.TeamDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
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
}
