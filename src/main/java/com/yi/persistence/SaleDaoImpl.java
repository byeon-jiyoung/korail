package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.yi.domain.Sale;

public class SaleDaoImpl implements SaleDao {
	private static final String namespace = "com.yi.mapper.SaleMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Sale> listSale() throws Exception {
		return sqlsession.selectList(namespace + ".listSale");
	}

}
