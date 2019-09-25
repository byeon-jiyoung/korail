package com.yi.korail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.Reservation;
import com.yi.persistence.ReservationDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReservationTest {
	
	@Autowired
	ReservationDao dao;
	
	@Test
	public void testList() throws Exception {
		List<Reservation> list = dao.listReservation();
		
		for(Reservation r : list) {
			System.out.println(r);
		}
	}
}
