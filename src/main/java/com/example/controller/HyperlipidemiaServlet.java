package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.exception.AccountException;

//血脂肪
@WebServlet(value = "/Hyperlipidemia")
public class HyperlipidemiaServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/view/hyperlipidemia.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//三酸甘油酯
		String TG = req.getParameter("TG");
		//膽固醇
		String TC = req.getParameter("TC");
		//高密度膽固醇
		String HDL = req.getParameter("HDL");
		//低密度膽固醇
		String LDL = req.getParameter("LDL");
		//極低密度膽固醇
		String vldl = req.getParameter("vldl");
		
		//血管硬化機率(膽固醇/高密度膽固醇)
		
		//中風率(低密度膽固醇/高密度膽固醇)
		
		Boolean isReasable = true;
		
		if (TG == null || TG.trim().isEmpty() ||
				TC == null || TC.trim().isEmpty() ||
				HDL == null || HDL.trim().isEmpty() ||
				LDL == null || LDL.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
			isReasable = false;
		}else {
			/*
			 * 判斷是否位於合理範圍
			 */
			if ( Double.parseDouble(TG) <0 || Double.parseDouble(TG)>1000 ||
					Double.parseDouble(TC)<0 || Double.parseDouble(TC)>800 ||
					Double.parseDouble(HDL)<0 || Double.parseDouble(HDL)>1000 ||
					Double.parseDouble(LDL)<0 || Double.parseDouble(LDL)>1000) {
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
		if (vldl != null && !vldl.trim().isEmpty()) {
			Double VLDL = Double.parseDouble(vldl);
			if (VLDL < 0 || VLDL > 1000) {
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
