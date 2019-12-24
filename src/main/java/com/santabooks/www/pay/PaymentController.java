package com.santabooks.www.pay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class PaymentController {
	
	@RequestMapping(value="/pay/first", method=RequestMethod.GET)
	public void payFirst() { }
	
	
	@RequestMapping(value="/pay/complete", method=RequestMethod.GET)
	public String payComplete() { 
		
		// 나중에 리턴값 수정해야됨
		return "redirect:/main";
		
	}
	
	
	
}