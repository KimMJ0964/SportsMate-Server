package com.kh.sportsmate.stadium.model.dao;

import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.WeatherResponse;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    
    // 변경해야될사항!
    public StadiumSearch selectStadiumById(SqlSessionTemplate sqlSession, int stadiumNo) {
    	return sqlSession.selectOne("stadiumMapper.selectStadiumById", stadiumNo);
    }
    
}
