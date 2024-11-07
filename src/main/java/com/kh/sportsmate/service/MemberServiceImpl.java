package com.kh.sportsmate.service;

import com.kh.sportsmate.member.model.dao.MemberDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * packageName    : com.kh.sportsmate.service
 * fileName       : MemberServiceImpl
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
@Service
public class MemberServiceImpl implements MemberService{
    private final SqlSessionTemplate sqlSession;
    private final MemberDao memberDao;

    public MemberServiceImpl(SqlSessionTemplate sqlSession, MemberDao memberDao) {
        this.sqlSession = sqlSession;
        this.memberDao = memberDao;
    }


}
