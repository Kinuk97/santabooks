package com.santabooks.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.member.dao.face.LoginDao;
import com.santabooks.member.dto.Member;
import com.santabooks.member.service.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired private LoginDao loginDao;

	@Override
	public boolean login(Member member) {
		int loginChk = loginDao.login(member);
		
		if(loginChk > 0)	return true;
		else return false;
	}

	@Override
	public String getMemberNick(Member member) {
		return loginDao.getmemberNick(member);
	}


}
