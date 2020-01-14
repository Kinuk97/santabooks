package com.santabooks.member.dao.face;

import java.util.Map;

import com.santabooks.member.dto.Member;

public interface MemberDao {

	public void join(Member member);

	public Object selectAll();

	public int nickCheck(String memberNick);

	public int memberIdCheck(String memberId);

	public Member selectMemberByMemberId(String memberId);

	public int selectByMemberId(Member member);

	public void insertSocialMember(Map<String, Object> map);

	public Member selecMemberBySocialToken(Map<String, String> map);


}
