package com.santabooks.www;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

		int totalCount = reviewSnsService.selectCntAll();

		Paging reviewPaging = new Paging(totalCount, paging.getCurPage());

		List<ReviewSns> list = reviewSnsService.snsList(reviewPaging);

		logger.info(list.toString());
		logger.info("페이징 정보 : " + reviewPaging);

		model.addAttribute("reviewList", list);
		model.addAttribute("paging", reviewPaging);
		model.addAttribute("url", req.getRequestURI());
	}

	@RequestMapping(value = "/sns/view", method = RequestMethod.GET)
	public void reviewDetail(ReviewSns reviewSns, Model model) {

		ReviewSns review = reviewSnsService.view(reviewSns);

		List<ReviewSns> list = reviewSnsService.snsListInBook(review);
		logger.info("리뷰 : " + review.toString());
		logger.info("리스트 : " + list.toString());

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
		return mav;
	}

	@RequestMapping(value = "/sns/reviewall", method = RequestMethod.GET)
	public void reviewList(Model model, Paging paging, HttpServletRequest req, ReviewSns reviewSns) {
		int totalCount = reviewSnsService.selectCntAll();

		logger.info("bookno : "+reviewSns);
		Paging reviewPaging = new Paging(totalCount, paging.getCurPage());
		
		List<ReviewSns> list = reviewSnsService.reviewList(reviewPaging);

		logger.info(list.toString());
		logger.info("페이징 정보 : " + reviewPaging);

		model.addAttribute("reviewList", list);
		model.addAttribute("paging", reviewPaging);
		model.addAttribute("url", req.getRequestURI());
	}
}
