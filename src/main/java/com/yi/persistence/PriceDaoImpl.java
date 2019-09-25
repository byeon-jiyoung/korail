package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Price;

@Repository
public class PriceDaoImpl implements PriceDao {
	private static final String namespace = "com.yi.mapper.PriceMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Price> listPrice() throws Exception {
		return sqlsession.selectList(namespace + ".listPrice");
	}

	@Override
	public void insertPrice(Price price) throws Exception {
		sqlsession.insert(namespace + ".insertPrice", price);
	}

	@Override
	public Price selectPriceByPno(int pNo) throws Exception {
		return sqlsession.selectOne(namespace + ".selectPriceByPno", pNo);
	}

}
