package com.santabooks.member.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.member.dao.face.MemberDao;
import com.santabooks.member.dto.Member;
import com.santabooks.member.exception.MemberNotFoundException;
import com.santabooks.member.service.face.MemberService;
import com.santabooks.subscribe.dto.Subscription;
import com.santabooks.subscribe.service.face.SubscribeService;

@Service
public class MemeberServiceImpl implements MemberService{
	@Autowired private SubscribeService subscribeservice;
	@Autowired
	private MemberDao memberDao;
	private SqlSessionTemplate memberSqlSession;
	

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
	public boolean getMember() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int nickCheck(String memberNick) {
		int result = memberDao.nickCheck(memberNick);
		return result;
	}

	@Override
	public Member getMemberByMemberId(Member member) throws MemberNotFoundException {
		Member selectedMember = memberDao.selectMemberByMemberId(member.getMemberId());
		
		if (selectedMember == null)
			throw new MemberNotFoundException();
		
		return selectedMember;
	}
	
	@Override
	public void login(String id_token, String google, HttpSession session) throws MemberNotFoundException {
		Map<String, String> map = new HashMap<>();
		map.put("social_member_key", id_token);
		map.put("social_no", google);
		
		Member member = memberDao.selecMemberBySocialToken(map);
		if (member == null) throw new MemberNotFoundException();
		
		session.setAttribute("login", true);
		session.setAttribute("MemberId", member.getMemberId());
		session.setAttribute("MemberNo", member.getMemberNo());
		session.setAttribute("Genre", member.getGenre());
		Subscription subscription = subscribeservice.getsubNo(member.getMemberId());
		if (subscription != null) {
			session.setAttribute("subNo", subscription.getSubNo());
		}
		
	}


	@Override
	public void linkSocial(Object memberByMemberId, String id_token, String string) {
		Map<String, Object> map = new HashMap<>();
//		map.put("memberNo", String.valueOf(((Member) memberByMemberId).getMemberId()));
		map.put("memberNo", ((Member)memberByMemberId).getMemberNo() );
		map.put("id_token", id_token);
		map.put("social_no", string);
		System.out.println(map);
		memberDao.insertSocialMember(map);
		
	}


	

}
