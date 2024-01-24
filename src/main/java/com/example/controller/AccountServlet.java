package com.example.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.entity.User;
import com.example.model.BSRDAO;
import com.example.model.BSRDaoMySQL;

@WebServlet(value = "/Account")
public class AccountServlet extends HttpServlet {
	
	private BSRDAO BSRDao = new BSRDaoMySQL();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
		Optional<User> userOptional = BSRDao.findUserByUserId(userId);
		if (userOptional.isPresent()) {
	        User user = userOptional.get();
	        req.setAttribute("user", user);
	    }   
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/account.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String name = req.getParameter("name");
	    String gender = req.getParameter("gender");
	    String birthday = req.getParameter("birthday");
	    
		// 表單後端驗證
		if (name == null || name.trim().isEmpty() || 
				gender == null || gender.trim().isEmpty() ||
				birthday == null || birthday.trim().isEmpty()) {
			req.setAttribute("errorMessage", "請輸入完整資訊");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/account.jsp");
			rd.forward(req, resp);
//			resp.getWriter().println(
//					"<span><a href=\"./Account\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
//			resp.getWriter().print(
//					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整資訊</div>");
		}
		//更新使用者資訊
		else {
			
			//計算年齡
			LocalDate birthDay = LocalDate.parse(birthday);
			LocalDate currentDate = LocalDate.now();
			Integer age = Period.between(birthDay, currentDate).getYears();
	        String userId = (String) req.getSession().getAttribute("userId");

			User user = new User();
			user.setName(name);
			user.setGender(gender);
			user.setBirth(birthday); 
			user.setAge(age);
		  
	        // 更新使用者資訊到資料庫
	        Boolean updateIsSuccess = BSRDao.updateUserByUserId(userId, user.getEmail(), user.getName(),
	                user.getGender(), user.getBirth(), user.getAge());

	        if (updateIsSuccess) {
	            resp.sendRedirect("./Account");
	        } else {
	            resp.getWriter().print("<div style=\"color:red;\">更新使用者資訊失敗</div>");
	        }
		}

	}	
}
