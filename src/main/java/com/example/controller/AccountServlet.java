package com.example.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.entity.User;

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
		req.setAttribute("birthday", "1989-01-10");
		rd.forward(req, resp);

	}
	
//	 private static final long serialVersionUID = 1L;
//
//	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
//	            throws ServletException, IOException {
//
//	        // 設定回應的內容類型
//	        response.setContentType("text/html;charset=UTF-8");
//
//	        // 獲取POST請求中的JSON資料
//	        String jsonUserData = request.getReader().readLine();
//	        
//	        // 在實際應用中，您可能需要使用JSON解析庫來解析JSON資料
//	        // 這裡僅做示範，使用簡單的字串拆解方式
//	        String displayName = jsonUserData.split("\"displayName\":\"")[1].split("\"")[0];
//	        String email = jsonUserData.split("\"email\":\"")[1].split("\"")[0];
//
//	        // 將資料傳遞至JSP
//	        request.setAttribute("name", displayName);
//	        request.setAttribute("email", email);
//
//	        // 將資料轉發至JSP
//	        request.getRequestDispatcher("/account.jsp").forward(request, response);
//	 
//	 }
	/* 
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
		}*/	
}
