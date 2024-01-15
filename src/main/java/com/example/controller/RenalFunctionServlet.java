package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//腎臟功能
@WebServlet(value = "/RenalFunction")
public class RenalFunctionServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/renal_function.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		}else {
			//判斷是否位於合理範圍
			if ( Double.parseDouble(BUN) <0 || Double.parseDouble(BUN)>100 ||
					Double.parseDouble(Cr)<0 || Double.parseDouble(Cr)>10000 ||
					Double.parseDouble(UA)<0 || Double.parseDouble(UA)>250 ||
					Double.parseDouble(mAlb)<0 || Double.parseDouble(mAlb)>250) {
				resp.getWriter().println(
						"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
				resp.getWriter().print(
						"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>");
		}else {
			resp.sendRedirect("./Index");
		}
			
		}
	}
}
