package com.yi.service;

import com.yi.domain.Manager;

public interface ManagerService {

	public Manager selectManagerByIdPw(String id, String pw) throws Exception;
	
}
