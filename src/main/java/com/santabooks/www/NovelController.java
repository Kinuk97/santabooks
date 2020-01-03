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
import org.springframework.web.servlet.ModelAndView;

import com.santabooks.novel.dto.Episode;
import com.santabooks.novel.dto.Novel;
import com.santabooks.novel.dto.Score;
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
	}

	@RequestMapping(value = "/novel/view", method = RequestMethod.GET)
	public void showList(Model model, Paging paging, HttpServletRequest req) {

		paging.setTableName("episode");

		paging = novelService.getPaging(paging);

		model.addAttribute("episodeList", novelService.getEpisodeList(paging));
		model.addAttribute("novel", novelService.getNovelByNovelNo(paging.getNovelNo()));
		model.addAttribute("paging", paging);
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

	@RequestMapping(value = "/novel/modify", method = RequestMethod.GET)
	public void modifyNovel(Model model, Novel novel) {
		model.addAttribute("novel", novelService.getNovelByNovelNo(novel.getNovelNo()));

	}

	@RequestMapping(value = "/novel/modify", method = RequestMethod.POST)
	public String modifyNovel(Novel novel) {
		novelService.modifyNovel(novel);

		return "redirect:/novel/view?novelNo=" + novel.getNovelNo();
	}

	@RequestMapping(value = "/novel/remove", method = RequestMethod.GET)
	public String removeNovel(Novel novel) {
		novelService.removeNovel(novel);

		return "redirect:/novel/list";
	}

	@RequestMapping(value = "/episode/add", method = RequestMethod.GET)
	public void addEpisode(@RequestParam(defaultValue = "0") int novelNo, Model model) {
		model.addAttribute("novelNo", novelNo);
	}

	@RequestMapping(value = "/episode/add", method = RequestMethod.POST)
	public String addEpisode(Episode episode) {
		novelService.addEpisode(episode);

		return "redirect:/novel/view?novelNo=" + episode.getNovelNo();
	}

	@RequestMapping(value = "/episode/modify", method = RequestMethod.GET)
	public void modifyEpisode(Episode episode, Model model) {
		model.addAttribute("episode", novelService.getEpisode(episode));
	}

	@RequestMapping(value = "/episode/modify", method = RequestMethod.POST)
	public String modifyEpisode(Episode episode) {
		novelService.modifyEpisode(episode);

		logger.info(episode.toString());

		return "redirect:/episode/view?episodeNo=" + episode.getEpisodeNo();
	}

	@RequestMapping(value = "/episode/remove", method = RequestMethod.GET)
	public String removeEpisode(Episode episode) {
		novelService.removeEpisode(episode);

		return "redirect:/novel/view?novelNo=" + episode.getNovelNo();
	}

	@RequestMapping(value = "/episode/view", method = RequestMethod.GET)
	public void viewEpisode(Model model, Episode episode, HttpSession session) {
		episode = novelService.getEpisode(episode);
		
		Object memberNo = session.getAttribute("MemberNo");

		if (memberNo != null) {
			Score score = new Score();
			score.setEpisodeNo(episode.getEpisodeNo());
			try {
				score.setMemberNo(Integer.parseInt(memberNo.toString()));
				
				model.addAttribute("myScore", novelService.getMyScore(score));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		

		model.addAttribute("episode", episode);
		model.addAttribute("novel", novelService.getNovelByNovelNo(episode.getNovelNo()));
	}

	@RequestMapping(value = "/episode/score/add", method = RequestMethod.POST)
	public ModelAndView addScore(Score score, HttpSession session, ModelAndView mav) {
		score.setMemberNo((Integer) session.getAttribute("MemberNo"));

		mav.addObject("score", novelService.addScore(score));

		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "/episode/score/remove", method = RequestMethod.POST)
	public ModelAndView removeScore(Score score, HttpSession session, ModelAndView mav) {
		score.setMemberNo((Integer) session.getAttribute("MemberNo"));

		mav.addObject("score", novelService.removeScore(score));

		mav.setViewName("jsonView");
		
		return mav;
	}
	

}
