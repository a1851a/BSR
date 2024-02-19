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


//血脂肪
@WebServlet(value = "/Hyperlipidemia")
public class HyperlipidemiaServlet extends HttpServlet{

	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/hyperlipidemia.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
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
		}
		/*
		 * 判斷是否位於合理範圍
		 */
		Integer tg = Integer.parseInt(TG);
		Integer tc = Integer.parseInt(TC);
		Integer hdl = Integer.parseInt(HDL);
		Integer ldl = Integer.parseInt(LDL);
		//血管硬化機率(膽固醇/高密度膽固醇)angiosclerosis
	 	Double angiosclerosis =  Math.round(((double)tc/(double)hdl)* 100.0)/ 100.0;
		//中風率(低密度膽固醇/高密度膽固醇)stroke
	 	Double stroke = Math.round(((double)ldl/(double)hdl)* 100.0)/ 100.0;
		LocalDate recordDay = LocalDate.now();
		// 定義日期格式
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// 使用格式進行格式化
        String formattedDateString = recordDay.format(formatter);
       
		if ( tg <0 || tg >1000 ||
				tc <0 || tc >800 ||
				hdl <0 || hdl >1000 ||
				ldl <0 || ldl >1000) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>");
			isReasable = false;
		}
		
		/*
		 * 先判斷可不填寫的欄位，是否有值存在
		 * 若有值存在，則進行型態轉換，再進行值判斷是否位於合理範圍
		 */
		if (vldl != null && !vldl.trim().isEmpty()) {
			Integer VLDL = Integer.parseInt(vldl);
			if (VLDL < 0 || VLDL > 1000) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
			BSRDao.addHyperlipidemia(userId,tg, tc, hdl, ldl,VLDL,angiosclerosis,stroke,formattedDateString);
			resp.sendRedirect("./Index");
			return;
		}
	
		BSRDao.addHyperlipidemia(userId,tg,tc,hdl,ldl,angiosclerosis,stroke,formattedDateString);
		resp.sendRedirect("./Index");
	}
	
	public String PrintErrorMessage() {
		return "<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\\\">⬅️</a></span>"+
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>";
	}
	
}
