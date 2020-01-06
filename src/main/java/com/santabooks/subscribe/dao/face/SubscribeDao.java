package com.santabooks.subscribe.dao.face;

import java.util.List;

import com.santabooks.member.dto.Member;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.subscribe.dto.Subscription;

public interface SubscribeDao {

	public void insertSub(Subscription subscription);

	public Member getInfo(String id);

	public int getmemNo(String memberId);

	public Subscription getsubNo(String memberId);

	public void updatecheck(String memberId);

//	public List<Book> getBookNo(Object memberId);


}
