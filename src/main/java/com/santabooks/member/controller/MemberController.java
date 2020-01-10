package com.santabooks.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.santabooks.member.dto.Member;
import com.santabooks.member.service.face.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	@Autowired  JavaMailSender mailSender;


	@RequestMapping(value = "/main/member")
	public void main() {
	}

	// 회원가입
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public void join() {
	}
	
	
	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String joinProcess(Member member, Model model) {
		boolean joinResult = memberService.join(member);
		
		

		if (joinResult) {
			logger.info("회원가입 성공");
			model.addAttribute("msg", "회원가입 성공");
			model.addAttribute("url", "/member/welcome_join");
		} else {
			logger.info("회원가입 실패");
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "/member/join");
		}
		return "/member/alert";
	}
	
	//회원가입 완료
	@RequestMapping(value="/member/welcome_join", method=RequestMethod.GET)
	public void joinSuccess() {}
	
//	
//	// 아이디(이메일) 중복체크
//		@RequestMapping(value="/member/idCheck", method=RequestMethod.POST)
//		public ModelAndView idCheck(@RequestParam("memberId") String userid, ModelAndView mav) {
//			
//			mav.addObject("idCheck",memberService.memberCheck(memberIdCheck));
//			mav.setViewName("jsonView");
//			logger.info("idCheck(0-사용가능, 1-중복id) : " + mav.toString());
//			return mav;
//		}

	
	
	//닉네임 체크
	@RequestMapping(value="/member/join_nickcheck", method=RequestMethod.GET)
	public void joinNick() {}
	
	
	@RequestMapping(value="/member/join_nickcheck", method=RequestMethod.POST)
	public ModelAndView nickCheck(@RequestParam("memberNick") String memberNick, ModelAndView mav) {
		mav.addObject("nickCheck", 	memberService.nickCheck(memberNick));
		mav.setViewName("jsonView");
		
		return mav;	}
	





//회원 가입시 인증 메일 보내기
@RequestMapping(value = "/member/email", method = RequestMethod.GET)
public void password(){}	

//회원 가입시 인증메일전송
@RequestMapping(value = "/member/email", method = RequestMethod.POST)
public ModelAndView email_send(HttpServletRequest request, String member_id, String memberId,
        HttpServletResponse response_email) throws IOException{
    
    //랜덤한 난수 (인증번호)를 생성해서 이메일로 보내고 그 인증번호를 입력하면 비밀번호를 변경할 수 있는 페이지로 이동시킴
    
    Random r = new Random();
    int dice = r.nextInt(157211)+48271;
    
    String setfrom = "khsantabooks@gmail.com";
    String tomail = request.getParameter("memberId");    //받는 사람의 이메일
    String title = "산타북스 회원가입 인증메일 입니다.";    //제목
    String content =
    
            System.getProperty("line.separator")+
            
            System.getProperty("line.separator")+
                    
            "안녕하세요 회원님 산타북스를 찾아주셔서 감사합니다"
            
            +System.getProperty("line.separator")+
            
            System.getProperty("line.separator")+
    
            "회원가입 인증번호는 " +dice+ " 입니다. "
            
            +System.getProperty("line.separator")+
            
            System.getProperty("line.separator")+
            
            "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
    
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
    mv.setViewName("/member/eamil_send");     //뷰의이름
    mv.addObject("dice", dice);
    mv.addObject("memberId", memberId);
    
    System.out.println("mv : "+mv);

//    response_email.setContentType("text/html; charset=UTF-8");
//    PrintWriter out_email = response_email.getWriter();
//    out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
//    out_email.flush();
//    
    
    return mv;
    
    
}
    
//    //요기까지 체크 완료
//    
//	@RequestMapping(value = "/member/eamil_send", method = RequestMethod.GET)
//	public void passwordChange(){	  } 
//    
//
//
////인증번호를 입력한 후에 확인 버튼을 누르면 자료가 넘어오는 컨트롤러
//@RequestMapping(value = "/member/pass_injeung{dice}", method = RequestMethod.POST)
//    public ModelAndView pass_injeung(String pass_injeung, @PathVariable String dice, String memberId, 
//            HttpServletResponse response_equals) throws IOException{
//    
//    System.out.println("마지막 : pass_injeung : "+pass_injeung);
//    
//    System.out.println("마지막 : dice : "+dice);
//    
//    ModelAndView mv = new ModelAndView();
//    
//    mv.setViewName("/member/pass_change");
//    
//    mv.addObject("memberId",memberId);
//    
//    if (pass_injeung.equals(dice)) {
//        
//        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다
//    
//        mv.setViewName("/member/pass_change");
//        
//        mv.addObject("memberId",memberId);
//        
//        //만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.
//        
//        response_equals.setContentType("text/html; charset=UTF-8");
//        PrintWriter out_equals = response_equals.getWriter();
//        out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
//        out_equals.flush();
//
//        return mv;
//        
//        
//    }else if (pass_injeung != dice) {
//        
//        
//        ModelAndView mv2 = new ModelAndView(); 
//        
//        mv2.setViewName("/member/pass_email");
//        
//        response_equals.setContentType("text/html; charset=UTF-8");
//        PrintWriter out_equals = response_equals.getWriter();
//        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
//        out_equals.flush();
//        
//
//        return mv2;
//        
//    }    
//
//    return mv;
//    
//}
//	
//	//요기까지 완료2222
	
	

	
	}
		
		
		
	



