package com.yi.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.Member;
import com.yi.service.MemberService;

@Controller
@RequestMapping("/join/")
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="joinStipulation", method=RequestMethod.GET)
	public void joinStipulationGet() {
		logger.info("---------- joinStipulationGet ----------");
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void joinGet() {
		logger.info("---------- joinGet ----------");
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinPost(Member member, String birth, Model model) throws Exception {
		logger.info("---------- joinPost ----------");
		logger.info(member.toString());
		logger.info(birth);
		
		Date memBirth = null;
		if(birth != "") {
			memBirth = new SimpleDateFormat("yyyy-MM-dd").parse(birth);
		}
		logger.info(memBirth+"");
		
		member.setMemBirth(memBirth);
		service.insertMember(member);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="idcheck", method=RequestMethod.POST)
	public @ResponseBody String joinIdcheck(String memId) throws Exception {
		logger.info("---------- joinIdcheck ----------");
		
		Member member = service.selectMemberById(memId);
		String duplication = "";
		
		if(member != null) {
			duplication = "yes";
		}else {
			duplication = "no";
		}
		
		return duplication;
	}
	
	@RequestMapping(value="phonecheck", method=RequestMethod.POST)
	public @ResponseBody String joinPhonecheck(String memPhone) throws Exception {
		logger.info("---------- joinPhonecheck ----------");
		
		Member member = service.selectMemberByPhone(memPhone);
		String duplication = "";
		
		if(member != null) {
			duplication = "yes";
		}else {
			duplication = "no";
		}
		
		return duplication;
	}
	
	@RequestMapping(value="phonecheck2", method=RequestMethod.POST)
	public @ResponseBody String joinPhonecheck2(String memPhone) throws Exception {
		logger.info("---------- joinPhonecheck2 ----------");
		
		Member member = service.selectMemberByPhone2(memPhone);
		String duplication = "";
		
		if(member != null) {
			duplication = "yes";
		}else {
			duplication = "no";
		}
		
		return duplication;
	}
}
