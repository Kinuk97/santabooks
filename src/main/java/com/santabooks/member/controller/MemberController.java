package com.santabooks.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	@RequestMapping(value="/member/welcome_join", method=RequestMethod.GET)
	public void joinSuccess() {
	}

}
