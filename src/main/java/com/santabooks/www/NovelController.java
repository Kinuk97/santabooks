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
import org.springframework.web.bind.annotation.RequestParam;

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
		novel.setMemberNo(Integer.parseInt(session.getAttribute("MemberNo").toString()));

		novelService.addNovel(novel);

		return "redirect:/novel/view?novelNo=" + novel.getNovelNo();
	}

	@RequestMapping(value = "/episode/add", method = RequestMethod.GET)
	public void addEpisode(@RequestParam(defaultValue = "0") int novelNo, Model model) {
		model.addAttribute("novelNo", novelNo);
	}

	@RequestMapping(value = "/episode/add", method = RequestMethod.POST)
	public String addEpisode(Episode episode) {
		novelService.addEpisode(episode);

		// list? view?
		return "redirect:/novel/view?novelNo=" + episode.getNovelNo();
	}

	@RequestMapping(value = "/episode/view", method = RequestMethod.GET)
	public void viewEpisode(Model model, Paging paging, Episode episode) {

		paging.setTableName("episode");
		
		model.addAttribute("novel", novelService.getNovelByNovelNo(paging));
		model.addAttribute("episode", novelService.getEpisode(episode));
	}

}
