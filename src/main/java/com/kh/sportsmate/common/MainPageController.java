package com.kh.sportsmate.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * packageName    : com.kh.sportsmate.common
 * fileName       : MainPageController
 * author         : jun
 * date           : 2024. 11. 4.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 4.        jun       최초 생성
 */
@Controller
public class MainPageController {
    @RequestMapping("/main")
      public String RedirectMainPage(){
        return "/common/main";
    }
}
