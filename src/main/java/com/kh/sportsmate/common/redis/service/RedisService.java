package com.kh.sportsmate.common.redis.service;

/**
 * packageName    : com.kh.sportsmate.common.redis.service
 * fileName       : RedisService
 * author         : jun
 * date           : 2024. 11. 20.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 20.        jun       최초 생성
 */
public interface RedisService {
    // 인증번호 저장
    void setCode(String email, String code);

    // 인증번호 조회
    String getCode(String email);
}
