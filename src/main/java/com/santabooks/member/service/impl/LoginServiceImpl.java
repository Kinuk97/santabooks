package com.santabooks.member.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.member.dao.face.LoginDao;
import com.santabooks.member.dto.Member;
import com.santabooks.member.exception.MemberNotFoundException;
import com.santabooks.member.service.face.LoginService;
import com.santabooks.subscribe.dto.Subscription;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired private LoginDao loginDao;
	@Autowired private HttpSession session;
	

	@Override
	public boolean login(Member member) {
		int loginChk = loginDao.login(member);
		
		if(loginChk > 0)	return true;
		else return false;
	}

	@Override
	public Member getMember(Member member) {
	
		return loginDao.getMember(member);
		

	}
	
	@Override
	public void change_pass(Map<String, Object> map) {
		
		System.out.println("출력확인 : " + map );
		
		loginDao.change_pass(map);
	}

	@Override
	public void login(String id_token, String string) throws MemberNotFoundException{
		Map<String, String> map = new HashMap<>();
		map.put("social_member_key", id_token);
		map.put("social_no", string);
		
		System.out.println("map : " + map);
	
		Member member = loginDao.selectMemberBySoicalToken(map);
		if(member == null) throw new MemberNotFoundException();
		
		setMemberToSession(member);
		

		
	}
	private void setMemberToSession(Member member) {
		session.setAttribute("loggerdInMember", member);
		
	}


}
