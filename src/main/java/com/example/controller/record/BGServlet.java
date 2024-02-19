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


//血糖
@WebServlet(value = "/BG")
public class BGServlet extends HttpServlet{
	
	private BSRDAO BSRDao = new BSRDaoMySQL();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/record/BG.jsp");
		rd.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
		//空腹血糖
		String AC = req.getParameter("AC");
		//飯後血糖
		String PC = req.getParameter("PC");
		//糖化血色素
		String HbA1c = req.getParameter("HbA1c");
		//胰澱粉酶
		String Amylase = req.getParameter("Amylase");
		
		Boolean isReasable = true;
		
		//判斷是否為空值
		if (AC==null || AC.trim().isEmpty()) {
			resp.getWriter().println(
					"<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\">⬅️</a></span>");
			resp.getWriter().print(
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入完整的資訊</div>");
			isReasable = false;
		}
		Integer ac = Integer.parseInt(AC);
		//判斷是否位於合理範圍
		if ( ac <0 || ac >200) {
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
		if (PC != null && !PC.trim().isEmpty()) {
			Integer pc = Integer.parseInt(PC);
			if (pc < 0 || pc > 200) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
		
		if(!HbA1c.trim().isEmpty() && HbA1c != null) {
			Integer hba1c = Integer.parseInt(HbA1c);
			if (hba1c < 0 || hba1c > 200) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
		
		if (!Amylase.trim().isEmpty() && Amylase != null ) {
			Integer amylase = Integer.parseInt(Amylase);
			if (amylase<0 || amylase>20) {
				resp.getWriter().print(PrintErrorMessage()) ;
				isReasable = false;
			}
		}
	
		if (isReasable == true) {
			LocalDate recordDay = LocalDate.now();
			 // 定義日期格式
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        // 使用格式進行格式化
	        String formattedDateString = recordDay.format(formatter);
	        
			resp.sendRedirect("./Index");
		}
	}
	
	public String PrintErrorMessage() {
		return "<span><a href=\"#\" onclick=\"window.history.back();\" style=\"text-decoration:none;font-size:calc(5rem * 1080 / 1920);height:20vh;\\\">⬅️</a></span>"+
					"<div style=\"color:red;display:flex;align-items:center;justify-content:center;font-size:calc(5rem * 1080 / 1920);flex-wrap:nowrap;min-width:400px;height:80vh;\">請輸入合理的資訊</div>";
	}
	
}
