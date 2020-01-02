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

	@Override
	public void write(Member member) {
		mypageDao.write(member);		
	}

	@Override
	public int infoPwChk(Member member) {
		return mypageDao.selectCntPw(member);
	}

	@Override
	public QnA qnaView(QnA viewQna) {
		mypageDao.updateHit(viewQna);
		
		return mypageDao.selectQnaByQnaNo(viewQna);
	}

	@Override
	public void qnaUpdate(QnA qna) {
		mypageDao.qnaUpdate(qna);
	}

	@Override
	public void qnaDelete(QnA qna) {
		mypageDao.qnaDelete(qna);
	}

	@Override
	public Member subInfo(int subNo) {
		return mypageDao.selectBySub(subNo);
	}

}