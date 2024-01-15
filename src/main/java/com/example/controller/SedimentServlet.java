package com.example.controller;

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

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/sediment.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//尿紅血球
		String RBC = req.getParameter("RBC");
		//尿白血球
		String WBC = req.getParameter("WBC");
		//上皮細胞
		String Epithelium = req.getParameter("Epithelium");
		//結晶體
		String Crystal = req.getParameter("Crystal");
		//尿圓柱體
		String Cast = req.getParameter("Cast");
		//細菌
		String Bacteria = req.getParameter("Bacteria");
		//其他
		String Other = req.getParameter("Other");
		
		//判斷是否為空值
		if (Crystal==null || Crystal.trim().isEmpty() ||
				Cast==null || Cast.trim().isEmpty() ||
				Bacteria==null || Bacteria.trim().isEmpty() ||
				Other==null || Other.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
		}else {
			resp.sendRedirect("./Index");
		}
	}
}
