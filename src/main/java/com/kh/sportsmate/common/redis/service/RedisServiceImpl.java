package com.kh.sportsmate.common.redis.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * packageName    : com.kh.sportsmate.common.redis.service
 * fileName       : RedisServiceImpl
 * author         : jun
 * date           : 2024. 11. 20.
 * description    : redis 관련 비즈니스로직
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 20.        jun       최초 생성
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class RedisServiceImpl implements RedisService {
    private final StringRedisTemplate redisTemplate;

    /**
     * redis 에 이메일 & 인증번호 저장
     *
     * @param email Key
     * @param code  Value
     */
    @Override
    public void setCode(String email, String code) {
        redisTemplate.opsForValue().set(email, code, 5, TimeUnit.MINUTES); // 만료기한 5분

    }

    /**
     * 이메일을 Key로 인증번호 조회
     *
     * @param email
     * @return
     */
    @Override
    public String getCode(String email) {
        String code = null;
        code = redisTemplate.opsForValue().get(email);
        log.info("redis의 인증 코드 : {}", code);

        // 값이 없을 경우 null 반환
        return code;
    }

}
