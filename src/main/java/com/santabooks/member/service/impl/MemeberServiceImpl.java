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
	public boolean join(Member writer) {
		if(memberDao.selectByMemberid(writer)>0)
			return false;
		
		memberDao.join(writer);
		if(memberDao.selectByMemberid(writer)>0)
			return true;
		else return false;

	}
	
	
	

}
