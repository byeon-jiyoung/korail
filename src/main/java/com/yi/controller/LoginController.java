package com.yi.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		Login login = new Login(dbMember.getMemId(), dbMember.getMemPw(), dbMember.getMemName(), dbMember.getMemMileage(), dbMember.getMemPhone());
		model.addAttribute("login", login);
		model.addAttribute("memId", dbMember.getMemId());
		
		System.out.println(dbMember.getMemId());
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("------------- logout -------------");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public void mypageGet(HttpSession session, Model model) throws Exception {
		logger.info("---------- mypageGet ----------");
		
		Login login = (Login)session.getAttribute("Auth");
		logger.info("memId : " + login.getMemId());
		
		Member member = service.selectMemberById(login.getMemId());
		model.addAttribute("member", member);
	}
	
	@RequestMapping(value="mypagedetail", method=RequestMethod.GET)
	public @ResponseBody Member mypagedetailGet(String memId, Model model) throws Exception {
		logger.info("---------- mypagedetailGet ----------");
		logger.info("memId : " + memId);
		
		Member member = service.selectMemberById(memId);
		
		return member;
	}
	
	@RequestMapping(value="udpateMember", method=RequestMethod.POST)
	public String updateMemberPost(Member member, RedirectAttributes rattr) throws Exception {
		logger.info("---------- updateMemberPost ----------");
		logger.info(member.toString());
		
		service.updateMember(member);
	
		rattr.addAttribute("memId", member.getMemId());
		return "redirect:/login/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value="confirmPw", method=RequestMethod.POST)
	public String confirmPwPost(@RequestBody HashMap<String, Object> map) throws Exception { //String id, String pw
		logger.info("---------- confirmPwPost ----------");
		
		String id = (String)map.get("id");
		String pw = (String)map.get("pw");
		logger.info("id => " + id + " & pw => " + pw);
		
		String password = service.selectPwById(id);
		logger.info("password => " + password);
		
		if(password.equals(pw)) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="changePw", method=RequestMethod.POST)
	public String changePwPost(Member member, String newmemPw, RedirectAttributes rattr) throws Exception {
		logger.info("---------- changePwPost ----------");
		logger.info(member.toString());
		logger.info("newmemPw : " + newmemPw);
		
		service.updatePw(member.getMemId(), newmemPw);
		
		rattr.addAttribute("memId", member.getMemId());
		return "redirect:/login/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value="confirmTpw", method=RequestMethod.POST)
	public String confirmTpwPost(@RequestBody HashMap<String, Object> map) throws Exception { //String id, String pw
		logger.info("---------- confirmTpwPost ----------");
		
		String id = (String)map.get("id");
		String tpw = (String)map.get("tpw");
		logger.info("id => " + id + " & tpw => " + tpw);
		
		String password = service.selectTpwById(id);
		logger.info("password => " + password);
		
		if(password.equals(tpw)) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="changeTpw", method=RequestMethod.POST)
	public String changeTpwPost(Member member, String newmemTpw, RedirectAttributes rattr) throws Exception {
		logger.info("---------- changeTpwPost ----------");
		logger.info(member.toString());
		logger.info("newmemTpw : " + newmemTpw);
		
		service.updateTpw(member.getMemId(), newmemTpw);
		
		rattr.addAttribute("memId", member.getMemId());
		return "redirect:/login/mypage";
	}
}
