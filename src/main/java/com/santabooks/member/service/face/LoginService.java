package com.santabooks.member.service.face;

import java.util.Map;

import com.santabooks.member.dto.Member;
import com.santabooks.member.exception.MemberNotFoundException;

public interface LoginService {

	public boolean login(Member member);
	
	public Member getMember(Member membmer);

	public void change_pass(Map<String, Object> map);
	public void login(String id_token, String string) throws MemberNotFoundException;
}
