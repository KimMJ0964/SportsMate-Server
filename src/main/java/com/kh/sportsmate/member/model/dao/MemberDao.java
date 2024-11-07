package com.kh.sportsmate.member.model.dao;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * packageName    : com.kh.sportsmate.member.model.dao
 * fileName       : MemberDao
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
@Repository
public class MemberDao {
    /***
     * 회원 기본정보 Insert
     * @param sqlSession
     * @param m
     * @return
     */
    public int insertMember(SqlSessionTemplate sqlSession, Member m ){
        return sqlSession.insert("memberMapper.insertMember", m);
    }

    /**
     * 프로필 이미지 Insert
     * @param sqlSession
     * @param profile
     * @return
     */
    public int insertProfile(SqlSessionTemplate sqlSession, Profile profile){
        return sqlSession.insert("memberMapper.insertProfile", profile);
    }

    /***
     * 종목 입력 정보 Insert
     * @param sqlSession
     * @param category
     * @return
     */
    public int insertCategory(SqlSessionTemplate sqlSession, Category category){
        return sqlSession.insert("memberMapper.insertCategory",category);
    }
    public Member loginMember(SqlSessionTemplate sqlSession, Member m){
        return sqlSession.selectOne("memberMapper.loginMember", m);
    }
}
