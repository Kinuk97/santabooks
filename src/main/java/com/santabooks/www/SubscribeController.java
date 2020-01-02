package com.santabooks.www;

import java.io.Writer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.santabooks.member.dto.Member;
import com.santabooks.subscribe.dto.Subscription;
import com.santabooks.subscribe.service.face.SubscribeService;

@Controller
public class SubscribeController {

	@Autowired private SubscribeService subscribeservice;
	
	
	@RequestMapping(value="/subscribe/agree")
	public void main() {}	

	@RequestMapping(value="/subscribe/first", method=RequestMethod.GET)
	public void pay() {	}	

	
	@RequestMapping(value="/subscribe/first",  method=RequestMethod.POST)
	public String payment(Subscription subscription, HttpSession session) {
		
		String memberId = (String) session.getAttribute("MemberId");
		System.out.println(memberId);
		
		int memberNo = (int) subscribeservice.getmemNo(memberId);
		System.out.println(memberNo);
		
		session.setAttribute("memberNo", memberNo);
		
		subscription.setMemberNo(memberNo);
		System.out.println(subscription);
		
		subscribeservice.subscribe(subscription);	
		return "redirect:/subscribe/final";
	}	

	@RequestMapping(value="/subscribe/getInfo", method=RequestMethod.POST)
	public ModelAndView getInfo(HttpSession session, ModelAndView mav){
		String id = (String) session.getAttribute("MemberId");
		System.out.println(id);
		
		Member member = subscribeservice.getInfo(id); 
//		System.out.println(member);
		
		mav.addObject("member", member);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	@RequestMapping(value="/subscribe/final")
	public void paymentfianl() {}
	

	
	@RequestMapping(value="/pay/complete", method=RequestMethod.POST)
	public void payComplete( ) { }
	
}
