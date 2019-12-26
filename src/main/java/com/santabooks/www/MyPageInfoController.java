package com.santabooks.www;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.santabooks.member.dto.Member;
import com.santabooks.member.service.face.LoginService;

@Controller
public class MyPageInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageInfoController.class);
	
//	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET)
//	public void main(HttpSession session, Model model) {
//		
//		String memberId = (String)session.getAttribute("loginid");
//		
//		 Member info = LoginService.info(memberId);
//		 model.addAttribute("info", info);
//		logger.info("메인 요청");
//	}
	
	@RequestMapping(value = "/mypage/drawal", method = RequestMethod.GET)
	public void drawal() {
		logger.info("탈퇴 요청");
	}
	
	@RequestMapping(value = "/mypage/qna", method = RequestMethod.GET)
	public void qna() {
		logger.info("문의 요청");
	}
	
	@RequestMapping(value = "/mypage/subInfo", method = RequestMethod.GET)
	public void subInfo() {
		logger.info("문의 요청");
	}
	
	@RequestMapping(value = "/mypage/infoUpdate", method = RequestMethod.GET)
	public void infoUpdate() {
		logger.info("개인정보수정 요청");
	}

}
