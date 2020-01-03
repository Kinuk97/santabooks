package com.santabooks.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.member.dao.face.MemberDao;
import com.santabooks.member.dto.Member;
import com.santabooks.member.service.face.MemberService;

@Service
public class MemeberServiceImpl implements MemberService{
	
	@Autowired private MemberDao memberDao;

	@Override
	public boolean join(Member member) {
		if(memberDao.selectByMemberId(member)>0)
			return false;
		
		memberDao.join(member);
		if(memberDao.selectByMemberId(member)>0)
			return true;
		else return false;

	}

	@Override
	public Object memberNickCheck(String usernick) {

		return memberDao.selectAll();
	}

	@Override
	public Member nickCheck(String memberId) {
		return memberDao.nickCheck(memberId);
	}
	
	
	
	
	

}
