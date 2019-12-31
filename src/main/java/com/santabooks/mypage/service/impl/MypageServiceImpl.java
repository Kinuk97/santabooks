package com.santabooks.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.member.dto.Member;
import com.santabooks.mypage.dao.face.MypageDao;
import com.santabooks.mypage.dto.QnA;
import com.santabooks.mypage.service.face.MypageService;
import com.santabooks.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired private MypageDao mypageDao;
	
	@Override
	public Member info(String id) {
		return mypageDao.selectById(id);
	}

	@Override
	public Member infoUpdateView(Member member) {
		
		return mypageDao.infoUpdateView(member);
	}

	@Override
	public void infoUpdate(Member member) {
		mypageDao.infoUpdate(member);
	}

	@Override
	public Paging getPaging(Paging inData) {
		
		int totalCount = mypageDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, inData.getCurPage());
				
		return paging;
	}

	@Override
	public List<QnA> list(Paging paging) {
		
		return mypageDao.selectPageList(paging);
	}

	@Override
	public boolean checkPw(String id) {
		if ( mypageDao.selectCnt(id) > 0 ) {
			return true;
		} 
		
		return false;
	}

	@Override
	public Member info(Member member) {
		return mypageDao.selectInfoByMemberNo(member);
	}

	@Override
	public void InfoDelete(Member member) {
		mypageDao.delete(member);
	}

}