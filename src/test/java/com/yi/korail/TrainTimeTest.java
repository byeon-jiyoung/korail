package com.yi.korail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.TrainTime;
import com.yi.persistence.TrainTimeDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TrainTimeTest {
	
	@Autowired
	TrainTimeDao dao;
	
	@Test
	public void testList() throws Exception {
		List<TrainTime> list = dao.listTrainTime();
		
		for(TrainTime tt : list) {
			System.out.println(tt);
		}
	}
}
