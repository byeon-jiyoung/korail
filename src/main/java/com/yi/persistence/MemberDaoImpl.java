package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	private static final String namespace = "com.yi.mapper.MemberMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Member> listMember() throws Exception {
		return sqlsession.selectList(namespace + ".listMember");
	}

	@Override
	public Member selectMemberByIdPw(String id, String pw) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", id);
		map.put("memPw", pw);
		
		return sqlsession.selectOne(namespace + ".selectMemberByIdPw", map);
	}

}
