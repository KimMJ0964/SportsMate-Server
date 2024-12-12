package com.kh.sportsmate.stadium.model.dao;

import com.kh.sportsmate.admin.model.dto.StadiumPenaltyDTO;
import com.kh.sportsmate.stadium.model.dto.*;
import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Refund;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/**
 * packageName    : com.kh.sportsmate.stadium.model.dao
 * fileName       : StadiumDao
 * author         : jun
 * date           : 2024. 11. 13.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 13.        jun       최초 생성
 */
@Repository
public class StadiumDao {
    @Autowired
    private SqlSessionTemplate sqlSession;

    // 구장 등록
    public int insertStadium(SqlSessionTemplate sqlSession, Stadium stadiumInfo) {
        return sqlSession.insert("stadiumMapper.insertStadium", stadiumInfo);
    }

    // 편의시설 등록
    public int insertAmenities(SqlSessionTemplate sqlSession, Amenities am) {
        return sqlSession.insert("stadiumMapper.insertAmenities", am);
    }

    // 대여 시스템 등록
    public int insertRental(SqlSessionTemplate sqlSession, Rental rental) {
        return sqlSession.insert("stadiumMapper.insetRental", rental);
    }

    // 구장 이미지 등록
    public int insertStadiumAttachment(SqlSessionTemplate sqlSession, ArrayList<StadiumAttachment> stadiumAttachmentImgs) {
        return sqlSession.insert("stadiumMapper.insertStadiumAttachment", stadiumAttachmentImgs);
    }

    // 관리자가 소유한 모든 구장 조회
    public List<Stadium> selectStadiumByManager(SqlSessionTemplate sqlSession, int memNo) {
        return sqlSession.selectList("stadiumMapper.selectStadiumByManager", memNo);
    }

    // 관리자가 소유한 단일 구장 조회
    public StadiumDto selectOneStadiumByManager(SqlSessionTemplate sqlSession, int memNo) {
    	return sqlSession.selectOne("stadiumMapper.selectOneStadiumByManager", memNo);
    }

    // 관리자가 소유한 구장의 이미지 조회
    public List<StadiumDto> selectStadiumImages(SqlSessionTemplate sqlSession, int memNo) {
        return sqlSession.selectList("stadiumMapper.selectStadiumImages", memNo);
    }
    
 // 구매 완료된 매치 데이터 조회
    public List<Refund> selectCompletedMatches(SqlSessionTemplate sqlSession, int memNo) {
        return sqlSession.selectList("stadiumMapper.selectCompletedMatches", memNo);
    }
    
    public List<StadiumRefundDto> getRefundPageData(int memNo) {
		return (List)sqlSession.selectList("stadiumMapper.getRefundPageData", memNo);
	}
    

    /**
     * 구장 정보 수정
     * @param stadiumDto - 수정할 구장 정보
     * @return 업데이트된 행 수
     */
    public int updateStadium(SqlSessionTemplate sqlSession, StadiumDto stadiumDto) {
        return sqlSession.update("stadiumMapper.updateStadium", stadiumDto);
    }

    /**
     * 편의시설 정보 수정
     * @param amenities - 수정할 편의시설 정보
     * @return 업데이트된 행 수
     */
    public int updateAmenities(SqlSessionTemplate sqlSession, Amenities amenities) {
        return sqlSession.update("stadiumMapper.updateAmenities", amenities);
    }

    /**
     * 대여 시스템 정보 수정
     * @param rental - 수정할 대여 시스템 정보
     * @return 업데이트된 행 수
     */
    public int updateRental(SqlSessionTemplate sqlSession, Rental rental) {
        return sqlSession.update("stadiumMapper.updateRental", rental);
    }

    /**
     * 구장 이미지 삭제
     * @param stadiumNo - 삭제할 구장의 번호
     * @return 삭제된 행 수
     */
    public int deleteStadiumImages(SqlSessionTemplate sqlSession, int stadiumNo) {
        return sqlSession.delete("stadiumMapper.deleteStadiumImages", stadiumNo);
    }

    /**
     * 구장 이미지 추가
     * @param stadiumAttachmentImgs - 새로 추가할 이미지 리스트
     * @return 추가된 행 수
     */
    public int addStadiumImages(SqlSessionTemplate sqlSession, ArrayList<StadiumAttachment> stadiumAttachmentImgs) {
        return sqlSession.insert("stadiumMapper.addStadiumImages", stadiumAttachmentImgs);
    }

    
    // 검색 결과 개수 조회
    public int getSearchResultCount(SqlSessionTemplate sqlSession, Map<String, Object> params) {
        return sqlSession.selectOne("stadiumMapper.getSearchResultCount", params);
    }

    // 페이지네이션된 경기장 리스트 조회
    public List<StadiumSearch> getPaginatedStadiums(SqlSessionTemplate sqlSession, Map<String, Object> params) {
        return sqlSession.selectList("stadiumMapper.getPaginatedStadiums", params);
    }
    
