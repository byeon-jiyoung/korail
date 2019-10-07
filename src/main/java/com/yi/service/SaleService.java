package com.yi.service;

import java.util.List;

import com.yi.domain.Reservation;
import com.yi.domain.Sale;

public interface SaleService {
	//sale
	public void insertSale(Sale sale) throws Exception;
	public Sale resultSale(int salNo) throws Exception;
	public int selectSalelately() throws Exception;
	
	//reservation
	public List<Reservation> selecResBySalNo(int salNo) throws Exception;
}
