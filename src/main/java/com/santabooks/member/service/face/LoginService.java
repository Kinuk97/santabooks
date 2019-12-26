package com.santabooks.member.service.face;

import com.santabooks.member.dto.Member;

public interface LoginService {

	public boolean login(Member writer);

	public Object getMemberNick(Member writer);

}
