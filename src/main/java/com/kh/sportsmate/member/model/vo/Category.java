package com.kh.sportsmate.member.model.vo;

import lombok.*;

/**
 * packageName    : com.kh.sportsmate.member.model.vo
 * fileName       : Category
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
public class Category {
    private int memNo;
    private String socPosition;
    private String socSkill;
    private String futPosition;
    private String futSkill;
    private String basketPosition;
    private String basketSkill;
    private String basePosition;
    private String baseSkill;

    public Category(String socPosition, String socSkill, String futPosition, String futSkill, String basketPosition, String basketSkill, String basePosition, String baseSkill) {
        this.socPosition = socPosition;
        this.socSkill = socSkill;
        this.futPosition = futPosition;
        this.futSkill = futSkill;
        this.basketPosition = basketPosition;
        this.basketSkill = basketSkill;
        this.basePosition = basePosition;
        this.baseSkill = baseSkill;
    }
}
