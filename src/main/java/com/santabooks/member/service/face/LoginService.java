package com.santabooks.member.service.face;

import com.santabooks.member.dto.Member;

public interface LoginService {

	public boolean login(Member writer);

	public Object getMemberNick(Member writer);
	
//	/**
//	 * 회원 상제정보
//	 * 
//	 * @param id - 로그인 아이디
//	 * @return Member - 회원 정보
//	 */
//	public Member info(String id);

}
