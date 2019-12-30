package com.santabooks.mypage.service.face;

import com.santabooks.member.dto.Member;

public interface MypageService {
	
	/**
	 * 회원 상제정보
	 * 
	 * @param id - 로그인 아이디
	 * @return Member - 회원 정보
	 */
	public Member info(String id);
	
	/**
	 * 개인정보 수정
	 * 
	 * @param member - 요청 정보 객체
	 * @return 
	 */
	public Member infoUpdateView(Member member);

	public void infoUpdate(Member member);

}
