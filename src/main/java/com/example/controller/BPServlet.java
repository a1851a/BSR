package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//血壓
@WebServlet(value = "/BP")
public class BPServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/view/BP.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//收縮壓
		String SBP = req.getParameter("SBP");
		//舒張壓
		String DBP = req.getParameter("DBP");
		//脈搏
		String pulse=req.getParameter("pulse");

		if (SBP.trim().isEmpty() || SBP==null ||
				DBP.trim().isEmpty() || DBP==null ||
				pulse.trim().isEmpty() || pulse==null) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整的資訊</div>");
		}
		else if ( Double.parseDouble(SBP) <0 || Double.parseDouble(SBP)>300 || 
					Double.parseDouble(DBP) <0 || Double.parseDouble(DBP)>600 ||
					Double.parseDouble(pulse)<0 || Double.parseDouble(pulse)>200) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入合理資訊</div>");
		}
		else {
			resp.sendRedirect("./Index");
		}
	}
}
