package com.santabooks.www;

import java.util.List;

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
import com.santabooks.novel.dto.Novel;
import com.santabooks.novel.service.face.NovelService;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.reviewSns.service.face.ReviewSnsService;
import com.santabooks.subscribe.service.face.SubscribeService;
import com.santabooks.util.Paging;

@Controller
public class MypageWritingController {

	@Autowired NovelService novelService;
	@Autowired MypageService mypageService;
	@Autowired ReviewSnsService reviewSnsService;
	@Autowired SubscribeService subscribeservice;

	private static final Logger logger = LoggerFactory.getLogger(MypageWritingController.class);

	@RequestMapping(value = "/mypage/favorite", method = RequestMethod.GET)
	public String favorite(Model model, Paging paging, HttpSession session) {

		paging.setMemberNo(Integer.parseInt(session.getAttribute("MemberNo").toString()));

		paging.setTableName("favorite");
		Paging result = novelService.getPaging(paging);
		List<Novel> list = novelService.getMyNovelByFavorite(result);

		model.addAttribute("mypageList", list);

		logger.info(list.toString());

		logger.info("즐겨찾기");

		return "/mypage/favorite";
	}

	@RequestMapping(value = "/mypage/novelList", method = RequestMethod.GET)
	public void novelList(Paging paging, Model model, HttpSession session, HttpServletRequest req) {

		int novelMemberNo = (int) session.getAttribute("MemberNo");
		logger.info("세션정보 가져오기 : " + session.getAttribute("MemberNo"));

		paging.setTableName("novel");
		paging.setCategory(6);
		paging.setMemberNo(novelMemberNo);
		paging = novelService.getPaging(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("mypageList", novelService.getMyNovel(paging));
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

	@RequestMapping(value = "/mypage/snsList", method = RequestMethod.GET)
	public void snsList(Model model, Paging paging, HttpServletRequest req, HttpSession session) {

		String id = (String) session.getAttribute("MemberId");
		model.addAttribute("memberId", id);
		
		int userno = (int) session.getAttribute("MemberNo");
		model.addAttribute("MemberNo", userno);
		
		logger.info("리뷰 세션 정보 : " + id);
		
		paging.setMemberId(id);
		paging.setMemberNo(userno);
		
		int totalCount = reviewSnsService.selectCntAll(paging);

		paging = new Paging(totalCount, paging.getCurPage());

		paging.setKeyword(paging.getKeyword());
		paging.setSearchType(paging.getSearchType());
		paging.setMemberNo(userno);
		paging.setMemberNick(paging.getMemberNick());
		
		logger.info(paging.toString());
		
		List<ReviewSns> list = reviewSnsService.getMySns(paging);
		
		logger.info(list.toString());

		model.addAttribute("myReview", list);
		model.addAttribute("paging", paging);
		model.addAttribute("url", req.getRequestURI());

		if (id != null) {
			Member member = subscribeservice.getGenre(id);
			String genreNo = member.getGenre(); // 세션 ID에 따른 Genre번호 가져오기

			// Genre에 따른 Book Data 가져오기
			List<Book> bookInfo = reviewSnsService.getbookgenreNo(genreNo);
			model.addAttribute("bookInfo", bookInfo);
		}

		logger.info("내가 쓴 sns 리스트");
	}

}