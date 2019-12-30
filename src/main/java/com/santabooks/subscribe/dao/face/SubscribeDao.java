package com.santabooks.subscribe.dao.face;

import com.santabooks.member.dto.Member;
import com.santabooks.subscribe.dto.Subscription;

public interface SubscribeDao {

	public void insertSub(Subscription subscription);

	public Member getInfo(String id);

	public int getmemNo(String memberId);

}
