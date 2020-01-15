package com.santabooks.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.activation.CommandMap;
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
import org.springframework.web.bind.annotation.RequestBody;
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
	


	//구글 회원가입하기
	@RequestMapping(value="/member/join/google")
	public String googleJoinForm(Model model, String id_token, String memberId, String memberName) {
		
		model.addAttribute("id_token", id_token);
		model.addAttribute("memberId", memberId);
		model.addAttribute("memberName", memberName);

//		logger.info(id_token);
//		logger.info(memberId);
//		logger.info(memberName);
		
		return "/member/google" ;
	
	}
	
		@ResponseBody
		@RequestMapping(value = "/member/join/google/proc")
		public boolean googleJoinProc(Model model, String id_token, Member member) {
				logger.info("으아아아아아 살려달라");
				logger.info(id_token);
			member.setMemberPw("randompw");
			try {
				memberService.join(member);
				memberService.linkSocial(memberService.getMemberByMemberId(member), id_token, "GOOGLE");
				logger.info("true - " + member);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("false");
				return false;
			}
			
		}


 
	//회원가입 인증 메일 메일sending코드
	
	//이메일 전송
	@RequestMapping(value = "/member/email", method = RequestMethod.GET)
	public void join_mail(Member member, Model model) {
		model.addAttribute("email", member.getMemberId());
	}	
	
	
	
	@RequestMapping( value = "/member/auth.do" , method=RequestMethod.POST )
    public ModelAndView mailSending(HttpServletRequest request, String memberId, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "khsantabooks@gamil.com";
        String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/email_injeung_join");     //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("email", memberId);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }

		//이메일 인증 페이지 맵핑 메소드
		@RequestMapping("/member/email.do")
		public String email() {
		    return "member/email";
		}
		
		
		//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
		//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
		//틀리면 다시 원래 페이지로 돌아오는 메소드
		@RequestMapping(value = "/member/join_injeung.do{dice}", method = RequestMethod.POST)
		public ModelAndView join_injeung(String uemail, String email_injeung, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
		
		    
		    
		    
		    System.out.println("마지막 : email_injeung : "+email_injeung);
		    
		    System.out.println("마지막 : dice : "+dice);
		    
		    
		    //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
		     
		    ModelAndView mv = new ModelAndView();
		    
		    mv.setViewName("/member/join.do");
		    
		    mv.addObject("e_mail",email_injeung);
		    
		    if (email_injeung.equals(dice)) {
		        
        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
        
        
        
		    mv.setViewName("member/join");
        
		    mv.addObject("email",uemail);
        
        //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
        //한번더 입력할 필요가 없게 한다.
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
	        out_equals.flush();
	
	        return mv;
        
        
	    }else if (email_injeung != dice) {
	        
	        
	        ModelAndView mv2 = new ModelAndView(); 
	        
	        mv2.setViewName("member/email_injeung_join");
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	        out_equals.flush();
	        
	
	        return mv2;
	        
	    }    
	
	    return mv;
	    
	}
		
		
		//닉네임중복 체크
		
		@RequestMapping(value = "/member/nickCheck", method = RequestMethod.GET)
		@ResponseBody
		public int nickCheck(@RequestParam("memberNick") String memberNick) {

			return memberService.nickCheck(memberNick);
		
		
	}
		
}

		

		
	



