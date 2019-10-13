package com.yi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MgnLoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(MgnLoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("MgnLoginInterceptor preHandler");
		//return super.preHandle(request, response, handler);
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		//super.postHandle(request, response, handler, modelAndView);
		
		logger.info("MgnLoginInterceptor postHandler");

		HttpSession session = request.getSession();
		
		Object manager = modelAndView.getModel().get("manager");
		
		System.out.println(manager);
		
		if(manager != null) {
			session.setAttribute("Mgn", manager);
			
			Object dest = session.getAttribute("dest");
			String path = (dest != null) ? (String) dest : request.getContextPath()+"/manager/korail";
			response.sendRedirect(path);
			
			System.out.println(path);
		} else if(manager == null){ //로그인에 실패했을 경우
			session.setAttribute("error", "notMatch");
			response.sendRedirect(request.getContextPath() + "/manager/login");
		} 
	}

	
	
}
