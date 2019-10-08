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

}
