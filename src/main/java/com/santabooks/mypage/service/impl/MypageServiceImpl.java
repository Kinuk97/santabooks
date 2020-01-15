package com.santabooks.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.member.dto.Member;
import com.santabooks.mypage.dao.face.MypageDao;
import com.santabooks.mypage.service.face.MypageService;
import com.santabooks.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired private MypageDao mypageDao;
	
	@Override
	public Member info(int no) {
		return mypageDao.selectByNo(no);
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
	public int infoPwChk(Member member) {
		return mypageDao.selectCntPw(member);
	}

	@Override
	public Member subInfo(int subNo) {
		return mypageDao.selectBySub(subNo);
	}
	
	@Override
	public int getUnLogin(Member member) {
		return mypageDao.selectUnLoginByMemberNo(member);
	}

	@Override
	public boolean checkPw(Member member) {
		if ( mypageDao.selectCnt(member) > 0 ) {
			return true;
		} 
		
		return false;
	}

	@Override
	public Member getInformation(Member member) {
		return mypageDao.selectInformationByMemberNo(member);
	}

	@Override
	public void userInformationDelete(Member member) {
		mypageDao.delete(member);
	}

	@Override
	public Member subCancel(int subNo) {
		return mypageDao.selectSubNoBySubNo(subNo);
	}
	
	@Override
	public void subUpdate(Member member) {
		System.out.println("---subDelete");
		mypageDao.deleteSub(member.getSubNo());
		System.out.println("---subUpdate");
		mypageDao.subUpdate(member);
	}


}