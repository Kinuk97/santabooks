package com.santabooks.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.member.dto.Member;
import com.santabooks.mypage.dao.face.MypageDao;
import com.santabooks.mypage.service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired private MypageDao mypageDao;
	
	@Override
	public Member info(String id) {
		return mypageDao.selectById(id);
	}

}
