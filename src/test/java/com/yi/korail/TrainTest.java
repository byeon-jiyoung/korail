package com.yi.korail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.Train;
import com.yi.persistence.TrainDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TrainTest {
	
	@Autowired
	TrainDao dao;
	
	@Test
	public void testList() throws Exception {
		List<Train> list = dao.listTrain();
		
		for(Train t : list) {
			System.out.println(t.toString());
		}
	}
}
