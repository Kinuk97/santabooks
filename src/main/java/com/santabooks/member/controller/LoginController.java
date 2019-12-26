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

import com.santabooks.member.dto.Member;
import com.santabooks.member.service.face.LoginService;



@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	//로그인
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() { }

	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProcess(
			Member writer,
			HttpSession session,
			Model model) {
		
		boolean loginResult = loginService.login(writer);
		
		if(loginResult) {
			logger.info("로그인 성공");
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("url", "/main");
			
			session.setAttribute("login", true);
			session.setAttribute("id", writer.getMemberId());
			session.setAttribute("nick", loginService.getMemberNick(writer));
			
			logger.info("세션상태 : " + session.getAttribute("login"));
			logger.info("세션 아이디 : " + session.getAttribute("id"));
			
		} else {
			logger.info("로그인실패");
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "/member/login");
		}
		
		return "util/alert";
	}
	

	// 로그아웃
	@RequestMapping(value = "/member/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		logger.info("logout");
		
		
		session.invalidate();

		return "redirect:/main";

	}

}
