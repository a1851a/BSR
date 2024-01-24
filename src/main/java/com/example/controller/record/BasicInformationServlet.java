package com.example.controller.record;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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

//質量指數
@WebServlet(value = "/BasicInformation")
public class BasicInformationServlet extends HttpServlet{

	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/basicInformation.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
		//身高
		String height = req.getParameter("height");
		//體重
		String weight = req.getParameter("weight");
		
		//判斷是否為空值
		if (height==null || height.trim().isEmpty() ||
				weight==null || weight.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
		}
		
		Double Height = Math.round(Double.parseDouble(height) * 100.0) / 100.0; 
		Double Weight = Math.round(Double.parseDouble(weight)* 100.0) / 100.0; 

		//判斷是否位於合理範圍
		if ( Height <0 || Height >300 || 
				Weight <0 || Weight>700) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>");
		}
		else {
			Double BMI = Math.round((Weight / ((Height / 100) * (Height / 100))) * 100.0) / 100.0;
			Double BMR = null;
			LocalDate recordDay = LocalDate.now();
			 // 定義日期格式
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        // 使用格式進行格式化
	        String formattedDateString = recordDay.format(formatter);
	        
			Optional<User> userOptional = BSRDao.findUserByUserId(userId);
			User user = userOptional.get();
			if (user.getAge()!=null) {
		        //計算BMR身體代謝率，使用Mifflin-St Jeor公式
				BMR =(double) Math.round((10*Weight+6.25*Height-5*user.getAge()+5)) ;
				//新增資訊至基礎資訊
				BSRDao.addBasicInformation(userId, Height, Weight, BMI, BMR, formattedDateString);
				resp.sendRedirect("./Index");
				return;
		    }
			//新增資訊至基礎資訊
			BSRDao.addBasicInformation(userId, Height, Weight, BMI, formattedDateString);
			resp.sendRedirect("./Index");
		}
	}
}
