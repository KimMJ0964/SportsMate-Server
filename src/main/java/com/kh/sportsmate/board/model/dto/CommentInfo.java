package com.kh.sportsmate.board.model.dto;
import lombok.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class CommentInfo {
	private int comNo;                // 댓글 번호
    private int refBoardNo;           // 참조 게시판 번호
    private String memName;           // 작성자 이름
    private String comCreateDate;     // 댓글 생성 날짜
    private String comModifyDate;     // 댓글 수정 날짜
    private String status;            // 상태 (정상, 삭제 등)
    private int comParentNo;          // 부모 댓글 번호
    private String comContent;        // 댓글 내용
    private int memNo;                // 작성자 회원 번호
    private String changeName; // 프로필 이미지 변경 이름
    private String filePath;   // 프로필 이미지 파일 경로
}
