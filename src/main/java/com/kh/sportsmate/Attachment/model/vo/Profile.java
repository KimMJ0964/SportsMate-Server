package com.kh.sportsmate.Attachment.model.vo;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.Attachment.model.vo
 * fileName       : Profile
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
@EqualsAndHashCode
public class Profile {
    private int fileNo;
    private int memNo;
    private int teamNo;
    private String originName;
    private String changeName;
    private String filePath;

    public Profile(String originName, String changeName, String filePath) {
        this.originName = originName;
        this.changeName = changeName;
        this.filePath = filePath;
    }
}
