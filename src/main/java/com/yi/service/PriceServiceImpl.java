package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Price;
import com.yi.persistence.PriceDao;

@Service
public class PriceServiceImpl implements PriceService {
	
	@Autowired
	PriceDao dao;
	
	@Override
	public List<Price> listPrice() throws Exception {
		return dao.listPrice();
	}

	@Override
	public void insertPrice(Price price) throws Exception {
		dao.insertPrice(price);
	}

	@Override
	public Price selectPriceByPno(int pNo) throws Exception {
		return dao.selectPriceByPno(pNo);
	}

}
