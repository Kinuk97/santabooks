package com.santabooks.member.dao.face;

import com.santabooks.member.dto.Member;

public interface LoginDao {
	
	public int login(Member member);

	public Member getMember(Member member);


}
