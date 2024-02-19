package com.example.controller.record;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.BSRDAO;
import com.example.model.BSRDaoMySQL;


//腎臟功能
@WebServlet(value = "/RenalFunction")
public class RenalFunctionServlet extends HttpServlet{

	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/renalFunction.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
		//尿素氮
		String BUN = req.getParameter("BUN");
		//肌酸酐
		String Cr = req.getParameter("Cr");
		//尿酸
		String UA = req.getParameter("UA");
		//微量白蛋白
		String mAlb = req.getParameter("mAlb");
				
		//判斷是否為空值
		if (BUN == null || BUN.trim().isEmpty() ||
				Cr == null || Cr.trim().isEmpty() ||
				UA == null || UA.trim().isEmpty() ||
				mAlb == null || mAlb.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
		}
		
		Double bun = Math.round(Double.parseDouble(BUN)* 100.0) / 100.0;
		Double cr = Math.round(Double.parseDouble(Cr)* 100.0) / 100.0;
		Double ua = Math.round(Double.parseDouble(UA)* 100.0 )/ 100.0;
		Double MAlb = Math.round(Double.parseDouble(mAlb)* 100.0) / 100.0;
		LocalDate recordDay = LocalDate.now();
		// 定義日期格式
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// 使用格式進行格式化
		String formattedDateString = recordDay.format(formatter);
       
		//判斷是否位於合理範圍
		if (  bun <0 || bun >100 || cr <0 || cr >10000 ||
				ua <0 || ua >250 || MAlb <0 || MAlb >250) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>");
	
		}
		BSRDao.addRenalFunction(userId, bun, cr, ua, MAlb, formattedDateString);
		resp.sendRedirect("./Index");
	}
}
