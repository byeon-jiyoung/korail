package com.yi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Sale;
import com.yi.persistence.ReservationDao;
import com.yi.persistence.SaleDao;

@Service
public class SaleServiceImpl implements SaleService {
	
	@Autowired
	SaleDao sDao;
	@Autowired
	ReservationDao rDao;
	
	@Override
	@Transactional
	public void insertSale(Sale sale) throws Exception {
		sDao.insertSale(sale);
		
		Sale s = sDao.selectSalelately();
		s.getSalNo();
		System.out.println("---------------------------"+s.getSalNo());
		
		int r = rDao.selectResClaNum();
		
		rDao.updateSalNo(s.getSalNo(),r);
	}

}
