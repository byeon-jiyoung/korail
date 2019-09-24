package com.yi.korail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.Price;
import com.yi.persistence.PriceDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PriceTest {
	
	@Autowired
	PriceDao dao;
	
	@Test
	public void testList() throws Exception {
		List<Price> list = dao.listPrice();
		
		for(Price p : list) {
			System.out.println(p.toString());
		}
	}
}
