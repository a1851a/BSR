package com.example.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.exception.AccountException;
import com.example.model.AccountDAO;
import com.example.model.AccountDAOInMemory;
import com.example.model.User;

@WebServlet(value = "/Account")
public class AccountServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//取得帳號使用者
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/account.jsp");
		req.setAttribute("email", "test@gmail.com");
		req.setAttribute("key", "12345");
		req.setAttribute("user_name", "test");
		req.setAttribute("gender", "man");
		req.setAttribute("birthday", "1989-1-1");
		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String account=req.getParameter("account");
		String key = req.getParameter("key");
		String user_name = req.getParameter("user_name");
		String gender = req.getParameter("gender");
		String birthday = req.getParameter("birthday");
		
		// 表單後端驗證
		if (key == null || key.trim().isEmpty() || user_name == null || user_name.trim().isEmpty() || gender == null
				|| gender.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"./Account\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:re1d;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整資訊</div>");
		} else {
			resp.sendRedirect("./Account");
		}
	}

}
