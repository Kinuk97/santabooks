package com.santabooks.reviewSns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.reviewSns.dao.face.ReviewSnsDao;
import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.reviewSns.service.face.ReviewSnsService;
import com.santabooks.util.Paging;

@Service
public class ReviewSnsServiceImpl implements ReviewSnsService{
	
	@Autowired ReviewSnsDao reviewSnsDao;

	@Override
	public int selectCntAll() {
		
		return reviewSnsDao.selectCntAll();
	}

	@Override
	public List<ReviewSns> snsList(Paging reviewPaging) {
		
		return reviewSnsDao.selectAll(reviewPaging);
	}

}
