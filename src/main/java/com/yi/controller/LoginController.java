package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login/")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGet() {
		logger.info("---------- loginGet ----------");
	}
	
	@RequestMapping(value="loginPost", method=RequestMethod.POST)
	public void loginPost() throws Exception { //브라우저에서 받아오는 정보
		logger.info("---------- loginPost ----------");
	}
}
