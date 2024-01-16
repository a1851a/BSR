package com.example.controller.record;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//尿液沉渣
@WebServlet(value = "/Sediment")
public class SedimentServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/sediment.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//尿紅血球
		String RBC = req.getParameter("RBC");
		//尿白血球
		String WBC = req.getParameter("WBC");
		//上皮細胞
		String epithelium = req.getParameter("epithelium");
		//結晶體
		String crystal = req.getParameter("crystal");
		//尿圓柱體
		String cast = req.getParameter("cast");
		//細菌
		String bacteria = req.getParameter("bacteria");
		//其他
		String other = req.getParameter("other");
		
		//判斷是否為空值
		if (crystal==null || crystal.trim().isEmpty() ||
				cast==null || cast.trim().isEmpty() ||
				bacteria==null || bacteria.trim().isEmpty() ||
				other==null || other.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
		}else {
			resp.sendRedirect("./Index");
		}
	}
}
