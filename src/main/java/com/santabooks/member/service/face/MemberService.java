package com.santabooks.member.service.face;

import org.springframework.stereotype.Service;

import com.santabooks.member.dto.Member;

@Service
public interface MemberService  {

	public boolean join(Member writer);
	
	
	public int nickCheck(String memberNick) ;

	public boolean getMember();

	//중복 아이디 체크
	public int memberIdCheck(String member_id);

	
	

}