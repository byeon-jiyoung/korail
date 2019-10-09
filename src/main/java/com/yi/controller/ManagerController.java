package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@RequestMapping(value="home", method=RequestMethod.GET)
	public void homeGet() {
		logger.info("---------- homeGet ----------");
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGet() {
		logger.info("---------- loginGet ----------");
	}
}
