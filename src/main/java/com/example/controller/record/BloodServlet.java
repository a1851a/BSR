package com.example.controller.record;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.BSRDAO;
import com.example.model.BSRDaoMySQL;

//血液
@WebServlet(value = "/Blood")
public class BloodServlet extends HttpServlet{

	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/blood.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
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
		
		Integer wbc = Integer.parseInt(WBC);
		Double rbc = Math.round(Double.parseDouble(RBC)* 100.0) / 100.0;
		Double hgb = Math.round(Double.parseDouble(Hgb)* 100.0) / 100.0;
		Double hct = Math.round(Double.parseDouble(Hct)* 100.0) / 100.0;
		Double mcv = Math.round(Double.parseDouble(MCV)* 100.0) / 100.0;
		Double mch = Math.round(Double.parseDouble(MCH)* 100.0) / 100.0;
		Double mchc = Math.round(Double.parseDouble(MCHC)* 100.0) / 100.0;
		Integer plt = Integer.parseInt(PLT);
		LocalDate recordDay = LocalDate.now();
		// 定義日期格式
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// 使用格式進行格式化
		String formattedDateString = recordDay.format(formatter);
       
		//判斷是否位於合理範圍
		if ( wbc <0 || wbc >100000000 || wbc <0 || wbc >10 ||
				hgb <0 || hgb >60 || hct <0 || hct >80 ||
				mcv <0 || mcv >600 || mch <0 || mch >600 ||
				mchc <0 || mchc >350 || plt <0 || plt >1000) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>");
		}
		BSRDao.addBlood(userId, wbc, rbc, hgb, hct, mcv, mch, mchc, plt, formattedDateString);
		resp.sendRedirect("./Index");
	}
}
