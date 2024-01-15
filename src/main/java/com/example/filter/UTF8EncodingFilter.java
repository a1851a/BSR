package com.example.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// UTF-8 過濾器
@WebFilter(value = {"/*"})
public class UTF8EncodingFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		String url=req.getRequestURL().toString();
		
		// 放行條件
		if(url.indexOf("/images")>=0 
			|| url.endsWith(".css")
			|| url.endsWith(".js")) {
			chain.doFilter(req, resp);
			return;
		}
				
		// 設定 utf-8
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		// 放行
		chain.doFilter(req, resp);
	
	}

}