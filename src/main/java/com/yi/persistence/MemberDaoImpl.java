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

	@Override
	public void insertMember(Member member) throws Exception {
		sqlsession.insert(namespace + ".insertMember", member);
	}

	@Override
	public Member selectMemberById(String id) throws Exception {
		return sqlsession.selectOne(namespace + ".selectMemberById", id);
	}

	@Override
	public Member selectMemberByPhone(String phone) throws Exception {
		return sqlsession.selectOne(namespace + ".selectMemberByPhone", phone);
	}

	@Override
	public void updateMileage(int mileage, int discount, String id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mileage", mileage);
		map.put("discount", discount);
		map.put("id", id);
		
		System.out.println(mileage + ", " + id);
		
		sqlsession.update(namespace + ".updateMileage", map);
	}

	@Override
	public int selectMileage(String memId) throws Exception {
		return sqlsession.selectOne(namespace+".selectMileage",memId);
	}

	@Override
	public void updateMember(Member member) throws Exception {
		sqlsession.update(namespace + ".updateMember", member);
	}

	@Override
	public void updatePw(String memId, String newmemPw) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("newmemPw", newmemPw);
		
		sqlsession.update(namespace + ".updatePw", map);
	}

	@Override
	public void updateTpw(String memId, String newmemTpw) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("newmemTpw", newmemTpw);
		
		sqlsession.update(namespace + ".updateTpw", map);
	}

	@Override
	public String selectPwById(String id) throws Exception {
		return sqlsession.selectOne(namespace + ".selectPwById", id);
	}

	@Override
	public String selectTpwById(String id) throws Exception {
		return sqlsession.selectOne(namespace + ".selectTpwById", id);
	}

	@Override
	public void insertnoMember(int memId, String memPhone) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("memPhone", memPhone);
		
		sqlsession.insert(namespace + ".insertnoMember", map);
	}

	@Override
	public int selectNoMemberId() throws Exception {
		try {
			return sqlsession.selectOne(namespace + ".selectNoMemberId");
		} catch (NullPointerException e) {
			return 0;
		}
	}

}
