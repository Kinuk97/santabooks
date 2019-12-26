package com.santabooks.www;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.santabooks.mypage.service.face.MypageService;

@Controller
public class MypageShipmentController {
	
	@Autowired private MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageShipmentController.class);

	@RequestMapping(value = "/mypage/shipmentList", method = RequestMethod.GET)
	public void drawal() {
		logger.info("받은책 목록 요청");
	}
	
}
