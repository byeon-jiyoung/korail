package com.yi.korail;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MybatisTest { //이게 문제없이 작동하면 설정은 다 제대로 된거다!!
	
	@Autowired
	private SqlSessionFactory ss;
	
	@Test
	public void testFactory() {
		System.out.println(ss);
	}
	
	@Test
	public void testSession() {
		try(SqlSession session = ss.openSession()) {
			System.out.println(session);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
