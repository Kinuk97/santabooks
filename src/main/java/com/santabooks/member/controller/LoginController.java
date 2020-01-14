package com.santabooks.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.santabooks.member.dto.Member;
import com.santabooks.member.exception.MemberNotFoundException;
import com.santabooks.member.service.face.GoogleService;
import com.santabooks.member.service.face.LoginService;
import com.santabooks.subscribe.dto.Subscription;
import com.santabooks.subscribe.service.face.SubscribeService;



@Controller
public class LoginController {
	
	@Autowired private SubscribeService subscribeservice;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired  JavaMailSender mailSender;

	@Autowired
	private LoginService loginService;
	
	//로그인
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login(Model model,
            @CookieValue(value="storeIdCookie", required = false) Cookie storeIdCookie) { 
		
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProcess(
			Member member,
			HttpSession session,
			Model model) {
		
		boolean loginResult = loginService.login(member);
		
		if(loginResult) {
			logger.info("로그인 성공");
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("url", "/main");
			
			Member user = loginService.getMember(member);
			
			session.setAttribute("login", true);
			session.setAttribute("MemberId", member.getMemberId());
			session.setAttribute("MemberNick", user.getMemberNick());
			session.setAttribute("MemberNo", user.getMemberNo());
			session.setAttribute("Genre", member.getGenre());
			Subscription subscription = subscribeservice.getsubNo(member.getMemberId());
			if (subscription != null) {
				session.setAttribute("subNo", subscription.getSubNo());
			}
			
			logger.info("세션상태 : " + session.getAttribute("login"));
			logger.info("세션 아이디 : " + session.getAttribute("MemberId"));
			logger.info("닉네임 : "  + session.getAttribute("MemberNick"));
			logger.info("구독정보 : "  + session.getAttribute("subNo"));
			logger.info("장르확인 : " + session.getAttribute("genre"));
	
			
		} else {
			logger.info("로그인실패");
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "/member/login_fail");
		}
		
		return "member/alert";
	}
	
	
	
	// 로그아웃
	@RequestMapping(value = "/member/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		logger.info("logout");
		
		
		session.invalidate();

		return "redirect:/main";

	}
	 
	
	
	
	
	//로그인 실패
	@RequestMapping(value="/member/login_fail")
	public String login_fail() throws IOException {
		return "/member/login_fail";
		
		
	}

	@RequestMapping(value = "/member/find_pass", method = RequestMethod.GET)
	public void pass_send(){}	
	
	@RequestMapping(value = "/member/find_pass", method = RequestMethod.POST)
	public ModelAndView find_pass(HttpServletRequest request, String member_id, String memberId,
	        HttpServletResponse response_email) throws IOException{
	    
	    //랜덤한 난수 (인증번호)를 생성해서 이메일로 보내고 그 인증번호를 입력하면 이메일을 인증 할 수 있는 페이지로 이동시킴
	    
	    Random r = new Random();
	    int dice = r.nextInt(157211)+48271;
	    
	    String setfrom = "khsantabooks@gmail.com";
	    String tomail = request.getParameter("memberId");    //받는 사람의 이메일
	    String title = "비밀번호 찾기 인증 이메일 입니다.";    //제목
	    String content =
	    
	            System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	                    
	            "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	    
	            "회원가입 인증번호는 " +dice+ " 입니다. "
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            "받으신 인증번호를 홈페이지에 입력해 주시면 인증이 완료 됩니다."; // 내용
	    
	    try {
	
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
	        messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	        messageHelper.setTo(tomail); // 받는사람 이메일
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	        messageHelper.setText(content); // 메일 내용
	        
	        mailSender.send(message);
	
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	    
	    ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
//	    mv.setViewName("/member/mail_send");     //뷰의이름
	    mv.setViewName("member/email_send");     //뷰의이름
	    mv.addObject("dice", dice);
	    mv.addObject("memberId", memberId);
	    
	    System.out.println("mv : "+mv);
	
//	    response_email.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out_email = response_email.getWriter();
//	    out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
//	    out_email.flush();
    
	    
	    return mv;
	    
	    
	}
	
	//로그인 실패 이메일 전송
	@RequestMapping(value = "/member/email_send", method = RequestMethod.GET)
	public void password(){}	

	//비밀번호 이메일 인증번호 전송
//	@RequestMapping(value = "/member/email_send", method = RequestMethod.POST)

	    
	    //요기까지 체크 완료
	    
		@RequestMapping(value = "/member/pass_email", method = RequestMethod.GET)
		public void passwordChange(){	   
	    
	    
	}
	
	@RequestMapping(value = "/member/pass_change", method = RequestMethod.GET)
	public void passwordChangeW(){}	
	
	
	//인증번호를 입력한 후에 확인 버튼을 누르면 자료가 넘어오는 컨트롤러
	@RequestMapping(value = "/member/pass_injeung{dice}", method = RequestMethod.POST)
	    public ModelAndView pass_injeung(String pass_injeung, @PathVariable String dice, String memberId, 
	            HttpServletResponse response_equals) throws IOException{
	    
	    System.out.println("마지막 : pass_injeung : "+pass_injeung);
	    
	    System.out.println("마지막 : dice : "+dice);
	    
	    ModelAndView mv = new ModelAndView();
	    
	    mv.setViewName("/member/pass_change");
	    
	    mv.addObject("memberId",memberId);
	    
	    if (pass_injeung.equals(dice)) {
	        
	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다
	    
	        mv.setViewName("/member/pass_change");
	        
	        mv.addObject("memberId",memberId);
	        
	        //만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
	        out_equals.flush();
	
	        return mv;
	        
	        
	    }else if (pass_injeung != dice) {
	        
	        
	        ModelAndView mv2 = new ModelAndView(); 
	        
	        mv2.setViewName("/member/pass_email");
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	        out_equals.flush();
	        
	
	        return mv2;
	        
	    }    
	
	    return mv;
	    
	}
	
	//요기까지 완료2222
	
	
	
	//변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
	@RequestMapping(value = "/member/change_pass", method = RequestMethod.POST)
	public ModelAndView pass_change(String memberId, HttpServletRequest request, Member dto, HttpServletResponse pass) throws Exception{
  
	String member_pass = request.getParameter("memberPw");
	           logger.info(member_pass);
	String e_mail1 = memberId;
	
	dto.setMemberId(e_mail1);
	dto.setMemberPw(member_pass);
	
	//값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함
	
	Map<String, Object> map = new HashMap<>();
	
	map.put("memberId", dto.getMemberId());
	map.put("memberPw", dto.getMemberPw());
	loginService.change_pass(map);
	
	ModelAndView mv = new ModelAndView();
	
	mv.setViewName("/member/login");
	
	return mv;
	            
	}

	


//	//구글 로그인하기
	

	@ResponseBody
	@RequestMapping(value = "/member/login/google")
	public boolean loginByGoogle(String id_token) {
		logger.info("/member/login/google : " + id_token);
		
		try {
			loginService.login(id_token, "google");
			return true;
		} catch (MemberNotFoundException e) {
			// TODO Auto-generated catch block
			return false;
		}
		
	
	}
	
}