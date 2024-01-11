package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//質量指數
@WebServlet(value = "/Urine")
public class UrineServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/view/urine.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//外觀
		String appearance = req.getParameter("appearance");
		//酸鹼反應
		String PH = req.getParameter("PH");
		//尿白血球
		String leukocytes = req.getParameter("leukocytes");
		//尿糖
		String glucose = req.getParameter("glucose");
		//尿蛋白
		String protein = req.getParameter("protein");
		//尿膽紅素
		String bilirubin = req.getParameter("bilirubin");
		//尿膽素元
		String urobilirubin = req.getParameter("urobilirubin");
		//尿丙酮體
		String ketones = req.getParameter("ketones");
		//潛血反應
		String occult_blood = req.getParameter("occult_blood");
		//比重
		String spccific_gravity = req.getParameter("spccific_gravity");
		//亞硝酸鹽
		String nitrite = req.getParameter("nitrite");
		
		//判斷是否為空值
		if (appearance==null || appearance.trim().isEmpty() ||
				PH==null || PH.trim().isEmpty() ||
				leukocytes==null || leukocytes.trim().isEmpty() ||
				glucose==null || glucose.trim().isEmpty() ||
				protein==null || protein.trim().isEmpty() ||
				bilirubin==null || bilirubin.trim().isEmpty() ||
				urobilirubin==null || urobilirubin.trim().isEmpty() ||
				ketones==null || ketones.trim().isEmpty() ||
				occult_blood==null || occult_blood.trim().isEmpty() ||
				spccific_gravity==null || spccific_gravity.trim().isEmpty() ||
				nitrite==null || nitrite.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
		}
		//判斷是否位於合理範圍
		else if ( Double.parseDouble(PH) <0 || Double.parseDouble(PH)>14) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>");
		}
		else {
			resp.sendRedirect("./Index");
		}
	}
}
