package com.kh.sportsmate.stadium.model.dao;

import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

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
    
 // 관리자가 소유한 모든 구장 조회
    public List<Stadium> selectStadiumByManager(int memNo) {
        return sqlSession.selectList("stadiumMapper.selectStadiumByManager", memNo);
    }

    // 관리자가 소유한 단일 구장 조회
    public StadiumDto selectOneStadiumByManager(int memNo) {
        return sqlSession.selectOne("stadiumMapper.selectOneStadiumByManager", memNo);
    }

}
