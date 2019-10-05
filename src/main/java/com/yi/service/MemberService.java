package com.yi.service;

import java.util.List;

import com.yi.domain.Member;

public interface MemberService {
	
	public List<Member> listMember() throws Exception;
	public Member selectMemberByIdPw(String id, String pw) throws Exception;
	
}
