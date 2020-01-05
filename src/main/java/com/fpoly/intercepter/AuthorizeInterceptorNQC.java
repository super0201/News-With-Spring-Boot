package com.fpoly.intercepter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AuthorizeInterceptorNQC extends HandlerInterceptorAdapter{
	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(session.getAttribute("userNQC") != null) {
			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect("/nhaquangcao/danhsachquangcao");
			return false;
		}
		return true;
	}
}
