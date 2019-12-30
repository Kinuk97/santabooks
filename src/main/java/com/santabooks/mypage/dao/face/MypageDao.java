package com.santabooks.mypage.dao.face;

import com.santabooks.member.dto.Member;

public interface MypageDao {

	/**
	 * 주어진 id를 이용해 회원정보 조회
	 * 
	 * @param id - 조회 대상 id
	 * @return Member - 조회된 회원 정보
	 */
	public Member selectById(String id);

}
