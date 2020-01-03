package com.santabooks.www;

import java.time.LocalDate;
import java.util.List;

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
import com.santabooks.mypage.dto.QnA;
import com.santabooks.mypage.service.face.MypageService;
import com.santabooks.subscribe.dto.Subscription;
import com.santabooks.util.Paging;

@Controller
public class MyPageInfoController {
	
	 @Autowired private MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageInfoController.class);
	
	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET)
	public void main(HttpSession session, Model model) {
		
		int no = (int)session.getAttribute("MemberNo");
		
		Member info = mypageService.info(no);
		   
		model.addAttribute("info", info);
		   
		logger.info("개인정보조회 요청");
		   
	}
	
	@RequestMapping(value = "/mypage/infoUpdate", method = RequestMethod.GET)
	public void infoUpdate(Member member, HttpSession session, Model model) {
		
		member = mypageService.infoUpdateView(member);
		model.addAttribute("view", member);
		
		logger.info(member.toString());
		logger.info("개인정보수정 요청");
		
	}
	
	@RequestMapping(value="/mypage/infoUpdate", method=RequestMethod.POST)
	public String updateProcess(Member member) {
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
	
	@RequestMapping(value="/mypage/deletePwChk", method=RequestMethod.GET)
	public void drawalPwChk() {
		logger.info("회원탈퇴 비밀번호 확인 요청");
	}
	
	@RequestMapping(value="/mypage/deletePwChk", method=RequestMethod.POST)
	public String deletePwCheckProc(Member member, HttpSession session) {

		String id = (String)session.getAttribute("MemberId");
		logger.info(member.toString());
		
		boolean isPw = mypageService.checkPw(id);
		
		// 비밀번호 체크 성공
		if( isPw ) {
			return "redirect:/mypage/delete?memberId=" + member.getMemberId();
		}
		
		// 비밀번호 체크 실패
		return "redirect:/mypage/deletePwChk";
	}
	
	@RequestMapping(value = "/mypage/delete", method = RequestMethod.GET)
	public String drawal(Member member, Model model) {
		logger.info(member.toString());
		member = mypageService.info(member);
		model.addAttribute("member", member);
		
		return "/mypage/deleteOk";
	}
	
	@RequestMapping(value="/mypage/delete", method=RequestMethod.POST)
	public String drawalProc(Member member, HttpSession session) {
		
		logger.info(member.toString());
		
		mypageService.InfoDelete(member);
		
		session.invalidate();
		
		return "/main";
	}
	
	@RequestMapping(value = "/mypage/qna", method = RequestMethod.GET)
	public void qna() {
		logger.info("고객센터 요청");
	}
	
	@RequestMapping(value = "/mypage/qnaList", method = RequestMethod.GET)
	public void list(Paging inData, Model model) {
		
		Paging paging = mypageService.getPaging(inData);
		model.addAttribute("paging", paging);
		logger.info(paging.toString());
		
		List<QnA> list = mypageService.list(paging);
		model.addAttribute("list", list);

		logger.info("문의 요청");
	}
	
	@RequestMapping(value = "/mypage/qnaWrite", method = RequestMethod.GET)
	public void qnaWrite() {
		logger.info("문의글쓰기 요청");
	}
	
	@RequestMapping(value = "/mypage/qnaWrite", method = RequestMethod.POST)
	public String qnaWriteProc(Member member, HttpSession session) {
		
		// 작성자 아이디 추가
		member.setMemberId((String) session.getAttribute("MemberId"));

		mypageService.write(member);

		logger.info("문의글쓰기 요청");

		return "redirect:/qna/list";
				
	}
	
	@RequestMapping(value="/mypage/qnaView", method=RequestMethod.GET)
	public String view( QnA viewQna, Model model, HttpSession session) {
		
		// 게시글 번호가 1보다 작으면 목록으로 보내기
		if(viewQna.getQnaNo() < 1) {
			return "redirect:/mypage/qnaList";
		}
		
		// 게시글 상세 정보 전달
		viewQna = mypageService.qnaView(viewQna);
		model.addAttribute("viewQna", viewQna);

		return "/mypage/qnaView";
	}
	
	@RequestMapping(value="/mypage/qnaUpdate", method=RequestMethod.GET)
	public void qnaUpdate(QnA qna, HttpSession session, Model model) {
		
		qna = mypageService.qnaView(qna);
		model.addAttribute("viewQna", qna);
	}

	@RequestMapping(value="/mypage/qnaUpdate", method=RequestMethod.POST)
	public String qnaUpdateProc(QnA qna) {
		mypageService.qnaUpdate(qna);
		
		return "redirect:/mypage/qnaView?qnaNo="+qna.getQnaNo();
	}

	@RequestMapping(value="/mypage/anqDelete", method=RequestMethod.GET)
	public String qnaDeleteProc(QnA qna, Model model) {
		mypageService.qnaDelete(qna);
		
		model.addAttribute("msg", "게시글 삭제 완료");
		model.addAttribute("url", "/mypage/qnaList");
		
		return "util/alert";
	}
	
	@RequestMapping(value = "/mypage/subInfo", method = RequestMethod.GET)
	public void subInfo(Member member, Subscription subScription, HttpSession session, Model model) {
		
		logger.info("membeRNo : " + session.getAttribute("MemberNo") );
		
		int subNo = (Integer)session.getAttribute("MemberNo");
		logger.info("subNo : " + subNo);
		
		Member subInfo = mypageService.subInfo(subNo);
		
		model.addAttribute("subInfo", subInfo);
		logger.info("jsp로가는 subInfo : " + subInfo.toString());
		logger.info("구독정보 요청");
	}
	
	@RequestMapping(value = "/mypage/subCancel", method = RequestMethod.GET)
	public void subCancel() {
		logger.info("구독취소 요청");
	}
	
}