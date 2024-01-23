package com.example.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.spec.XPathType.Filter;

//登入過濾器
@WebFilter(value = {"/*"})
public class HaveSessionFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		String url = req.getRequestURL().toString();

		// 放行條件
		if (url.indexOf("/images") >= 0 || url.endsWith(".css") || 
				url.endsWith(".js")) {
			chain.doFilter(req, res);
			return;
		}
		
		// 檢查是否登入
		HttpSession session = req.getSession();
		//String userId = (String) req.getSession().getAttribute("userId");
		boolean isLogin = session.getAttribute("isLogin") == null 
				? false: (boolean)session.getAttribute("isLogin");
		if(isLogin) {
			if (url.endsWith("Login")) {
				res.sendRedirect("./Index");
				return;
			}
			
			
		}
 
        chain.doFilter(req, res);
	}
}
