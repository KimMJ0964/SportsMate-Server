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

    // 구장 등록
    public int insertStadium(Stadium stadiumInfo) {
        return sqlSession.insert("stadiumMapper.insertStadium", stadiumInfo);
    }

    // 편의시설 등록
    public int insertAmenities(Amenities am) {
        return sqlSession.insert("stadiumMapper.insertAmenities", am);
    }

    // 대여 시스템 등록
    public int insertRental(Rental rental) {
        return sqlSession.insert("stadiumMapper.insetRental", rental);
    }

    // 구장 이미지 등록
    public int insertStadiumAttachment(ArrayList<StadiumAttachment> stadiumAttachmentImgs) {
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

    // 관리자가 소유한 구장의 이미지 조회
    public List<StadiumDto> selectStadiumImages(int memNo) {
        return sqlSession.selectList("stadiumMapper.selectStadiumImages", memNo);
    }

    /**
     * 구장 정보 수정
     * @param stadiumDto - 수정할 구장 정보
     * @return 업데이트된 행 수
     */
    public int updateStadium(StadiumDto stadiumDto) {
        return sqlSession.update("stadiumMapper.updateStadium", stadiumDto);
    }

    /**
     * 편의시설 정보 수정
     * @param amenities - 수정할 편의시설 정보
     * @return 업데이트된 행 수
     */
    public int updateAmenities(Amenities amenities) {
        return sqlSession.update("stadiumMapper.updateAmenities", amenities);
    }

    /**
     * 대여 시스템 정보 수정
     * @param rental - 수정할 대여 시스템 정보
     * @return 업데이트된 행 수
     */
    public int updateRental(Rental rental) {
        return sqlSession.update("stadiumMapper.updateRental", rental);
    }

    /**
     * 구장 이미지 삭제
     * @param stadiumNo - 삭제할 구장의 번호
     * @return 삭제된 행 수
     */
    public int deleteStadiumImages(int stadiumNo) {
        return sqlSession.delete("stadiumMapper.deleteStadiumImages", stadiumNo);
    }

    /**
     * 구장 이미지 추가
     * @param stadiumAttachmentImgs - 새로 추가할 이미지 리스트
     * @return 추가된 행 수
     */
    public int addStadiumImages(ArrayList<StadiumAttachment> stadiumAttachmentImgs) {
        return sqlSession.insert("stadiumMapper.addStadiumImages", stadiumAttachmentImgs);
    }
}
