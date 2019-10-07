package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Reservation;
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
		
		int s = sDao.selectSalelately();
		int r = rDao.selectResClaNum();
		
		rDao.updateSalNo(s,r);
	}

	@Override
	public Sale resultSale(int salNo) throws Exception {
		return sDao.resultSale(salNo);
	}

	@Override
	public int selectSalelately() throws Exception {
		return sDao.selectSalelately();
	}

	@Override
	public List<Reservation> selecResBySalNo(int salNo) throws Exception {
		return rDao.selecResBySalNo(salNo);
	}

}
