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
	public int selectSalelately() throws Exception {
		return sqlsession.selectOne(namespace + ".selectSalelately");
	}

	@Override
	public List<Sale> resultSale(int salNo) throws Exception {
		return sqlsession.selectList(namespace + ".resultSale", salNo);
	}

	@Override
	public void updateSalCancel(String salNo) throws Exception {
		sqlsession.update(namespace + ".updateSalCancel", salNo);
	}

}
