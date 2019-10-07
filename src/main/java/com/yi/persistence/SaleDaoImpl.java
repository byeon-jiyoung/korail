package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Sale;

@Repository
public class SaleDaoImpl implements SaleDao {
	private static final String namespace = "com.yi.mapper.SaleMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Sale> listSale() throws Exception {
		return sqlsession.selectList(namespace + ".listSale");
	}

	@Override
	public void insertSale(Sale sale) throws Exception {
		sqlsession.insert(namespace + ".insertSale", sale);
	}

	@Override
	public Sale selectSalelately() throws Exception {
		return sqlsession.selectOne(namespace + ".selectSalelately");
	}

}
