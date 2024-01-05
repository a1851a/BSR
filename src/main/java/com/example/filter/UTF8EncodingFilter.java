package com.example.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// UTF-8 過濾器
@WebFilter(value = { "/servlet/*" })
public class UTF8EncodingFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		if (resp.getCharacterEncoding() != "utf-8") {
			resp.getWriter().print("stop !");
		} else {

			// 設定 utf-8
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html;charset=utf-8");

			// 放行
			chain.doFilter(req, resp);
		}

	}

}
