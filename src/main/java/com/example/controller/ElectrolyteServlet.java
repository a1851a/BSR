package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.exception.AccountException;

//電解質
@WebServlet(value = "/Electrolyte")
public class ElectrolyteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/view/electrolyte.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//鈉離子
		String na = req.getParameter("na");
		//鉀離子
		String k = req.getParameter("k");
		//氯離子
		String cl = req.getParameter("cl");
		//血中鈣
		String Ca = req.getParameter("Ca");
		//血中磷
		String P = req.getParameter("P");
		
		Boolean isReasable = true;
		
		//判斷是否為空值
		if (Ca==null || Ca.trim().isEmpty() ||
				P==null || P.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
			isReasable = false;
		}else {
			//判斷是否位於合理範圍
			if ( Double.parseDouble(Ca) <0 || Double.parseDouble(Ca)>50 ||
					Double.parseDouble(P) <0 || Double.parseDouble(P)>46300) {
				resp.getWriter().println(
						"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
				resp.getWriter().print(
						"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>");
				isReasable = false;
			}
		}
		
		/*
		 * 先判斷可不填寫的欄位，是否有值存在
		 * 若有值存在，則進行型態轉換，再進行值判斷是否位於合理範圍
		 */
		if (na != null && !na.trim().isEmpty()) {
			Double NA = Double.parseDouble(cl);
			if (NA < 0 || NA > 160) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
		
		if(k != null && !k.trim().isEmpty()) {
			Double K = Double.parseDouble(k);
			if (K < 0 || K > 150) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
		
		if (cl != null && !cl.trim().isEmpty()) {
			Double CL = Double.parseDouble(cl);
			if (CL < 0 || CL > 150) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
	
		if (isReasable == true) {
			resp.sendRedirect("./Index");
		}
	}
	
	public String PrintErrorMessage() {
		return "<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\\\">⬅️</a></span>"+
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>";
	}
	
}
