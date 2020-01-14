package com.santabooks.member.dao.face;

import java.util.Map;

import com.santabooks.member.dto.Member;

public interface LoginDao {
	
	public int login(Member member);

	public Member getMember(Member member);

	public void change_pass(Map<String, Object> map);

	public Member selectMemberBySoicalToken(Map<String, String> map);


}
