package com.santabooks.www;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.santabooks.subscribe.dto.Subscription;
import com.santabooks.subscribe.service.face.SubscribeService;

@Controller
public class mainController {
	
	@Autowired private SubscribeService subscribeservice;
	
	@RequestMapping(value="/main")
	public String main(Model model, Subscription subscription, HttpSession session) {

		if(session.getAttribute("MemberId") != null) {
			String memberId = (String) session.getAttribute("MemberId");
			subscription = subscribeservice.getsubNo(memberId);		
			model.addAttribute("subscription", subscription);
			} else {
				return "redirect:/";
			}
			return "/main";
		}
}
