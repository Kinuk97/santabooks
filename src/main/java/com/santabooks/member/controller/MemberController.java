package com.santabooks.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.santabooks.member.dto.Member;
import com.santabooks.member.service.face.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/main/member")
	public void main() {
	}

	// 회원가입
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public void join() {
	}

	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String joinProcess(Member member, Model model) {
		boolean joinResult = memberService.join(member);
		
		

		if (joinResult) {
			logger.info("회원가입 성공");
			model.addAttribute("msg", "회원가입 성공");
			model.addAttribute("url", "/member/welcome_join");
		} else {
			logger.info("회원가입 실패");
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "/member/join");
		}
		return "/member/alert";
	}
	
	//회원가입 + 장르선택
	@RequestMapping(value="/member/welcome_join", method=RequestMethod.GET)
	public void joinSuccess() {}
	

	@RequestMapping(value="/member/find_pw", method=RequestMethod.GET)
	public void findPw() {}
	
			
	}
	
	
//	@RequestMapping(value="/member/join_nickcheck", method=RequestMethod.POST)
//	public ModelAndView nickCheck(@RequestParam("memberNick") String memberNick, ModelAndView mav) {
//	
//	mav.addObject("nickCheck", 	memberService.nickCheck(memberNick));
//	mav.setViewName("jsonView");
//	logger.info("nickCheck(0-사용가능, 1-중복nick) : " + mav.toString());
//	return mav;
//		
//	}
	
	
//	@RequestMapping(value="/member/join_nickcheck", method=RequestMethod.POST)
//	public String nickCheck(Member member, Model model) {
//		boolean nickcheckResult = memberService.getMember();
//		memberService.join(member);
//		
//		return "/member/alert";	
//		
//	}
	
	
//	@RequestMapping(value="/member/join_nickcheck", method=RequestMethod.POST)
//	public ModelAndView nickCheck(@RequestParam("memberNick") String memberNick, ModelAndView mav) {
//		
//		mav.addObject("nickCheck", 	memberService.nickCheck(memberNick));
//		mav.setViewName("jsonView");
//		logger.info("nickCheck(0-사용가능, 1-중복nick) : " + mav.toString());
//		return mav;
//		
//	
//		
//		
//	}
	
	
	
	



