package com.yi.persistence;

import java.util.List;

import com.yi.domain.Member;

public interface MemberDao {
	
	public List<Member> listMember() throws Exception;
	public Member selectMemberByIdPw(String id, String pw) throws Exception;
	public void insertMember(Member member) throws Exception;
	public Member selectMemberById(String id) throws Exception;
	public Member selectMemberByPhone(String phone) throws Exception;
	
}
