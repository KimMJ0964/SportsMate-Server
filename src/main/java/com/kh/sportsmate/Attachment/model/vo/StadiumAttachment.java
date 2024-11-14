package com.kh.sportsmate.Attachment.model.vo;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.Attachment.model.vo
 * fileName       : Stadium
 * author         : jun
 * date           : 2024. 11. 13.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 13.        jun       최초 생성
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class StadiumAttachment {
    private int stadiumNo; // 구장 식별 번호
    private int fileNo; // 파일 식별 번호
    private String originName; // 이미지 원본명
    private String changeName; // 이미지 변경명
    private String filePath; // 이미지 경로
    private String status; // 이미지 상태
    private int fileType; // 썸네일 : 0, 디테일 : 1

    public StadiumAttachment(String originName, String changeName, String filePath, int fileType) {
        this.originName = originName;
        this.changeName = changeName;
        this.filePath = filePath;
        this.fileType = fileType;
    }
}
