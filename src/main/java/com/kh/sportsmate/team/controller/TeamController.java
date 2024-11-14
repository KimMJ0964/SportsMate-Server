package com.kh.sportsmate.team.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * packageName    : com.kh.sportsmate.team.controller
 * fileName       : TeamController
 * author         : jun
 * date           : 2024. 11. 14.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 14.        jun       최초 생성
 */
@CrossOrigin
@Slf4j
@Controller
public class TeamController {
    @GetMapping(value = "teamMenu.tm")
    public String moveTeamMenu(){
        return "team/teamMenu";
    }
}