    // 특정 stadiumNo로 경기장 디테일 정보 조회
    public StadiumDetail getStadiumDetail(SqlSessionTemplate sqlSession, int stadiumNo) {
    	return sqlSession.selectOne("stadiumMapper.getStadiumDetail", stadiumNo);
    }
    
    // 리뷰 페이징 조회
    public List<StadiumReviewDto> selectReviewsByStadiumNo(SqlSessionTemplate sqlSession, int stadiumNo, int offset, int limit) {
    	Map<String, Object> params = new HashMap<>();
    	params.put("stadiumNo", stadiumNo);
    	params.put("offset", offset);
    	params.put("limit", limit);
    	return sqlSession.selectList("stadiumMapper.selectReviewsByStadiumNo", params);
    }
    
    // 전체 리뷰 개수 조회
    public int selectReviewCountByStadiumNo(SqlSessionTemplate sqlSession, int stadiumNo) {
    	 return sqlSession.selectOne("stadiumMapper.selectReviewCountByStadiumNo", stadiumNo);
    }
    
    // 디테일페이지 구장 신청하기 모달
    public List<StadiumDetailmodal> StadiumReservation(SqlSessionTemplate sqlSession, int teamNo) {
    	return sqlSession.selectList("stadiumMapper.StadiumReservation", teamNo);
    }
    
    // 추가: 대기 중인 매치 정보 가져오기
    public List<StadiumDetailmodal> getPendingMatches(SqlSessionTemplate sqlSession, int teamNo) {
        return sqlSession.selectList("stadiumMapper.StadiumReservation", teamNo);
    }
    
    // 팀번호로 조회
    public int getTeamNoByMemNo(SqlSessionTemplate sqlSession, Map<String, Object> params) {
        return sqlSession.selectOne("stadiumMapper.getTeamNoByMemNo", params);
    }
    
    // 변경해야될사항!
    public StadiumSearch selectStadiumById(SqlSessionTemplate sqlSession, int stadiumNo) {
    	return sqlSession.selectOne("stadiumMapper.selectStadiumById", stadiumNo);
    }
    
    // 문의 등록
    public int insertQna(SqlSessionTemplate sqlSession, StadiumQnaDto stadiumQnaDto) {
        return sqlSession.insert("stadiumMapper.insertQna", stadiumQnaDto);
    }
    
    public int selectInquiryCount(SqlSessionTemplate sqlSession, int memNo) {
    	return sqlSession.selectOne("stadiumMapper.selectInquiryCount", memNo);
    }
    
    public ArrayList<StadiumQna> inquiryList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi) {
    	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    	
    	return (ArrayList) sqlSession.selectList("stadiumMapper.inquiryList", memNo, rowBounds);
    }
    
    public int inquiryUpdate(SqlSessionTemplate sqlSession, StadiumQna sq) {
    	return sqlSession.update("stadiumMapper.inquiryUpdate", sq);
    }

    // 환불 처리
	public int updateReservationStatus(SqlSessionTemplate sqlSession, int matchNo) {
		return sqlSession.update("stadiumMapper.updateReservationStatus", matchNo);
	}

	public List<GameScheduleDto> selectGameScheduleData(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectList("stadiumMapper.getGameScheduleData", memNo);
	}
	
	public int deleteMatchBest(SqlSessionTemplate sqlSession, int matchNo) {
	    return sqlSession.delete("stadiumMapper.deleteMatchBest", matchNo);
	}

	public int deleteMatch(SqlSessionTemplate sqlSession, int matchNo) {
	    return sqlSession.delete("stadiumMapper.deleteMatch", matchNo);
	}

    public int insertPenalty(SqlSessionTemplate sqlSession, StadiumPenaltyDTO penaltyInfo) {
        return sqlSession.insert("stadiumMapper.insertPenalty", penaltyInfo);
    }

    // 진행 완료 매치
    public List<GameFinishDto> getCompleteMatches(SqlSessionTemplate sqlSession, int stadiumNo) {
        return sqlSession.selectList("stadiumMapper.getCompleteMatches", stadiumNo);
    }
    public int getStadiumNo(SqlSessionTemplate sqlSession, int memNo) {
        return sqlSession.selectOne("stadiumMapper.getStadiumNo", memNo);
    }
    public ArrayList<MatchResultMemberInfoDTO> selectMatchMemberInfo(SqlSessionTemplate sqlSession, Map<String,Object> map) {
        return (ArrayList) sqlSession.selectList("stadiumMapper.selectMatchMemberInfo", map);

    }
    public String getStadiumCategory(SqlSessionTemplate sqlSession, int stadiumNo) {
        return sqlSession.selectOne("stadiumMapper.getStadiumCategory", stadiumNo);
    }
}
