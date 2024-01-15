package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(value = "/Login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// https://www.youtube.com/watch?v=rU7GhAFf52Y
		
		// 表單後端驗證
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"./Login\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整資訊</div>");
		} else {
			//驗證信箱、密碼成功
			if ("test@gmail.com".equals(email) && "123".equals(password)) {
				// 設定 Http Session 資料
				HttpSession session = req.getSession();
				session.setAttribute("isLogin", true);
				session.setAttribute("email", email);
				session.setMaxInactiveInterval(60 * 60 * 1); // 1小時：如果在指定的一段時間內，沒有任何的請求進來，session會失效。
				
				resp.sendRedirect("./Account");
				return;
			}
			//驗證信箱、密碼失敗	
			req.setAttribute("loginError", "帳號或密碼輸入錯誤!");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
			rd.forward(req, resp);
			
		}
		
		
	}
		
}
