package com.example.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//安全性過濾器
@WebFilter(value = {"/*"})
public class CrossOriginOpenerPolicyFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		String url = req.getRequestURL().toString();	
		
		// 設定 Cross-Origin-Opener-Policy 標頭
        res.setHeader("Cross-Origin-Opener-Policy", "same-origin-allow-popups");

        // 繼續處理請求
        chain.doFilter(req, res);
	}

	
}
