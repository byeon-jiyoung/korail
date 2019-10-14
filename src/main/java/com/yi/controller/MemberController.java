package com.yi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.Manager;
import com.yi.domain.Member;
import com.yi.service.ManagerService;
import com.yi.service.MemberService;

@Controller
@RequestMapping("/manager/*")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="member", method=RequestMethod.GET)
	public void memberGet(Model model) throws Exception {
		logger.info("---------- memberGet ----------");
		
		List<Member> memList = service.listMember();
		model.addAttribute("memList", memList);
	}
	
}
