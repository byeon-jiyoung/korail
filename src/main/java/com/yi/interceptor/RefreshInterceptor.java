package com.yi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yi.domain.Login;
import com.yi.service.MemberService;
import com.yi.service.ReservationService;

public class RefreshInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(RefreshInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("RefreshInterceptor preHandler");
		//return super.preHandle(request, response, handler);
		return true;
	}
	
	@Autowired
	MemberService mService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		logger.info("RefreshInterceptor postHandler");
		
		HttpSession session = request.getSession();
		Login login = (Login)session.getAttribute("Auth");
		
		if(login != null) {
			login.setMemMileage(mService.selectMileage(login.getMemId()));
		}
	}

}
