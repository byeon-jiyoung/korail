package com.yi.persistence;

import java.util.List;

import com.yi.domain.Member;

public interface MemberDao {
	
	public List<Member> listMember() throws Exception;
	public Member selectMemberByIdPw(String id, String pw) throws Exception;
	
}
