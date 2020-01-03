package com.santabooks.www;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.santabooks.novel.dao.face.NovelDao;
import com.santabooks.subscribe.dto.Subscription;
import com.santabooks.subscribe.service.face.SubscribeService;

@Controller
public class HomeController {
	
	@Autowired private SubscribeService subscribeservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Subscription subscription, HttpSession session) {
		Date date = new Date();
		
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
//		String memberId = (String) session.getAttribute("MemberId");
//		subscription = subscribeservice.getsubNo(memberId);		
//		model.addAttribute("subscription", subscription);
//		
		
		if(session.getAttribute("MemberId") != null) {
			String memberId = (String) session.getAttribute("MemberId");
			subscription = subscribeservice.getsubNo(memberId);		
			model.addAttribute("subscription", subscription);
			} else {
				return "main";
			}
		
		return "main";
	}
	
}
