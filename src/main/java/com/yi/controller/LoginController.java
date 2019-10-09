package com.yi.controller;

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
		
		Login login = new Login(dbMember.getMemId(), dbMember.getMemPw(), dbMember.getMemName(), dbMember.getMemMileage());
		model.addAttribute("login", login);
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("------------- logout -------------");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public void mypageGet(String memId, Model model) throws Exception {
		logger.info("---------- mypageGet ----------");
		logger.info("memId : " + memId);
		
		Member member = service.selectMemberById(memId);
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
	
	@RequestMapping(value="confirmPw", method=RequestMethod.POST)
	public String confirmPwPost(String id, String pw) throws Exception {
		logger.info("---------- confirmPwPost ----------");
		logger.info("id => " + id + " & pw => " + pw);
		
		/*if(member.getMemPw().equals(newmemPw) == true) {
			rattr.addAttribute("change", "fail");
			return "redirect:/login/mypage";
		}*/
		
		return "redirect:/login/mypage";
	}
	
	@RequestMapping(value="changePw", method=RequestMethod.POST)
	public String changePwPost(Member member, String newmemPw, RedirectAttributes rattr) {
		logger.info("---------- changePwPost ----------");
		logger.info(member.toString());
		logger.info("newmemPw : " + newmemPw);
		
		if(member.getMemPw().equals(newmemPw) == true) {
			rattr.addAttribute("change", "fail");
			return "redirect:/login/mypage";
		}
		
		return "redirect:/login/mypage";
	}
}
