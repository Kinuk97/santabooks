package com.santabooks.www;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.santabooks.reviewSns.service.face.ReviewSnsService;
import com.santabooks.util.Paging;


@Controller
public class ReviewSnsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewSnsController.class);
	
	@Autowired private ReviewSnsService reviewSnsService;
	
	@RequestMapping(value="/sns/list")
	public void snsList(Model model, Paging paging) {
		
	}
}
