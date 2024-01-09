package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/BMI")
public class BMIServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/view/BMI.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String height = req.getParameter("height");
		String weight = req.getParameter("weight");

		if (height.trim().isEmpty() || height==null ||
				weight.trim().isEmpty() || weight==null) {
			resp.getWriter().println(
					"<span><a href=\"./Index\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入完整的資訊</div>");
		}
		else if ( Double.parseDouble(height) <0 || Double.parseDouble(height)>300 || 
					Double.parseDouble(weight) <0 || Double.parseDouble(weight)>600) {
			resp.getWriter().println(
					"<span><a href=\"./Index\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:350px;height:80vh;\">請輸入合理的資訊</div>");
		}
		else {
			resp.sendRedirect("./Index");
		}
	}
}
