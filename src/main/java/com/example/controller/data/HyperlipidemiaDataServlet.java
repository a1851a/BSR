package com.example.controller.data;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.entity.BasicInformation;
import com.example.entity.Hyperlipidemia;
import com.example.model.BSRDAO;
import com.example.model.BSRDaoMySQL;

//血脂肪紀錄資料
@WebServlet(value = "/HyperlipidemiaData")
public class HyperlipidemiaDataServlet extends HttpServlet{

	private BSRDAO BSRDao = new BSRDaoMySQL();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得使用者Id
		String userId = (String) req.getSession().getAttribute("userId");
		req.setAttribute("userId", userId);
		List <Hyperlipidemia> HyperlipidemiaInformations = BSRDao.findHyperlipidemiaByUserId(userId);
		req.setAttribute("HyperlipidemiaInformations", HyperlipidemiaInformations);
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/view/data/hyperlipidemiaData.jsp");
		rd.forward(req, resp);
	}

	
}
