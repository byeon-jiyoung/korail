package com.yi.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.Manager;
import com.yi.service.ManagerService;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	
	@Autowired
	ManagerService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void MgnloginGet() {
		logger.info("---------- MgnloginGet ----------");
	}
	
	@RequestMapping(value="loginPost", method=RequestMethod.POST)
	public void MgnloginPost(String manId, String manPw, Model model) throws Exception {
		logger.info("---------- MgnloginPost ----------");
		logger.info(manId +"&"+ manPw);
		
		Manager dbManager = service.selectManagerByIdPw(manId, manPw);
		
		if(dbManager == null) {
			logger.info("login POST ...... login fail, not manager");
			return;
		}
		
		Manager manager = new Manager(manId, manPw);
		model.addAttribute("manager", manager);
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("------------- logout -------------");
		session.invalidate();
		
		return "redirect:/manager/korail";
	}
}
