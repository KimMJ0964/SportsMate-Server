package com.kh.sportsmate.common.vo;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.common.vo
 * fileName       : PageInfo
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PageInfo {
    private int listCount; // 현재 총 게시글 수
    private int currentPage; // 보여주고 싶은 현재 페이지(사용자가 요청한 페이지)
    private int pageLimit; // 페이지 하단에 보여질 페이징바의 수
    private int boardLimit; // 한 페이지내에 보여질 게시글 최대 개수
    // 위 4개의 값을 기준으로 아래 3개의 값을 구할 수 있다.
    private int maxPage; // 가장 마지막 페이지(총 페이지 수)
    private int startPage; // 페이징바의 시작 수
    private int endPage; //페이징바의 마지막 끝 수
}