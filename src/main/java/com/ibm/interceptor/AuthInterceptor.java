package com.ibm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.interceptor.CheckAuth;

public class AuthInterceptor implements HandlerInterceptor{
	 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerMethod method = (HandlerMethod)handler;
		
		CheckAuth auth = method.getMethodAnnotation(CheckAuth.class);
		
		// 세션체크
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		if(id == null){
			response.sendRedirect("/member/index");
			return false;
		}
		
		return true;
	}
 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
 
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}