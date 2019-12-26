package com.santabooks.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.santabooks.subscribe.dto.Subscribe;
import com.santabooks.subscribe.service.face.SubscribeService;

@Controller
public class SubscribeController {

//	@Autowired private SubscribeService subscribeservice;
	
	
	@RequestMapping(value="/subscribe/agree")
	public void main() {}	

	@RequestMapping(value="/subscribe/first", method=RequestMethod.GET)
	public void pay() {}	

	@RequestMapping(value="/subscribe/first",  method=RequestMethod.POST)
	public String payment(Subscribe subscribe) {
		
//		System.out.println(subscribe);
//		subscribeservice.subscribe(subscribe);
		
		
		return "redirect:/";
	}	
	
	@RequestMapping(value="/pay/complete", method=RequestMethod.POST)
	public void payComplete( ) { }
	
}
