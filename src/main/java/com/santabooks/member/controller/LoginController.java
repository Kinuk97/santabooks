package com.santabooks.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.santabooks.member.dto.Member;
import com.santabooks.member.service.face.LoginService;
import com.santabooks.subscribe.dto.Subscription;
import com.santabooks.subscribe.service.face.SubscribeService;



@Controller
public class LoginController {
	@Autowired private SubscribeService subscribeservice;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	//로그인
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() { }

	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProcess(
			Member member,
			HttpSession session,
			Model model) {
		
		boolean loginResult = loginService.login(member);
		
		if(loginResult) {
			logger.info("로그인 성공");
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("url", "/main");
			
			Member user = loginService.getMember(member);
			
			session.setAttribute("login", true);
			session.setAttribute("MemberId", member.getMemberId());
			session.setAttribute("MemberNick", user.getMemberNick());
			session.setAttribute("MemberNo", user.getMemberNo());
			session.setAttribute("Genre", user.getGenre());
			Subscription subscription = subscribeservice.getsubNo(member.getMemberId());
			if (subscription != null) {
				session.setAttribute("subNo", subscription.getSubNo());
			}
			
			logger.info("세션상태 : " + session.getAttribute("login"));
			logger.info("세션 아이디 : " + session.getAttribute("MemberId"));
			logger.info("닉네임 : "  + session.getAttribute("MemberNick"));
			logger.info("구독정보 : "  + session.getAttribute("subNo"));
			logger.info("장르 확인 : " + session.getAttribute("Genre"));
	
			
		} else {
			logger.info("로그인실패");
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "/member/login_fail");
		}
		
		return "member/alert";
	}
	
	// 로그아웃
	@RequestMapping(value = "/member/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		logger.info("logout");
		
		
		session.invalidate();

		return "redirect:/main";

	}
	 
	//비밀번호 찾기
	@RequestMapping(value = "/member/find_pw")
	public String find_pw_form() throws Exception{
		return "/member/find_pw";
	}
	

	
}
	


