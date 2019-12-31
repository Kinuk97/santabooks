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

import com.santabooks.novel.dto.Episode;
import com.santabooks.novel.dto.Novel;
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
		model.addAttribute("best", novelService.getBestNovel(paging.getCategory()));
		model.addAttribute("url", req.getRequestURI());
	}

	@RequestMapping(value = "/novel/view", method = RequestMethod.GET)
	public void showList(Model model, Paging paging) {

		paging.setTableName("episode");

		paging = novelService.getPaging(paging);

		model.addAttribute("episodeList", novelService.getEpisodeList(paging));
		model.addAttribute("novel", novelService.getNovelByNovelNo(paging));
		model.addAttribute("paging", paging);
	}

	@RequestMapping(value = "/novel/add", method = RequestMethod.GET)
	public void addNovel() {

	}

	@RequestMapping(value = "/novel/add", method = RequestMethod.POST)
	public String addNovel(Novel novel, HttpSession session) {
		// 아직 로그인하면 멤버번호를 저장안함....
//		novel.setMemberNo(Integer.parseInt((String) session.getAttribute("memberNo")));
		
		novelService.addNovel(novel);

		return "redirect:/novel/view?novelNo=" + novel.getNovelNo();
	}

	@RequestMapping(value = "/episode/add", method = RequestMethod.GET)
	public void addEpisode(int novelNo, Model model) {
		model.addAttribute("novelNo", novelNo);
	}

	@RequestMapping(value = "/episode/add", method = RequestMethod.POST)
	public String addEpisode(Episode episode) {
		novelService.addEpisode(episode);
		
		// list? view?
		return "redirect:/";
	}

}
