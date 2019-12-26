package com.santabooks.www;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.reviewSns.service.face.ReviewSnsService;
import com.santabooks.util.Paging;


@Controller
public class ReviewSnsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewSnsController.class);
	
	@Autowired private ReviewSnsService reviewSnsService;
	
	@RequestMapping(value="/sns/list", method = RequestMethod.GET)
	public void snsList(Model model, Paging paging) {
		
		int totalCount = reviewSnsService.selectCntAll();
		
		Paging reviewPaging = new Paging(totalCount, paging.getCurPage());
		
		List<ReviewSns> list = reviewSnsService.snsList(reviewPaging);
		
		logger.info(list.toString());
		logger.info("페이징 정보 : " + reviewPaging);
		
		model.addAttribute("reviewList", list);
		model.addAttribute("paging", reviewPaging);
	}
}
