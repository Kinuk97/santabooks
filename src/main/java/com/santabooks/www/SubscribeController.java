package com.santabooks.www;

import java.time.LocalDateTime;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.santabooks.member.dto.Member;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.subscribe.dto.Shipment;
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
		
		// 로그인한 유저의 memberNo를 DTO에 저장
		subscription.setMemberNo(memberNo);
		

		// 결제한 날짜 저장		
		LocalDateTime date = LocalDateTime.now();
		subscription.setSubDate(date.toString());
		
		// 세션에 결제한 날짜 저장 완료, 순차적으로 구독해야지 뜸 
		session.setAttribute("paydate", date);
		
		
		subscribeservice.subscribe(subscription);
		// 나머지 정보를 저장
		
		Subscription newSub = subscribeservice.getsubNo((String)session.getAttribute("MemberId"));
		System.out.println("id로 받오오기"+newSub);
		
		session.setAttribute("subNo", newSub.getSubNo());
		System.out.println("세션에 받기 : "+session.getAttribute("subNo"));
		
		subscribeservice.updatecheck((String)session.getAttribute("MemberId"));
		
		
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

	@RequestMapping(value="/subscribe/shipment")
	public void shipment(HttpSession session, Member member, Shipment shipment) {
		
		// id로 member 저장되어있는 장르 번호 조회 --> membercontroller 에서 갖고오기
		String id = (String) session.getAttribute("MemberId");
		member = subscribeservice.getGenre(id);
		String genreNo = member.getGenre();
		System.out.println(genreNo); // id에 따른 장르 No 확인 완료
		
		// 장르 일치에 따른 book 가져오기(1개)
		Book bookInfo = subscribeservice.getbookgenreNo(genreNo);
		
//		System.out.println(bookInfo);
		System.out.println(bookInfo.getBookName() + "gdgdg");
		
		Random rand = new Random();
		int shipno = 100000000 + rand.nextInt(900000000);
		System.out.println("운송장 번호 : " +shipno);
		//shipno(운송장 번호 - 대한통운)
		
		// 운송장번호 ; 있는거로 하나 만들기 shipno
		shipment.setShipNo(shipno);
		
		// shipment 테이블에 book 입력
		shipment.setBookNo(bookInfo.getBookNo());
		
		
		// date  = service에서 만들기
		LocalDateTime date = LocalDateTime.now();
		shipment.setShipmentDate(date.toString());
		
		// memberno = 로그인한얘 no
		shipment.setMemberNo((int) session.getAttribute("MemberNo"));
		
		// subNo = 구독정보 가져오기
		shipment.setSubNo((int) session.getAttribute("subNo"));
		
//		System.out.println(shipment);
		
		
		
		subscribeservice.insertShipmentInfo(shipment);
		
	}

	
	
	

	
	@RequestMapping(value="/pay/complete", method=RequestMethod.POST)
	public void payComplete( ) { }
	
}
