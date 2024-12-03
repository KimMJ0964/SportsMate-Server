package com.kh.sportsmate.match.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReadyResponseDto {
    private String tid;                  // 결제 고유번호
    private String next_redirect_pc_url; // 카카오톡으로 결제 요청 메시지(TMS)를 보내기 위한 
}
