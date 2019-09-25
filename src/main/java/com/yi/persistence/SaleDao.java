package com.yi.persistence;

import java.util.List;

import com.yi.domain.Sale;

public interface SaleDao {
	
	public List<Sale> listSale() throws Exception;
}
