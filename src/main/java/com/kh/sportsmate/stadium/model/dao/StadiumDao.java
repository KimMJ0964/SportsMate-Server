package com.kh.sportsmate.stadium.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.MatchInfoDto;
import com.kh.sportsmate.stadium.model.dto.StadiumApplicationDto;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.StadiumQnaDto;
import com.kh.sportsmate.stadium.model.dto.StadiumReviewDto;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

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
    public int insertStadium(SqlSessionTemplate sqlSession, Stadium stadiumInfo){
        return sqlSession.insert("stadiumMapper.insertStadium", stadiumInfo);
    }

    public int insertAmenities(SqlSessionTemplate sqlSession, Amenities am) {
        return sqlSession.insert("stadiumMapper.insertAmenities", am);
    }

    public int insetRental(SqlSessionTemplate sqlSession, Rental rental) {
        return sqlSession.insert("stadiumMapper.insetRental", rental);
    }
    public int insertStadiumAttachment(SqlSessionTemplate sqlSession, ArrayList<StadiumAttachment> stadiumAttachmentImgs){
        return sqlSession.insert("stadiumMapper.insertStadiumAttachment", stadiumAttachmentImgs);
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
    
    // 변경해야될사항!
    public StadiumSearch selectStadiumById(SqlSessionTemplate sqlSession, int stadiumNo) {
    	return sqlSession.selectOne("stadiumMapper.selectStadiumById", stadiumNo);
    }
    
    /* 디테일 모달 창 */
    // 팀장 번호 가져오기
    public int getTeamLeaderNo(SqlSessionTemplate sqlSession, int teamNo) {
        return sqlSession.selectOne("stadiumMapper.getTeamLeaderNo", teamNo);
    }

    // 활성화된 팀 멤버 가져오기
    public List<StadiumApplicationDto> getTeamMembers(SqlSessionTemplate sqlSession, int teamNo) {
        return sqlSession.selectList("stadiumMapper.getTeamMembers", teamNo);
    }

    // 로그인한 사용자의 팀 번호 가져오기
    public Integer getTeamNoByMember(SqlSessionTemplate sqlSession, int memNo) {
        return sqlSession.selectOne("stadiumMapper.getTeamNoByMember", memNo);
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
}
