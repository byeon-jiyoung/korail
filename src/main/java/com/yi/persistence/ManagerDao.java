package com.yi.persistence;

import com.yi.domain.Manager;

public interface ManagerDao {

	public Manager selectManagerByIdPw(String id, String pw) throws Exception;
		
}
