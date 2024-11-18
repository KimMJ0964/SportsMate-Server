package com.kh.sportsmate.stadium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/stadium")
public class StadiumController {

    @RequestMapping("/list")
    public String showStadiumList() {
        return "stadium/listPage";
    }
    
    @RequestMapping("/detail")
    public String showStadiumdatil() {
        return "stadium/detail";
    }
}