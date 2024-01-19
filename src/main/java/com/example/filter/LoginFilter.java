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
//@WebFilter(value = {"/*"})
public class LoginFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		String url = req.getRequestURL().toString();

		// 放行條件
		if ( url.endsWith("Login") || url.endsWith("Register") ||
				url.indexOf("/images") >= 0 || url.endsWith(".css") || 
				url.endsWith(".js")) {
			chain.doFilter(req, res);
			return;
		}		
		// 設定 Cross-Origin-Opener-Policy 標頭
        res.setHeader("Cross-Origin-Opener-Policy", "same-origin-allow-popups");
        
        // 繼續處理請求
        chain.doFilter(req, res);
	}
//		// 檢查是否登入
//        boolean isLogIn = checkIfUserIsLogIn(req);
//
//        System.out.print(req.getSession().getAttribute("user"));
//        if (isLogIn) {
//            chain.doFilter(req, res);
//            return;
//        } else {
//            res.sendRedirect("./Login");
//        }
//    }
//	
//	private boolean checkIfUserIsLogIn(HttpServletRequest request) {
//        return request.getSession().getAttribute("user") != null;
//	}
}
