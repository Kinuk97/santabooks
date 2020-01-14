package com.santabooks.mypage.service.face;

import java.util.List;

import com.santabooks.member.dto.Member;
import com.santabooks.mypage.dto.QnA;
import com.santabooks.util.Paging;

public interface MypageService {
	
	/**
	 * 회원 상제정보
	 * 
	 * @param no - 로그인 아이디
	 * @return Member - 회원 정보
	 */
	public Member info(int no);
	
	/**
	 * 개인정보 수정
	 * 
	 * @param member - 요청 정보 객체
	 * @return 
	 */
	public Member infoUpdateView(Member member);

	public void infoUpdate(Member member);

	public Paging getPaging(Paging inData);

	public int infoPwChk(Member member);

	public Member subInfo(int subNo);

	public int getUnLogin(Member member);

	public boolean checkPw(Member member);

	public Member getInformation(Member member);

	public void userInformationDelete(Member member);

	public Member subCancel(int subNo);

	public void subUpdate(Member member);

}
