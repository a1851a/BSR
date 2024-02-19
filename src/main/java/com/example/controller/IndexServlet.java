package com.example.controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.example.entity.BasicInformation;
import com.example.entity.HealthInformation;
import com.example.model.BSRDAO;
import com.example.model.BSRDaoMySQL;

import opennlp.tools.tokenize.SimpleTokenizer;

@WebServlet(value = "/Index")
public class IndexServlet extends HttpServlet {

	private BSRDAO BSRDao = new BSRDaoMySQL();
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = (String) req.getSession().getAttribute("userId");
		//抓取網站資訊
		 try {	
			String category ="";
            String url = "https://heho.com.tw/archives/category/health-care/page/5";
            Document doc = Jsoup.connect(url).get();
            Elements titles = doc.select("h5.post-title.is-large a");
            
        	SimpleTokenizer tokenizer = SimpleTokenizer.INSTANCE;

            //標題、網址
            Elements webs = doc.select("h5.post-title.is-large a");
            for (Element web : webs) {
            	String title = web.text();
            	String link = web.attr("href");
                String[] tokens = tokenizer.tokenize(title);

            	 if (containsKeyword(tokens, "瘦", "胖", "重", "體重","減肥")) {
            	        category = "基礎資訊";
            	    } else if (containsKeyword(tokens, "血壓", "收縮壓", "舒張壓", "脈搏壓")) {
            	        category = "血壓";
            	    } else if (containsKeyword(tokens, "血糖", "糖尿病", "尿糖")) {
            	        category = "血糖";
            	    } else if (containsKeyword(tokens, "三酸甘油酯", "膽固醇")) {
            	        category = "血脂肪";
            	    } else if (containsKeyword(tokens, "尿素氮", "肌酸酐", "尿酸", "微量白蛋白")) {
            	        category = "腎臟";
            	    } else if (containsKeyword(tokens, "膽紅素", "總蛋白", "白蛋白", "球蛋白","麩胺酸苯醋酸轉氨基酶","麩胺酸丙酮酸轉氨酶","")) {
            	        category = "肝臟";
            	    } else if (containsKeyword(tokens, "鈉離子", "鉀離子", "氯離子", "血中鈣")) {
            	        category = "電解質";
            	    }else if (containsKeyword(tokens, "白血球", "紅血球", "血色素", "血球容積比","血小板")) {
            	        category = "血液";
            	    }else if (containsKeyword(tokens, "酸鹼反應", "尿糖", "尿蛋白","潛血反應","比重","亞硝酸鹽")) {
            	        category = "尿液";
            	    }else if (containsKeyword(tokens, "尿紅血球", "上皮細胞", "結晶體", "尿圓柱體")) {
            	        category = "尿液沉渣";
            	    }

                if (!BSRDao.findHealthInformationByWebTitle(title)) {					
                	BSRDao.addHealthInformation(category, web.text(),web.attr("href"));
				}
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		//判斷使用者是否有甚麼類別的高風險問題
		if (BSRDao.checkIsOutcome(userId) == true) {
			List <HealthInformation> healthInformations = BSRDao.findUserStatusToPushRelevantHealthInformations(userId);
			req.setAttribute("healthInformations", healthInformations);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/index.jsp");
			rd.forward(req, resp);
			return;
		}
		List <HealthInformation> healthInformations = BSRDao.readAllHealthInformations();
		req.setAttribute("healthInformations", healthInformations);
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view/index.jsp");
		rd.forward(req, resp);
	}
	
	private boolean containsKeyword(String[] tokens, String... keywords) {
        for (String token : tokens) {
            for (String keyword : keywords) {
                if (token.contains(keyword)) {
                    return true;
                }
            }
        }
        return false;
    }
}