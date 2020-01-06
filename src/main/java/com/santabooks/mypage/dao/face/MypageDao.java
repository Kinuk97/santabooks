package com.santabooks.mypage.dao.face;

import java.util.List;

import com.santabooks.member.dto.Member;
import com.santabooks.mypage.dto.QnA;
import com.santabooks.util.Paging;

public interface MypageDao {

	/**
	 * 주어진 id를 이용해 회원정보 조회
	 * 
	 * @param no - 조회 대상 id
	 * @return Member - 조회된 회원 정보
	 */
	public Member selectByNo(int no);
	
	public Member infoUpdateView(Member member);

	public void infoUpdate(Member member);

	public int selectCntAll();

	public List<QnA> selectPageList(Paging paging);

	public int selectCnt(int no);

	public void write(Member member);

	public int selectCntPw(Member member);

	public QnA selectQnaByQnaNo(QnA viewQna);

	public void updateHit(QnA viewQna);

	public void qnaUpdate(QnA qna);

	public void qnaDelete(QnA qna);

	public Member selectBySub(int subNo);

	public void delete(Member member);

}
