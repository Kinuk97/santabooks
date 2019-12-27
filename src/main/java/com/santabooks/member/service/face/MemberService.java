package com.santabooks.member.service.face;

import org.springframework.stereotype.Service;

import com.santabooks.member.dto.Member;

@Service
public interface MemberService  {

	public boolean join(Member writer);


}
