package com.yi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Manager;
import com.yi.persistence.ManagerDao;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	ManagerDao dao;
	
	@Override
	public Manager selectManagerByIdPw(String id, String pw) throws Exception {
		return dao.selectManagerByIdPw(id, pw);
	}

}
