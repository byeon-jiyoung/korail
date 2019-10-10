package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Member;
import com.yi.persistence.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	@Override
	public List<Member> listMember() throws Exception {
		return dao.listMember();
	}

	@Override
	public Member selectMemberByIdPw(String id, String pw) throws Exception {
		return dao.selectMemberByIdPw(id, pw);
	}

	@Override
	public void insertMember(Member member) throws Exception {
		dao.insertMember(member);
	}

	@Override
	public Member selectMemberById(String id) throws Exception {
		return dao.selectMemberById(id);
	}

	@Override
	public Member selectMemberByPhone(String phone) throws Exception {
		return dao.selectMemberByPhone(phone);
	}

	@Override
	public int selectMileage(String memId) throws Exception {
		return dao.selectMileage(memId);
	}

	@Override
	public void updateMember(Member member) throws Exception {
		dao.updateMember(member);
	}

	@Override
	public void updatePw(String memId, String newmemPw) throws Exception {
		dao.updatePw(memId, newmemPw);
	}

	@Override
	public void updateTpw(String memId, String newmemTpw) throws Exception {
		dao.updateTpw(memId, newmemTpw);
	}

	@Override
	public String selectPwById(String id) throws Exception {
		return dao.selectPwById(id);
	}

	@Override
	public String selectTpwById(String id) throws Exception {
		return dao.selectTpwById(id);
	}

	@Override
	public int selectNoMemberId() throws Exception {
		return dao.selectNoMemberId();
	}

}
