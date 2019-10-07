package com.yi.persistence;

import java.util.List;

import com.yi.domain.Sale;

public interface SaleDao {
	public List<Sale> listSale() throws Exception;
	public void insertSale(Sale sale) throws Exception;
	public Sale selectSalelately() throws Exception;
	
}
