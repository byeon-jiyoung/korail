package com.yi.korail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.TrainSeat;
import com.yi.persistence.TrainSeatDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TrainSeatTest {
	
	@Autowired
	TrainSeatDao dao;
	
	@Test
	public void testList() throws Exception {
		List<TrainSeat> list = dao.listTrainSeat();
		
		for(TrainSeat ts : list) {
			System.out.println(ts);
		}
		
	}
}
