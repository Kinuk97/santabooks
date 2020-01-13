package com.santabooks.subscribe.dao.face;


import java.util.List;
import java.util.Map;

import com.santabooks.member.dto.Member;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.subscribe.dto.Shipment;
import com.santabooks.subscribe.dto.Subscription;

public interface SubscribeDao {

	public void insertSub(Subscription subscription);

	public Member getInfo(String id);

	public int getmemNo(String memberId);

	public Subscription getsubNo(String memberId);

	public void updatecheck(String memberId);

	public Member getGenre(String id);

	public Book getbookGenreNo(String genreNo);

	public void insertshipsInfo(Shipment shipment);

	public List<Map<String, Object>> selectShippedBooks(int memberNo);




}
