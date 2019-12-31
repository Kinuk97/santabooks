package com.santabooks.novel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.novel.dao.face.NovelDao;
import com.santabooks.novel.dto.Episode;
import com.santabooks.novel.dto.Novel;
import com.santabooks.novel.service.face.NovelService;
import com.santabooks.util.Paging;

@Service
public class NovelServiceImpl implements NovelService {

	@Autowired
	private NovelDao novelDao;

	@Override
	public void addNovel(Novel novel) {
		novelDao.insertNovel(novel);
	}

	@Override
	public void modifyNovel(Novel novel) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Novel> getNovelList(Paging paging) {
		return novelDao.selectNovelList(paging);
	}

	@Override
	public List<Novel> getBestNovel(int category) {
		return novelDao.selectBestNovel(category);
	}

	@Override
	public void addEpisode(Episode episode) {
		novelDao.insertEpisode(episode);
	}

	@Override
	public void modifyEpisode(Episode episode) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeEpisode(Episode episode) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Episode> getEpisodeList(Paging paging) {
		return novelDao.selectEpisodeByNovelNo(paging);
	}

	@Override
	public Paging getPaging(Paging paging) {
		Paging resultPaging = new Paging(novelDao.selectCntList(paging), paging.getCurPage(), 12);
		resultPaging.setSearch(paging.getSearch());
		resultPaging.setSearchno(paging.getSearchno());
		resultPaging.setTableName(paging.getTableName());
		resultPaging.setCategory(paging.getCategory());
		resultPaging.setNovelNo(paging.getNovelNo());

		return resultPaging;
	}

	@Override
	public Episode viewEpidode(Episode episode) {
		return null;
	}

	@Override
	public Novel getNovelByNovelNo(Paging paging) {
		return novelDao.selectNovelByNovelNo(paging);
	}
	
	@Override
	public Episode getEpisode(Episode episode) {
		return novelDao.selectEpisodeByEpisodeNo(episode);
	}

}
