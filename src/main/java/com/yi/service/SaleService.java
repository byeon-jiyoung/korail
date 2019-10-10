package com.yi.service;

import java.util.List;

import com.yi.domain.Reservation;
import com.yi.domain.Sale;

public interface SaleService {
	//sale
	public void insertSale(Sale sale, int mileage, int discount, String id, String memPhone) throws Exception;
	public List<Sale> resultSale(int salNo) throws Exception;
	public int selectSalelately() throws Exception;
	
	//reservation
	public List<Reservation> selecResBySalNo(int salNo, String tName, int ttNo, String tCode, int resClaNum) throws Exception;
	public int selectResClaNum() throws Exception;
	public void updateNoMember(String nomemPhone) throws Exception;
	
}
