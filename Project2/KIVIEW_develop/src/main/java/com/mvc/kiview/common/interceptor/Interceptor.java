package com.mvc.kiview.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class Interceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setContentType("text/html; charset=utf-8" );
		
		if(request.getRequestURI().contains("/cafehome.do") || request.getRequestURI().contains("/cafemy.do") || request.getRequestURI().contains("/cafeopen.do") 
				|| request.getRequestURI().contains("/cafedetail.do")) {
			if(request.getSession().getAttribute("login")==null) {
				
				
				PrintWriter out = response.getWriter();
				out.print("<script> alert('로그인이 필요한 서비스입니다.'); location.href='login.do'</script>");
				//response.sendRedirect("login.do"); 
				
				return false;
			}
		}
		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}

}
