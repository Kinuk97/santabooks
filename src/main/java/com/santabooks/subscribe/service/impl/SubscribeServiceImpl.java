package com.santabooks.subscribe.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.santabooks.member.dto.Member;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.subscribe.dao.face.SubscribeDao;
import com.santabooks.subscribe.dto.Subscription;
import com.santabooks.subscribe.service.face.SubscribeService;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired private SubscribeDao subscribeDao;
	
	@Override
	public void subscribe(Subscription subscription) {
	
		LocalDateTime date = LocalDateTime.now();
		
		subscription.setSubDate(date.toString());
		subscribeDao.insertSub(subscription);
		
	}

	@Override
	public Member getInfo(String id) {
		return subscribeDao.getInfo(id);
	}

	@Override
	public int getmemNo(String memberId) {
		return subscribeDao.getmemNo(memberId);
	}

	@Override
	public Subscription getsubNo(String memberId) {
		return subscribeDao.getsubNo(memberId);
	}

	@Override
	public void updatecheck(String memberId) {
		subscribeDao.updatecheck(memberId);
		
	}

//	@Override
//	public List<Book> getbookNo(Object memberId) {
//		return subscribeDao.getBookNo(memberId);
//	}




}
