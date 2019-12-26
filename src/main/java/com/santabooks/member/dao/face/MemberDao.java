package com.santabooks.member.dao.face;

import com.santabooks.member.dto.Member;

public interface MemberDao {

	public int selectByMemberid(Member writer);

	public void join(Member writer);

}
