package com.yi.korail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.City;
import com.yi.domain.CityTrain;
import com.yi.persistence.CityDao;
import com.yi.persistence.CityTrainDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CityTrainTest {
	
	@Autowired
	CityTrainDao dao;
	
	@Autowired
	CityDao cDao;
	
	@Test
	public void testList() throws Exception {
		List<CityTrain> list = dao.listCityTrain();
		
		for(CityTrain ct : list) {
			System.out.println(ct.toString());
		}
	}
	
	//@Test
	public void testInsert() throws Exception {
		int code = cDao.searchCityCode("대구");
		City city = new City();
		city.setCitycode(code);
		
		CityTrain ct = new CityTrain();
		ct.setNodeid("bb");
		ct.setNodename("bb");
		ct.setCitycode(city);
		
		dao.insertCityTrain(ct);
	}
}
