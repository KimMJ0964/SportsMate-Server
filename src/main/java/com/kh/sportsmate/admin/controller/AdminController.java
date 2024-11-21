package com.kh.sportsmate.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.sportsmate.admin.model.dto.BlockProfileDto;
import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;
import com.kh.sportsmate.admin.service.AdminService;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;

@CrossOrigin
@Controller
public class AdminController {
	private final AdminService adminService;

	@Autowired
	public AdminController(AdminService adminService) {
		super();
		this.adminService = adminService;
	}
	
	@RequestMapping(value = "adminPage.me")
    public String loginForm(Model model) {
		int reportCount = adminService.selectAllListCount();
		int blockCount = adminService.selectBlockListCount();
		
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("reportCount", reportCount);
        return "admin/adminPage";
    }

	@ResponseBody
	@RequestMapping(value="drawChart.me", produces="application/json; charset-UTF-8")
	public String drawChart() {
		ArrayList<ChartDateDto> list = adminService.drawChart();
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value = "adminReport.me")
	public String adminReport(@RequestParam(value = "cpage", defaultValue = "1")
								int currentPage,  // 기본값이 있는 필수 파라미터
								String category,
								Model model) {
	    // category 값이 존재하면 모델에 추가
		
		model.addAttribute("category", category);
	    
		int reportCount = adminService.selectListCount(category);
		
		PageInfo pi = Template.getPageInfo(reportCount, currentPage, 5, 5);
		ArrayList<MemberPenalty> list = adminService.selectList(pi, category);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/adminPageReport";
	}
	
	@RequestMapping(value = "blockUser.me")
	public String blockUser(@RequestParam(value = "memNo", required = false) int memNo, @RequestParam(value = "pnNo", required = false) int pnNo,
							@RequestParam(value = "pnGround", required = false) String pnGround,
							@RequestParam(value = "pnCommunity", required = false) String pnCommunity,
							@RequestParam(value = "pnComment", required = false) String pnComment,
							HttpServletRequest request) {
		// 이전 페이지 URL 가져오기
	    String referer = request.getHeader("Referer");
	    
	    MemberPenalty mp = new MemberPenalty();
	    mp.setMemNo(memNo);
	    mp.setPnNo(pnNo);
	    mp.setPnGround(pnGround);
	    mp.setPnCommunity(pnCommunity);
	    mp.setPnComment(pnComment);
	    
	    int result = adminService.blockUser(mp);
		return "redirect:" + referer;
	}
	
	@RequestMapping(value = "blockCancle.me")
	public String blockCancle(@RequestParam(value = "pnNo", required = false) int pnNo, HttpServletRequest request) {
		// 이전 페이지 URL 가져오기
	    String referer = request.getHeader("Referer");
	    
	    int result = adminService.blockCancle(pnNo);
	    
	    return "redirect:" + referer;
	}
	
	@RequestMapping(value = "blockList.me")
	public String blockList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		
		int blockCount = adminService.selectBlockListCount();
		
		PageInfo pi = Template.getPageInfo(blockCount, currentPage, 5, 5);
		ArrayList<BlockProfileDto> list = adminService.selectBlockList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		System.out.println(list);
		return "admin/adminPageBlock";
	}
	
	@RequestMapping(value = "unblockUser.me")
	public String unblockUser(@RequestParam(value = "memNo", required = false) int memNo, HttpServletRequest request) {
		// 이전 페이지 URL 가져오기
	    String referer = request.getHeader("Referer");
	    
	    int unblock = adminService.unblockUser(memNo);
		
		return "redirect:" + referer;
	}

}
