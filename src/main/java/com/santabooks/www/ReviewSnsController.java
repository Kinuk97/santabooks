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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.santabooks.member.dto.Member;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.reviewSns.dto.Grade;
import com.santabooks.reviewSns.dto.Like;
import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.reviewSns.service.face.ReviewSnsService;
import com.santabooks.subscribe.service.face.SubscribeService;
import com.santabooks.util.Paging;

@Controller
public class ReviewSnsController {

	@Autowired private SubscribeService subscribeservice;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewSnsController.class);

	@Autowired
	private ReviewSnsService reviewSnsService;
	
	// sns 리스트
	@RequestMapping(value = "/sns/list", method = RequestMethod.GET)
	public void snsList(Model model, Paging paging, HttpServletRequest req, HttpSession session) {

		int totalCount = reviewSnsService.selectCntAll(paging);

		Paging reviewPaging = new Paging(totalCount, paging.getCurPage());
		reviewPaging.setKeyword(paging.getKeyword());
		reviewPaging.setSearchType(paging.getSearchType());
		reviewPaging.setMemberId(paging.getMemberId());
		reviewPaging.setMemberNick(paging.getMemberNick());
		
		List<ReviewSns> list = reviewSnsService.snsList(reviewPaging);

		logger.info(list.toString());
		logger.info("페이징 정보 : " + reviewPaging);

		model.addAttribute("reviewList", list);
		model.addAttribute("paging", reviewPaging);
		model.addAttribute("url", req.getRequestURI());
		
		String id = (String) session.getAttribute("MemberId");
		model.addAttribute("memberId",id);
		
		if(id != null) {
			Member member = subscribeservice.getGenre(id);
			String genreNo = member.getGenre();	// 세션 ID에 따른 Genre번호 가져오기
//		System.out.println(genreNo); 
			
			// Genre에 따른 Book Data 가져오기
			List<Book> bookInfo = reviewSnsService.getbookgenreNo(genreNo);
			model.addAttribute("bookInfo", bookInfo);			
		}
		
		
		
	}
	
	// 리뷰 상세보기(책)
	@RequestMapping(value = "/sns/view", method = RequestMethod.GET)
	public void reviewDetail(ReviewSns reviewSns, Model model, HttpSession session) {

		ReviewSns review = reviewSnsService.view(reviewSns);
		
		
		List<ReviewSns> list = reviewSnsService.snsListInBook(review);

		logger.info("리뷰 : " + review.toString());
		logger.info("리스트 : " + list.toString());
		
		Object memberNo = session.getAttribute("MemberNo");
		Grade grade = new Grade();
		
		if(memberNo != null) {
			try {
				grade.setMemberNo(Integer.parseInt(memberNo.toString()));
				grade.setBookNo(review.getBookNo());
				
//				logger.info("grade : " + grade);
//				logger.info("myGrade : " + reviewSnsService.getMyGrade(grade));
//				logger.info("myGrade : " + reviewSnsService.getMyGrade(grade).toString());
				
				model.addAttribute("grade", reviewSnsService.getMyGrade(grade));							
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("review", review);
		model.addAttribute("list", list);
	}
	
	// 네이버 API 책 검색 리스트
	@RequestMapping("/book/list")
	public ModelAndView bookList(@RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();
		
		if (keyword != null) {
			mav.addObject("bookList", reviewSnsService.searchBook(keyword, 10, 1));
		}
		mav.setViewName("/sns/naverBookList");
		mav.addObject("keyword", keyword);
		return mav;
	}
	
	// 상세보기 안에서 리뷰 모두보기
	@RequestMapping(value = "/sns/reviewall", method = RequestMethod.GET)
	public void reviewList(Model model, Paging paging, HttpServletRequest req, ReviewSns reviewSns, int bookNo, HttpSession session) {
		int totalCount = reviewSnsService.selectCntAll2(paging);

		Book bookInfo = reviewSnsService.getBook(bookNo);
		
		logger.info("bookno : " + reviewSns);

		Paging reviewPaging = new Paging(totalCount, paging.getCurPage());
		reviewPaging.setBookNo(reviewSns.getBookNo());
		if( session.getAttribute("MemberNo") != null ) {
			reviewPaging.setMemberNo((Integer)session.getAttribute("MemberNo"));
		}
//		reviewPaging.setMemberId(paging.getMemberId());
//		reviewPaging.setMemberNick(paging.getMemberNick());
		
		logger.info("책번호 제발 나와라 : " + reviewPaging);
		
		List<ReviewSns> list = reviewSnsService.reviewList(reviewPaging);
		
//		ReviewSns reviewInfo = reviewSnsService.getReviewSns(bookNo);
//		Like like = new Like();
		
//		logger.info("리뷰정보 이건 진짜 나와야해 제발!!!!!!!!!!"+reviewInfo.toString());
		
//		like.setFeedNo(reviewInfo.getFeedNo());
//		like.setMemberNo(reviewInfo.getMemberNo());
		
//		int likeCnt = reviewSnsService.getTotalCntLike(like);
//		boolean checkLike = reviewSnsService.isLike(like);
		

		logger.info(list.toString());
		logger.info("페이징 정보 : " + reviewPaging);
		
//		model.addAttribute("likeCnt", likeCnt);
//		model.addAttribute("checkLike", checkLike);		
		model.addAttribute("bookName", bookInfo);
		model.addAttribute("reviewList", list);
		model.addAttribute("paging", reviewPaging);
		model.addAttribute("url", req.getRequestURI());
	}
	
	// 상세보기 안에서 리뷰 상세보기
	@RequestMapping(value = "/sns/detailview", method = RequestMethod.GET)
	public void reviewView(ReviewSns reviewSns, Model model, HttpServletRequest req, HttpSession session) {

		ReviewSns review = reviewSnsService.detailView(reviewSns);
		logger.info("리뷰속리뷰 : " + review.toString());
		
		Like like = new Like();
		like.setFeedNo(review.getFeedNo());
		
		int likeCnt = reviewSnsService.getTotalCntLike(like);
		
		Object obj = req.getSession().getAttribute("MemberNo");
		if (obj != null) {
			like.setMemberNo(Integer.parseInt(obj.toString()));
			boolean checkLike = reviewSnsService.isLike(like);
			model.addAttribute("checkLike", checkLike);
		}
		
		model.addAttribute("review", review);
		model.addAttribute("likeCnt", likeCnt);
	}
	
	// 리뷰 작성
	@RequestMapping(value = "/sns/write", method = RequestMethod.POST)
	public String reviewWrite(ReviewSns reviewSns, Member member, Model model, HttpSession session) {
		logger.info("글작성전 정보 : " + reviewSns);
		
		reviewSns.setMemberNo((int) session.getAttribute("MemberNo"));
		reviewSnsService.write(reviewSns);

		logger.info("글작성후 정보 : " + reviewSns);

		return "redirect:/sns/list";
	}
	
	// 리뷰 삭제
	@RequestMapping(value = "/sns/remove", method = RequestMethod.GET)
	public String reivewRemove(ReviewSns reviewSns) {

		reviewSnsService.remove(reviewSns);

		return "redirect:/sns/list";
	}
	
	// 산타북스 책 리스트
	@RequestMapping(value = "/sns/santabookslist", method = RequestMethod.GET)
	public void santaBooksList(Paging paging, Model model) {
		
		int totalCount = reviewSnsService.selectCntAll3(paging);

		Paging bookPaging = new Paging(totalCount, paging.getCurPage());
		bookPaging.setKeyword(paging.getKeyword());
		bookPaging.setSearchType(paging.getSearchType());
		bookPaging.setMemberId(paging.getMemberId());
		bookPaging.setMemberNick(paging.getMemberNick());

		logger.info("페이징 정보 : " + bookPaging);

		List<Book> list = reviewSnsService.bookList(bookPaging);

		logger.info(list.toString());

		model.addAttribute("santabooksList", list);
		model.addAttribute("paging", bookPaging);
	}
	
	// --------------------------------------------------------
	
	// 별점
	
	@RequestMapping(value = "/sns/grade/add", method = RequestMethod.POST)
	public ModelAndView addGrade(Grade grade, HttpSession session, ModelAndView mav) {
		
		grade.setMemberNo(Integer.parseInt(session.getAttribute("MemberNo").toString()));

		mav.addObject("grade", reviewSnsService.addGrade(grade));
		logger.info("별점 : " + grade);

		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "/sns/grade/remove", method = RequestMethod.POST)
	public ModelAndView removeScore(Grade grade, HttpSession session, ModelAndView mav) {
		grade.setMemberNo(Integer.parseInt(session.getAttribute("MemberNo").toString()));

		mav.addObject("grade", reviewSnsService.removeGrade(grade));
		
		logger.info("별점 : " + grade);
		mav.setViewName("jsonView");

		return mav;
	}
	
	// ------------------------------------------------------------------
	
	// 좋아요
	@RequestMapping(value = "/sns/like", method = RequestMethod.POST)
	public ModelAndView like(ModelAndView mav, Like like, HttpSession session) {
		like.setMemberNo(Integer.parseInt(session.getAttribute("MemberNo").toString()));

		// 좋아요 정보 토글
		boolean result = reviewSnsService.like(like);

		// 좋아요 수 조회
		int cnt = reviewSnsService.getTotalCntLike(like);

		mav.addObject("result", result);
		mav.addObject("likeCnt", cnt);

		// 결과 JSON응답
		mav.setViewName("jsonView");

		return mav;
	}
	
}
