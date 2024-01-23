package com.example.controller.record;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//血液
@WebServlet(value = "/Blood")
public class BloodServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/blood.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//白血球
		String WBC = req.getParameter("WBC");
		//紅血球
		String RBC = req.getParameter("RBC");
		//血色素
		String Hgb = req.getParameter("Hgb");
		//血球容積比
		String Hct = req.getParameter("Hct");
		//平均紅血球容積
		String MCV = req.getParameter("MCV");
		//平均紅血球血紅素量
		String MCH = req.getParameter("MCH");
		//平均紅血球血紅素濃度
		String MCHC = req.getParameter("MCHC");
		//血小板
		String PLT = req.getParameter("PLT");

		//判斷是否為空值
		if (WBC==null || WBC.trim().isEmpty() ||
				RBC==null || RBC.trim().isEmpty() ||
				Hgb==null || Hgb.trim().isEmpty() ||
				Hct==null || Hct.trim().isEmpty() ||
				MCV==null || MCV.trim().isEmpty() ||
				MCH==null || MCH.trim().isEmpty() ||
				MCHC==null || MCHC.trim().isEmpty() ||
				PLT==null || PLT.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
		}
		//判斷是否位於合理範圍
		else if ( Integer.parseInt(WBC) <0 || Integer.parseInt(WBC)>100000000 || 
					Double.parseDouble(RBC) <0 || Double.parseDouble(RBC)>10 ||
					Double.parseDouble(Hgb) <0 || Double.parseDouble(Hgb)>60 ||
					Double.parseDouble(Hct) <0 || Double.parseDouble(Hct)>80 ||
					Integer.parseInt(MCV) <0 || Integer.parseInt(MCV)>600 ||
					Integer.parseInt(MCH) <0 || Integer.parseInt(MCH)>600 ||
					Integer.parseInt(MCHC) <0 || Integer.parseInt(MCHC)>350 ||
					Integer.parseInt(PLT) <0 || Integer.parseInt(PLT)>1000) {
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
