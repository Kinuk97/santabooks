package com.santabooks.www;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void pay() {}	
	
	@RequestMapping(value="/subscribe/first",  method=RequestMethod.POST)
	public String payment(Subscription subscription, HttpSession session) {
		
		String memberId = (String) session.getAttribute("MemberId");		
		int memberNo = (int) subscribeservice.getmemNo(memberId);		
		session.setAttribute("memberNo", memberNo);
		
		subscription.setMemberNo(memberNo);
		// 로그인한 유저의 memberNo를 DTO에 저장
		
		subscribeservice.subscribe(subscription);
		// 나머지 정보를 저장
		
		Subscription newSub = subscribeservice.getsubNo((String)session.getAttribute("MemberId"));
		System.out.println("id로 받오오기"+newSub);
		
		session.setAttribute("subNo", newSub.getSubNo());
		System.out.println("세션에 받기 : "+session.getAttribute("subNo"));
		
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
	public void paymentfianl() {
	}
	

	
	@RequestMapping(value="/pay/complete", method=RequestMethod.POST)
	public void payComplete( ) { }
	
}
