package com.myblog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.myblog.entity.Account;

public class CheckLogin implements HandlerInterceptor {

	private static final String index = "index.do";
	private static final String login = "login.do";
	private static final String toregister = "toregister.do";
	private static final String register = "register.do";

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		String urlString = request.getRequestURI();
		if (urlString.endsWith(index) || urlString.endsWith(login) || urlString.endsWith(toregister)
				|| urlString.endsWith(register)) {
			return true;
		}
		HttpSession session = request.getSession();
		Account user = (Account) session.getAttribute("user");
		if (user != null) {
			return true;
		}
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
		return false;
	}

}
