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
	public void novelList(Paging paging, Model model, HttpSession session, HttpServletRequest req) {
		
		int novelMemberNo = (Integer)session.getAttribute("MemberNo");
		logger.info("세션정보 가져오기 : " + session.getAttribute("MemberNo"));
		
		Member myNovelList = mypageService.subInfo(novelMemberNo);
		model.addAttribute("myNovelList", myNovelList);
		
		logger.info("myNovelList : " + myNovelList);
		
		paging.setTableName("novel");
		paging.setCategory(6);
		paging = novelService.getPaging(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("mypageList", novelService.getMyNovel(myNovelList));
		model.addAttribute("url", req.getRequestURI());
		
		String param = "";
		
		if (paging.getCategory() != 0) {
			param += "&category=" + paging.getCategory();
		}
		if (paging.getSearch() != null && !"".equals(paging.getSearch())) {
			param += "&search=" + paging.getSearch();
		}
		if (paging.getNovelNo() != 0) {
			param += "&novelNo=" + paging.getNovelNo();
		}
		
		model.addAttribute("query", param);
		
		logger.info("마이페이지  웹소설 리스트");
	}

}
