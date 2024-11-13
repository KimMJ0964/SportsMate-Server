package com.kh.sportsmate.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;
import com.kh.sportsmate.admin.service.AdminService;

@CrossOrigin
@Controller
public class AdminController {
	private final AdminService  AdminService;

	@Autowired
	public AdminController(AdminService adminService) {
		super();
		AdminService = adminService;
	}
	
	@RequestMapping(value = "adminPage.me")
    public String loginForm() {
        return "admin/adminPage";
    }
	
	@ResponseBody
	@RequestMapping(value="drawChart.me", produces="application/json; charset-UTF-8")
	public String drawChart() {
		ArrayList<ChartDateDto> list = AdminService.drawChart();
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value = "adminReport.me")
	public String adminReport(@RequestParam(required = false) String category, Model model) {
	    // category 값이 존재하면 모델에 추가
	    if (category != null) {
	        model.addAttribute("category", category);
	    }
	    // 반환할 뷰 이름
	    return "admin/adminPageReport";
	}
	
	@ResponseBody
	@RequestMapping(value="selectReportList.me", produces="application/json; charset-UTF-8")
	public String selectReportList() {
		ArrayList<MemberPenalty> list = AdminService.selectReportList();
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value = "blockUser.me")
	public String blockUser() {
		return "admin/adminPageBlock";
	}

}
