package com.example.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/Register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//設定utf-8編碼
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/view/register.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//https://www.youtube.com/watch?v=rU7GhAFf52Y
		
		//設定編碼
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		//表單後端驗證
        String userEmail = req.getParameter("user_email");
        String userPassword = req.getParameter("user_password");
        		
        if (userEmail == null || userEmail.trim().isEmpty() || userPassword == null || userPassword.trim().isEmpty()) {
        	resp.getWriter().println("<div style=\"color:red;min-height:100vh;display:flex;align-items:center;justify-content:center;font-size:min(calc(24px + 1vh),34px);\">請輸入完整資訊</div>");
        } 
        else {
	        RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/view/frontend/account.jsp");
	        rd.forward(req, resp);
        }
	}
}
