package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yi.domain.Price;
import com.yi.persistence.PriceDao;

public class PriceServiceImpl implements PriceService {
	
	@Autowired
	PriceDao dao;
	
	@Override
	public List<Price> listPrice() throws Exception {
		return dao.listPrice();
	}

}
