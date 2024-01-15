package com.example.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//肝臟功能
@WebServlet(value = "/LiverFunction")
public class LiverFunctionServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/liver_function.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//總膽紅素
		String dbit = req.getParameter("d-bit");
		//直接膽紅素
		String dbil = req.getParameter("d-bil");
		//總蛋白
		String TP = req.getParameter("TP");
		//白蛋白
		String Alb = req.getParameter("Alb");
		//球蛋白
		String Glo = req.getParameter("Glo");
		//麩胺酸苯醋酸轉氨基酶
		String sGOT = req.getParameter("sGOT");
		//麩胺酸丙酮酸轉氨酶
		String sGPT = req.getParameter("sGPT");
		//鹼性磷酸酶
		String alkp = req.getParameter("alkp");
		//酒精性肝炎(脂肪肝)
		String ald = req.getParameter("ald");

		Boolean isReasable = true;
		
		if (TP == null || TP.trim().isEmpty() ||
				Alb == null || Alb.trim().isEmpty() ||
				Glo == null || Glo.trim().isEmpty() ||
				sGOT == null || sGOT.trim().isEmpty() ||
				sGPT == null || sGPT.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
			isReasable = false;
		}else {
			/*
			 * 判斷是否位於合理範圍
			 */
			if ( Double.parseDouble(TP) <0 || Double.parseDouble(TP)>80 ||
					Double.parseDouble(Alb)<0 || Double.parseDouble(Alb)>70 ||
					Double.parseDouble(Glo)<0 || Double.parseDouble(Glo)>50 ||
					Double.parseDouble(sGOT)<0 || Double.parseDouble(sGOT)>700 ||
					Double.parseDouble(sGPT)<0 || Double.parseDouble(sGPT)>1000) {
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
		if (dbit != null && !dbit.trim().isEmpty()) {
			Double DBIT = Double.parseDouble(dbit);
			if (DBIT < 0 || DBIT > 50) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
	
		if (dbil != null && !dbil.trim().isEmpty()) {
			Double DBIL = Double.parseDouble(dbil);
			if (DBIL < 0 || DBIL > 10) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
		
		if (alkp != null && !alkp.trim().isEmpty()) {
			Double ALKP = Double.parseDouble(alkp);
			if (ALKP < 0 || ALKP > 1000000) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
		
		if (ald != null && !ald.trim().isEmpty()) {
			Double ALD = Double.parseDouble(ald);
			if (ALD < 0 || ALD > 1000000) {
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
