package com.santabooks.www;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageInfoController.class);
	
	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET)
	public void main() {
		logger.info("메인 요청");
	}
	
	@RequestMapping(value = "/mypage/drawal", method = RequestMethod.GET)
	public void drawal() {
		logger.info("탈퇴 요청");
	}

}
