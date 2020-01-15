package com.santabooks.mypage.dao.face;

import com.santabooks.member.dto.Member;

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

	public int selectCntPw(Member member);

	public Member selectBySub(int subNo);

	public void delete(Member member);

	public int selectUnLoginByMemberNo(Member member);

	public int selectCnt(Member member);

	public Member selectInformationByMemberNo(Member member);

	public Member selectSubNoBySubNo(int subNo);

	public void deleteSub(int subNo);
	
	public void subUpdate(Member member);

}
