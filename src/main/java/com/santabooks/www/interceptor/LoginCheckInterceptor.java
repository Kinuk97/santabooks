package com.santabooks.www.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();

		try {
			if ((boolean) session.getAttribute("login")) {
				return true;
			}
		} catch (NullPointerException e) {
			logger.info("로그인하지 않은 유저");
		} catch (ClassCastException e) {
			logger.info("잘못된 세션값");
		}

		response.sendRedirect("/member/login");
		return false;
	}

}
