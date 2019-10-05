package com.yi.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.Login;
import com.yi.domain.Member;
import com.yi.service.MemberService;

@Controller
@RequestMapping("/login/")
public class LoginController {
	
	@Autowired
	MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGet() {
		logger.info("---------- loginGet ----------");
	}
	
	@RequestMapping(value="loginPost", method=RequestMethod.POST)
	public void loginPost(Member member, Model model) throws Exception { //브라우저에서 받아오는 정보
		logger.info("---------- loginPost ----------");
		
		Member dbMember = service.selectMemberByIdPw(member.getMemId(), member.getMemPw()); //DB에서 받아오는 정보
		
		if(dbMember == null) {
			logger.info("login POST ...... login fail, not member");
			return;
		}
		
		Login login = new Login(dbMember.getMemId(), dbMember.getMemPw(), dbMember.getMemName());
		model.addAttribute("login", login);
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("------------- logout -------------");
		session.invalidate();
		
		return "redirect:/";
	}
}
