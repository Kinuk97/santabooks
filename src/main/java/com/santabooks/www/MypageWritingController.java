package com.santabooks.www;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.santabooks.member.dto.Member;
import com.santabooks.mypage.service.face.MypageService;
import com.santabooks.novel.service.face.NovelService;
import com.santabooks.util.Paging;

@Controller
public class MypageWritingController {
	
	@Autowired NovelService novelService;
	@Autowired MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageWritingController.class);
	
	@RequestMapping(value = "/mypage/favorite", method = RequestMethod.GET)
	public void favorite() {
		logger.info("즐겨찾기");
	}
	
	@RequestMapping(value = "/mypage/novelList", method = RequestMethod.GET)
	public void novelList(Paging paging, Model model,HttpSession session, HttpServletRequest req) {
		
		int novelMemberNo = (Integer)session.getAttribute("MemberNo");
		logger.info("novelMemberNo : " + novelMemberNo);
		
		Member myNovelList = mypageService.subInfo(novelMemberNo);
		model.addAttribute("myNovelList", myNovelList);
		
		paging.setTableName("mypageNovel");
		paging = novelService.getPaging(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("mypageList", novelService.getNovelList(paging));
		model.addAttribute("url", req.getRequestURI());
		
		logger.info("마이페이지  웹소설 리스트");
	}

}
