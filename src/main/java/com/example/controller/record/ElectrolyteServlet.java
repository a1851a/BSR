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


//電解質
@WebServlet(value = "/Electrolyte")
public class ElectrolyteServlet extends HttpServlet{

	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/electrolyte.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
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
		}
		Double ca = Double.parseDouble(Ca);
		Double p = Double.parseDouble(P);
		LocalDate recordDay = LocalDate.now();
		// 定義日期格式
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// 使用格式進行格式化
		String formattedDateString = recordDay.format(formatter);
       
		//判斷是否位於合理範圍
		if ( ca <0 || ca >50 || p <0 || p >46300) {
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
		//少3個值
		if ((na == null || na.trim().isEmpty()) ||
		        (k == null || k.trim().isEmpty()) ||
		        (cl == null || cl.trim().isEmpty())) {
			BSRDao.addElectrolyteWithOutNaAndKAndCl(userId, ca, p, formattedDateString);
			resp.sendRedirect("./Index");
			return;
		}
		
		//少一個值
//		if ((na == null && na.trim().isEmpty()) ||
//				k != null && !k.trim().isEmpty() ||
//				(cl != null && !cl.trim().isEmpty())) {
//			Integer K = Integer.parseInt(k);
//			Integer Cl = Integer.parseInt(cl);
//			if (Cl < 0 || Cl > 160 || K < 0 || K > 150) {
//				resp.getWriter().print(PrintErrorMessage()) ;
//				isReasable = false;
//			}
//			BSRDao.addElectrolyteWithOutNa(userId, K, Cl, ca, p, formattedDateString);
//			resp.sendRedirect("./Index");
//			return;
//		}
		
		//完整輸入
		Integer NA = Integer.parseInt(na);
		Integer K = Integer.parseInt(k);
		Integer Cl = Integer.parseInt(cl);
		if (NA < 0 || NA > 160 || Cl < 0 || Cl > 160 || K < 0 || K > 150) {
			resp.getWriter().print(PrintErrorMessage()) ;
			isReasable = false;
		}
		BSRDao.addElectrolyte(userId, NA, K, Cl, ca, p, formattedDateString);
		resp.sendRedirect("./Index");
		return;
	}
	
	public String PrintErrorMessage() {
		return "<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\\\">⬅️</a></span>"+
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>";
	}
	
}
