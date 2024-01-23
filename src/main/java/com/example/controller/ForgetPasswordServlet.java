package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ForgetPassword")
public class ForgetPasswordServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/forgetPassword.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 表單後端驗證(格式、是否存在)
		String email = req.getParameter("email");

		if (email == null || email.trim().isEmpty()) {
//			resp.getWriter().println(
//					"<span><a href=\"./ForgetPassword\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
//			resp.getWriter().print(
//					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整資訊</div>");
			req.setAttribute("errorMessage", "請輸入信箱");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/forgetPassword.jsp");
			rd.forward(req, resp);
		}else if (!email.contains("@")) {
//			resp.getWriter().println(
//					"<span><a href=\"./ForgetPassword\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
//			resp.getWriter().print(
//					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入正確格式</div>");
			req.setAttribute("errorMessage", "請輸入正確信箱格式");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/forgetPassword.jsp");
			rd.forward(req, resp);
		}
		
		//判斷是否存在(資料庫)
		req.setAttribute("successMessage", "請至<a class='text-success text-decoration-none m-2' href='mailto:" + email + "'>" + email + "</a>重設密碼<p class='text-success text-decoration-none m-2'>若未收到信件，請確認是否註冊過</p>");
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/forgetPassword.jsp");
		rd.forward(req, resp);

	}
}
