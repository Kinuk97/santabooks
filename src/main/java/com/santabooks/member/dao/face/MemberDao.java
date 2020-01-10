package com.santabooks.member.dao.face;

import com.santabooks.member.dto.Member;

public interface MemberDao {

	public void join(Member member);

	public int selectByMemberId(Member member);

	public Object selectAll();

	public int nickCheck(String memberId);

	public int memberIdCheck(String member_id);


}
