package com.example.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.entity.User;
import com.example.model.BSRDAO;
import com.example.model.BSRDaoMySQL;

@WebServlet(value = "/Register")
public class RegisterServlet extends HttpServlet {
	
	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 表單後端驗證(格式、是否存在)
		String email = req.getParameter("email");
		String password = req.getParameter("password");
	    String userId = req.getParameter("userId");
		
//		if (email== null || email.trim().isEmpty()) {
////			resp.getWriter().println(
////					"<span><a href=\"./Register\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
////			resp.getWriter().print(
////					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整資訊</div>");
//			req.setAttribute("errorMessage", "請輸入信箱");
//			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
//			rd.forward(req, resp);
//		} else if (password == null || password.trim().isEmpty()) {
////			resp.getWriter().println(
////					"<span><a href=\"./Register\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
////			resp.getWriter().print(
////					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整資訊</div>");
//			req.setAttribute("errorMessage", "請輸入密碼");
//			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
//			rd.forward(req, resp);
//		}else if (!email.contains("@")) {
////			resp.getWriter().println(
////					"<span><a href=\"./Register\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
////			resp.getWriter().print(
////					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入正確格式</div>");
//			req.setAttribute("errorMessage", "請輸入正確信箱格式");
//			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
//			rd.forward(req, resp);
//		}else if (password.length()<6) {
////			resp.getWriter().println(
////					"<span><a href=\"./Register\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
////			resp.getWriter().print(
////					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入6位數字以上</div>");
//			req.setAttribute("errorMessage", "請輸入6位數以上的密碼");
//			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
//			rd.forward(req, resp);
//		}
	    
		User user = new User();
		user.setUserId(userId);
		user.setEmail(email);
		// 加入到資料庫中
		if (!BSRDao.checkUserExistsByEmail(email)) {			
			BSRDao.addUserByUserIdAndEmail(userId,email);
		}else {
			System.err.println("新增失敗");
		}
		
		//System.out.println(userId);
		//System.out.println(email);
		//req.setAttribute("successMessage", "請至<a class='text-success text-decoration-none m-2' href='mailto:" + email + "'>" + email + "</a>重設密碼<p class='text-success text-decoration-none m-2'>若未收到信件，請確認是否註冊過</p>");
		
		resp.sendRedirect("./Login");
		
		//RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
		//rd.forward(req, resp);
	}
}
