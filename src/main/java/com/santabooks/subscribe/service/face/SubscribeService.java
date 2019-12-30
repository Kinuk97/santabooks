package com.santabooks.subscribe.service.face;

import com.santabooks.member.dto.Member;
import com.santabooks.subscribe.dto.Subscription;

public interface SubscribeService {

	public void subscribe(Subscription subscription);

	public Member getInfo(String id);

	public int getmemNo(String memberId);

	
}