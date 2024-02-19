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

//血壓
@WebServlet(value = "/BP")
public class BPServlet extends HttpServlet{

	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/BP.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
		//收縮壓
		String SBP = req.getParameter("SBP");
		//舒張壓
		String DBP = req.getParameter("DBP");
		//脈搏
		String pulse=req.getParameter("pulse");

		//判斷是否為空值
		if (SBP==null || SBP.trim().isEmpty() ||
				DBP==null || DBP.trim().isEmpty() ||
				pulse==null || pulse.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
		}
		Integer sbp = Integer.parseInt(SBP);
		Integer dbp = Integer.parseInt(DBP);
		Integer Pulse = Integer.parseInt(pulse);
		LocalDate recordDay = LocalDate.now();
		// 定義日期格式
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // 使用格式進行格式化
        String formattedDateString = recordDay.format(formatter);
		
        //判斷是否位於合理範圍
		if ( sbp <0 || sbp>300 || dbp <0 || dbp>600 ||
				Pulse <0 || Pulse>200) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理資訊</div>");
		}
		BSRDao.addBP(userId, sbp, dbp, Pulse, formattedDateString);
		
		BSRDao.addOutcomeByUserId(userId, "血壓", formattedDateString);
		if(sbp >= 130 && dbp >=80){
		}
		resp.sendRedirect("./Index");
	}
}
