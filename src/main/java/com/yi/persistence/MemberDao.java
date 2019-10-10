package com.yi.persistence;

import java.util.List;

import com.yi.domain.Member;

public interface MemberDao {
	
	public List<Member> listMember() throws Exception;
	public Member selectMemberByIdPw(String id, String pw) throws Exception;
	public void insertMember(Member member) throws Exception;
	public Member selectMemberById(String id) throws Exception;
	public Member selectMemberByPhone(String phone) throws Exception;
	public Member selectMemberByPhone2(String phone) throws Exception;
	public void updateMileage(int mileage, int discount, String id) throws Exception;
	public int selectMileage(String memId) throws Exception;
	public void updateMember(Member member) throws Exception;
	public void updatePw(String memId, String newmemPw) throws Exception;
	public void updateTpw(String memId, String newmemTpw) throws Exception;
	public String selectPwById(String id) throws Exception;
	public String selectTpwById(String id) throws Exception;
	public void insertnoMember(int memId, String memPhone) throws Exception;
	public int selectNoMemberId() throws Exception;
	
}
