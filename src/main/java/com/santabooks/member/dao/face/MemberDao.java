package com.santabooks.member.dao.face;

import com.santabooks.member.dto.Member;

public interface MemberDao {

	public void join(Member member);

	public int selectByMemberId(Member member);

	public Object selectAll();

	public int nickCheck(String memberId);

	//아이디 중복체크
	public int checkOverId(String member_id);


}
