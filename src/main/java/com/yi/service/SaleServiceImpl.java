package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Reservation;
import com.yi.domain.Sale;
import com.yi.persistence.MemberDao;
import com.yi.persistence.ReservationDao;
import com.yi.persistence.SaleDao;

@Service
public class SaleServiceImpl implements SaleService {
	
	@Autowired
	SaleDao sDao;
	@Autowired
	ReservationDao rDao;
	@Autowired
	MemberDao mDao;
	
	@Override
	@Transactional
	public void insertSale(Sale sale, int mileage, int discount, String id, String memPhone) throws Exception {
		sDao.insertSale(sale);
		
		int s = sDao.selectSalelately();
		int r = rDao.selectResClaNum();
		
		rDao.updateSalNo(s,r);
		mDao.updateMileage(mileage, discount, id);
		
		System.out.println(id + "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		
		if(id == "noMem") {
			int lastNoMemId = mDao.selectNoMemberId();
			mDao.insertnoMember(++lastNoMemId, memPhone);
		}
	}

	@Override
	public List<Sale> resultSale(int salNo) throws Exception {
		return sDao.resultSale(salNo);
	}

	@Override
	public int selectSalelately() throws Exception {
		return sDao.selectSalelately();
	}

	@Override
	public List<Reservation> selecResBySalNo(int salNo, String tName, int ttNo, String tCode, int resClaNum) throws Exception {
		return rDao.selecResBySalNo(salNo, tName, ttNo, tCode, resClaNum);
	}

	@Override
	public int selectResClaNum() throws Exception {
		return rDao.selectResClaNum();
	}

	@Override
	public void updateNoMember(String nomemPhone) throws Exception {
		rDao.updateNoMember(nomemPhone);
	}
}
