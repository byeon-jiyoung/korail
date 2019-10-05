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

}
