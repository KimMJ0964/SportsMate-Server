package com.kh.sportsmate.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.admin.model.dto.BlockProfileDto;
import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;
import com.kh.sportsmate.common.vo.PageInfo;

@Repository
public class AdminDao {
	public ArrayList<ChartDateDto> drawChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.drawChart");
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, String category){
		return sqlSession.selectOne("adminMapper.selectListCount", category);
	}
	
	public int selectAllListCount(SqlSessionTemplate sqlSession){
		return sqlSession.selectOne("adminMapper.selectAllListCount");
	}
	
	public ArrayList<MemberPenalty> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String category){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", category, rowBounds);
	}
	
	public int blockUser(SqlSessionTemplate sqlSession, MemberPenalty mp) {
		int result1 = sqlSession.update("adminMapper.blockUser", mp);
		int result2 = sqlSession.update("adminMapper.blockUserDuplicate", mp);
		
		return result1 + result2;
	}
	
	public int blockCancle(SqlSessionTemplate sqlSession, int pnNo) {
		return sqlSession.delete("adminMapper.blockCancle", pnNo);
	}
	
	public int selectBlockListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectBlockListCount");
	}
	
	public ArrayList<BlockProfileDto> selectBlockList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBlockList", null, rowBounds);
	}
	
	public int unblockUser(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("adminMapper.unblockUser", memNo);
	}

	/**
	 * 패널티 카운트 조회
	 * @param sqlSession
	 * @param memNo 패널티 대상 memNo
	 * @return 패널티 카운트 값
	 */
	public int selectPenaltyCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("adminMapper.selectPenaltyCount", memNo);
	}
}
