package com.yi.service;

import java.util.List;

import com.yi.domain.Member;

public interface MemberService {
	
	public List<Member> listMember() throws Exception;
	public Member selectMemberByIdPw(String id, String pw) throws Exception;
	public void insertMember(Member member) throws Exception;
	public Member selectMemberById(String id) throws Exception;
	public Member selectMemberByPhone(String phone) throws Exception;
	public int selectMileage(String memId) throws Exception;
	public void updateMember(Member member) throws Exception;
	public void updatePw(Member member, String newmemPw) throws Exception;
	public void updateTpw(Member member, String newmemTpw) throws Exception;
	public String selectPwById(String id) throws Exception;
	public String selectTpwById(String id) throws Exception;
	
}
