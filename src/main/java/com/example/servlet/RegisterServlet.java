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
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        		
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
        	resp.getWriter().println("<span><a href=\"./Register\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
         	resp.getWriter().print("<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整資訊</div>");
        }
        else {
        	resp.sendRedirect("./Account");
        }
	}
}
