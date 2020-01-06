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
import com.santabooks.member.service.face.LoginService;
import com.santabooks.novel.dto.Score;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.reviewSns.dto.Grade;
import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.reviewSns.service.face.ReviewSnsService;
import com.santabooks.util.Paging;

@Controller
public class ReviewSnsController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewSnsController.class);

	@Autowired
	private ReviewSnsService reviewSnsService;

	@RequestMapping(value = "/sns/list", method = RequestMethod.GET)
	public void snsList(Model model, Paging paging, HttpServletRequest req) {

//		member.setMemberNo((int) session.getAttribute("MemberNo"));
//		Member user = reviewSnsService.getMember(member);
//		logger.info("멤버 닉네임 제발 나와라! : " + user);

		int totalCount = reviewSnsService.selectCntAll(paging);

		Paging reviewPaging = new Paging(totalCount, paging.getCurPage());
		reviewPaging.setKeyword(paging.getKeyword());
		reviewPaging.setSearchType(paging.getSearchType());
		reviewPaging.setMemberId(paging.getMemberId());
		reviewPaging.setMemberNick(paging.getMemberNick());

		List<ReviewSns> list = reviewSnsService.snsList(reviewPaging);

		logger.info(list.toString());
		logger.info("페이징 정보 : " + reviewPaging);

//		model.addAttribute("member",user);
		model.addAttribute("reviewList", list);
		model.addAttribute("paging", reviewPaging);
		model.addAttribute("url", req.getRequestURI());
	}

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
//				grade.setBookNo(review.getBookNo());
				
				model.addAttribute("grade", reviewSnsService.getMyGrade(grade));							
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("review", review);
		model.addAttribute("list", list);
	}

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

	@RequestMapping(value = "/sns/reviewall", method = RequestMethod.GET)
	public void reviewList(Model model, Paging paging, HttpServletRequest req, ReviewSns reviewSns, int bookNo) {
		int totalCount = reviewSnsService.selectCntAll2(paging);

		Book bookInfo = reviewSnsService.getBook(bookNo);

		logger.info("bookno : " + reviewSns);

		Paging reviewPaging = new Paging(totalCount, paging.getCurPage());
		reviewPaging.setBookNo(reviewSns.getBookNo());
		reviewPaging.setMemberId(paging.getMemberId());
		reviewPaging.setMemberNick(paging.getMemberNick());
		logger.info("책번호 제발 나와라 : " + reviewPaging);

		List<ReviewSns> list = reviewSnsService.reviewList(reviewPaging);

		logger.info(list.toString());
		logger.info("페이징 정보 : " + reviewPaging);

		model.addAttribute("bookName", bookInfo);
		model.addAttribute("reviewList", list);
		model.addAttribute("paging", reviewPaging);
		model.addAttribute("url", req.getRequestURI());
	}

	@RequestMapping(value = "/sns/detailview", method = RequestMethod.GET)
	public void reviewView(ReviewSns reviewSns, Model model) {

		ReviewSns review = reviewSnsService.detailView(reviewSns);
		logger.info("리뷰속리뷰 : " + review.toString());

		model.addAttribute("review", review);
	}

	@RequestMapping(value = "/sns/write", method = RequestMethod.POST)
	public String reviewWrite(ReviewSns reviewSns, Member member, Model model, HttpSession session) {
		logger.info("글작성전 정보 : " + reviewSns);
		
		reviewSns.setMemberNo((int) session.getAttribute("MemberNo"));
		reviewSnsService.write(reviewSns);

		logger.info("글작성후 정보 : " + reviewSns);

		return "redirect:/sns/list";
	}

	@RequestMapping(value = "/sns/remove", method = RequestMethod.GET)
	public String reivewRemove(ReviewSns reviewSns) {

		reviewSnsService.remove(reviewSns);

		return "redirect:/sns/list";
	}

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
}
