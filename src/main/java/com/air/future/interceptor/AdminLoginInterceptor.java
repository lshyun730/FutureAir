package com.air.future.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.air.future.vo.Admin;


public class AdminLoginInterceptor extends HandlerInterceptorAdapter{

	// 컨트롤러 실행 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 세션에서 로그인 정보 읽기
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("admin");
		
		// 로그인 하지 않은 경우 로그인 페이지로 이동
		if(admin == null) {
			response.sendRedirect(request.getContextPath() + "/adminLogin");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
}
