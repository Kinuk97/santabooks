package com.santabooks.www;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.santabooks.member.dto.Member;
import com.santabooks.mypage.service.face.MypageService;

@Controller
public class MyPageInfoController {
	
	 @Autowired private MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageInfoController.class);
	
	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET)
	public void main(HttpSession session, Model model) {
		   
		   String id = (String)session.getAttribute("MemberId");
		   
		   Member info = mypageService.info(id);
		   
		   model.addAttribute("info", info);
		   
		   logger.info("개인정보조회 요청");
		   
	   }
	
	@RequestMapping(value = "/mypage/infoUpdate", method = RequestMethod.GET)
	public void infoUpdate(Member member, HttpSession session, Model model) {
		
		member = mypageService.infoUpdateView(member);
		model.addAttribute("view", member);
		
		logger.info(member.toString());
		logger.info("개인정보수정 요청");
	}
	
	@RequestMapping(value="/mypage/infoUpdate", method=RequestMethod.POST)
	public String updateProcess(Member member) {
		mypageService.infoUpdate(member);
		
		return "redirect:/mypage/main?memberId="+member.getMemberId();
	}
	
	@RequestMapping(value = "/mypage/drawal", method = RequestMethod.GET)
	public void drawal() {
		
	}
	
	@RequestMapping(value = "/mypage/qna", method = RequestMethod.GET)
	public void qna() {
		logger.info("문의 요청");
	}
	
	@RequestMapping(value = "/mypage/subInfo", method = RequestMethod.GET)
	public void subInfo() {
		logger.info("구독정보 요청");
	}
	
	@RequestMapping(value = "/mypage/subCancel", method = RequestMethod.GET)
	public void subCancel() {
		logger.info("구독취소 요청");
	}
	
}
