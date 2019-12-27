package com.santabooks.www;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.santabooks.novel.service.face.NovelService;
import com.santabooks.util.Paging;

@Controller
public class NovelController {

	@Autowired
	private NovelService novelService;

	private static final Logger logger = LoggerFactory.getLogger(NovelController.class);

	@RequestMapping(value = "/novel/list", method = RequestMethod.GET)
	public void showList(Paging paging, Model model, HttpServletRequest req) {
		paging.setTableName("novel");
		paging = novelService.getPaging(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("list", novelService.getNovelList(paging));
		model.addAttribute("best", novelService.getBestNovel());
		model.addAttribute("url", req.getRequestURI());
	}

}
