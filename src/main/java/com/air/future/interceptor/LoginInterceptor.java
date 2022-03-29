package com.air.future.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.air.future.vo.Customer;


public class LoginInterceptor extends HandlerInterceptorAdapter{

	// 컨트롤러 실행 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 세션에서 로그인 정보 읽기
		HttpSession session = request.getSession();
		Customer customer= (Customer) session.getAttribute("customer");
		
		// 로그인 하지 않은 경우 로그인 페이지로 이동
		if(customer == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
}
