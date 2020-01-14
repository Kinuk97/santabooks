package com.santabooks.member.service.face;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.santabooks.member.dto.Member;
import com.santabooks.member.exception.MemberNotFoundException;

@Service
public interface MemberService  {

	public boolean join(Member writer);
	
	
	public int nickCheck(String memberNick) ;

	public boolean getMember();


	void login(String id_token, String google, HttpSession session) throws MemberNotFoundException;


	public Object getMemberByMemberId(Member member) throws MemberNotFoundException;


	public void linkSocial(Object memberByMemberId, String id_token, String string);


	






}