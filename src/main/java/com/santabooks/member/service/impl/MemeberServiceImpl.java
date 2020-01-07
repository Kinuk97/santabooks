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
	public int nickCheck(String memberId) {
		return memberDao.nickCheck(memberId);
	}

	@Override
	public boolean getMember() {
		// TODO Auto-generated method stub
		return false;
	}
	
	//이메일 중복체크

	@Override
	public int memberIdCheck(String member_id) {
		return 0;
	}
	
	
	
	
	
	
	

}
