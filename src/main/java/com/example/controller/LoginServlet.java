package com.example.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.entity.User;
import com.example.model.BSRDAO;
import com.example.model.BSRDaoMySQL;
import com.mysql.cj.Session;

@WebServlet(value = "/Login")
public class LoginServlet extends HttpServlet {

	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
		rd.forward(req, resp);
	} 
    
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
/*尚未找到解決方案，先以javascript為主		
		// 表單後端驗證(格式、是否存在)
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		if (email == null || email.trim().isEmpty()) {
//				resp.getWriter().println(
//						"<span><a href=\"./Login\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
//				resp.getWriter().print(
//						"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整資訊</div>");
			req.setAttribute("errorMessage", "請輸入信箱");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
			rd.forward(req, resp);
		} else if (password == null || password.trim().isEmpty()) {
//				resp.getWriter().println(
//						"<span><a href=\"./Login\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
//				resp.getWriter().print(
//						"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入正確格式</div>");
			req.setAttribute("errorMessage", "請輸入密碼");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
			rd.forward(req, resp);
		} else if (!email.contains("@")) {
//				resp.getWriter().println(
//						"<span><a href=\"./Login\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
//				resp.getWriter().print(
//						"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入正確格式</div>");
			req.setAttribute("errorMessage", "請輸入正確信箱格式");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
			rd.forward(req, resp);
		} else if (email.length()<6) {
//				resp.getWriter().println(
//						"<span><a href=\"./Login\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
//				resp.getWriter().print(
//						"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入6位數字以上</div>");
			req.setAttribute("errorMessage", "請輸入6位數以上的密碼");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
			rd.forward(req, resp);
		}
		//判斷是否存在此使用者(資料庫)
//		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/index.jsp");
//		rd.forward(req, resp);

*/
		
		String userId = req.getParameter("userId");
		
		// 設定 Http Session 資料
		HttpSession session = req.getSession();
		session.setAttribute("userId", userId);
		session.setAttribute("isLogin", true);

		// 1小時：如果在指定的一段時間內，沒有任何的請求進來，session會失效
		session.setMaxInactiveInterval(60 * 60 * 1); 
		
        //System.out.println(userId);
		
        User user = new User();
		user.setUserId(userId);

		//先判斷資料庫是否含有這筆資料
		if(BSRDao.checkUserExistsByUserId(userId) == false) {
			//若無，則加入到資料庫中
			BSRDao.addUserByUserId(userId);
		}
		resp.sendRedirect("./Index");
	}
}
