package com.yi.persistence;

import java.util.List;

import com.yi.domain.Price;

public interface PriceDao {
	
	public List<Price> listPrice() throws Exception;
	public void insertPrice(Price price) throws Exception;
	public Price selectPriceByPno(int pNo) throws Exception;
}
