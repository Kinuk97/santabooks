package com.santabooks.www;

import java.util.List;
import java.util.Map;

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
import com.santabooks.subscribe.service.face.SubscribeService;

@Controller
public class MypageShipmentController {
	
	@Autowired private MypageService mypageService;
	@Autowired private SubscribeService subscribeservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageShipmentController.class);

	@RequestMapping(value = "/mypage/shipmentList", method = RequestMethod.GET)
	public void shipmentList(HttpSession session, Model model) {
		int no = (Integer)session.getAttribute("MemberNo");

		Member member = mypageService.info(no);
		List<Map<String,Object>> list = subscribeservice.getShippedBookList(member);
		
		model.addAttribute("list", list);
		logger.info("받은책 목록 요청");
	}
	
}
