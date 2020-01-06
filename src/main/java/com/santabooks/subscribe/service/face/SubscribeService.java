package com.santabooks.subscribe.service.face;

import java.util.List;

import com.santabooks.member.dto.Member;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.subscribe.dto.Subscription;

public interface SubscribeService {

	public void subscribe(Subscription subscription);

	public Member getInfo(String id);

	public int getmemNo(String memberId);

	public Subscription getsubNo(String memberId);

	public void updatecheck(String attribute);

//	public List<Book> getbookNo(Object memberId);

	
}