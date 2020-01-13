package com.santabooks.www;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.santabooks.member.dto.Member;
import com.santabooks.mypage.service.face.MypageService;
import com.santabooks.subscribe.dto.Subscription;

@Controller
public class MyPageInfoController {
	
	 @Autowired private MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageInfoController.class);
	
	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET)
	public void main(HttpSession session, Model model) {
		
		int no = (Integer)session.getAttribute("MemberNo");
		
		Member info = mypageService.info(no);
		   
		String genre = info.getGenre();
		String[] split = genre.split(",");
		String[] gen_arr = new String[split.length];
		
		for (int i = 0; i < split.length; i++) {
			int gen_no = Integer.parseInt(split[i]);
			String gen_str = null;
			switch(gen_no) {
			
			case 1:
				gen_str = "로맨스";
				break;
			case 2:
				gen_str = "판타지";
				break;
			case 3:
				gen_str = "자기계발";
				break;
			case 4:
				gen_str = "예술";
				break;
			case 5:
				gen_str = "컴퓨터/IT";
				break;
			case 6:
				gen_str = "시/에세이";
				break;
			case 7:
				gen_str = "경제/경영";
				break;
			case 8:
				gen_str = "만화";
				break;
			case 9:
				gen_str = "영화";
				break;
			case 10:
				gen_str = "건강";
				break;
			default:
				gen_str = "관심장르 없음";
				break;
			}
			
			gen_arr[i] = gen_str;
		}
		
		model.addAttribute("info", info);
		model.addAttribute("genre", gen_arr);
		   
		logger.info("개인정보조회 요청");
		   
	}
	
	@RequestMapping(value = "/mypage/infoUpdate", method = RequestMethod.GET)
	public void infoUpdate(Member member, HttpSession session, Model model) {
		
		member = mypageService.infoUpdateView(member);
		
		String genre = member.getGenre();
		String[] split = genre.split(",");
		
		
		model.addAttribute("view", member);
		model.addAttribute("genre", split);
		
//		for (String string : split) {
//			logger.info(string);
//		}
		
		logger.info(member.toString());
		logger.info("개인정보수정 요청");
		
	}
	
	@RequestMapping(value="/mypage/infoUpdate", method=RequestMethod.POST)
	public String updateProcess(Member member) {
		logger.info(member.toString());
		mypageService.infoUpdate(member);
		
		return "redirect:/mypage/main?memberId="+member.getMemberId();
	}
	
	@RequestMapping(value = "/mypage/infoPwChk", method = RequestMethod.POST)
	public ModelAndView infoPwChk(Member member, HttpSession session, String memberPw, ModelAndView mav) {
		
		
		member.setMemberId((String)session.getAttribute("MemberId"));
		System.out.println(session.getAttribute("MemberId"));
		member.setMemberPw(memberPw);
		
		int result = mypageService.infoPwChk(member);
		
		mav.addObject("password", result);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value = "/mypage/subInfo", method = RequestMethod.GET)
	public String subInfo(Member member, Subscription subScription, HttpSession session, Model model) {
		
		logger.info("memberNo : " + session.getAttribute("MemberNo") );
		
		int subNo = (Integer)session.getAttribute("MemberNo");
		logger.info("subNo : " + subNo);
		
		Member subInfo = mypageService.subInfo(subNo);
		
		if(subInfo == null) {
			return "redirect:/subscribe/agree";
		}
		
		logger.info("여기 : " + subInfo);
		
		model.addAttribute("subInfo", subInfo);
		
		logger.info("jsp로가는 subInfo : " + subInfo.toString());
		logger.info("구독정보 요청");
		
		return "/mypage/subInfo";
	}
	
	@RequestMapping(value = "/mypage/subCancel", method = RequestMethod.GET)
	public void subCancel(Member member, HttpSession session, Model model) {
		
		int subNo = (Integer)session.getAttribute("MemberNo");
		Member subInfo = mypageService.subInfo(subNo);
		
		model.addAttribute("subCancel", subInfo);
		
		logger.info("구독취소 요청");
	}
	
	@RequestMapping(value = "/mypage/subCancel", method = RequestMethod.POST)
	public String subCancelProc(Member member, HttpSession session, Model model) {
		
		logger.info("member : " + member);
		mypageService.subUpdate(member);
		session.removeAttribute("subNo");
		
		return "redirect:/mypage/main";
	}
	
	@RequestMapping(value = "/mypage/deletepwchk", method = RequestMethod.GET)
	public String deletePwCheck(Member member, HttpSession session) {
		
		member.setMemberNo((int)session.getAttribute("memberNo"));
		
		int nuLogin = mypageService.getUnLogin(member);
		
		if(nuLogin == 1) {
			return "redirect:mypage/delete?memberNo=" + member.getMemberNo();
		}
		
		logger.info("회원탈퇴-비밀번호입력요구창 접속성공");
		
		return "/mypage/deletepwchk";
	}
	
	@RequestMapping(value = "mypage/deletepwchk", method = RequestMethod.POST)
	public String deletePwCheckProc(HttpSession session, Member member) {

		member.setMemberNo((int)session.getAttribute("memberNo"));
		member.setMemberPw((String)session.getAttribute("memberPw"));

		logger.info(member.toString());

		boolean res = mypageService.checkPw(member);

		if (res) { // 맞을때
			return "redirect:/mypage/delete?memberNo=" + member.getMemberNo();
		}

		// 틀릴때
		return "redirect:/mypage/deletepwchk";
	}
	
	@RequestMapping(value="/mypage/delete", method=RequestMethod.GET)
	public String userDelete(Model model, Member member) {
		logger.info("회원탈퇴폼 접속완료");
		
		logger.info("탈퇴 : " + member.toString());
		
		member = mypageService.getInformation(member);		
		
		model.addAttribute("member", member);
		
		
		return "/mypage/deleteForm";
	}

	@RequestMapping(value="/mypage/delete", method=RequestMethod.POST)
	public String userDeleteProc(Member member, HttpSession session) {
		
		logger.info("[POST]-/mypage/delete");
		
		logger.info(member.toString());
		
		mypageService.userInformationDelete(member);
		
		session.invalidate();
		
		return "/main";
	}
	
}