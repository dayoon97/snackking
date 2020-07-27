package com.kh.snackking.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.adjustment.model.service.AdjustmentService;
import com.kh.snackking.product.model.service.ProductService;

/**
 * Servlet implementation class SearchProductStockServlet
 */
@WebServlet("/searchProductStock")
public class SearchProductStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProductStockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prCom = request.getParameter("prCom");
		String prSelect = request.getParameter("prSelect");
		String prName = request.getParameter("prName");
		String prCode = request.getParameter("prCode");
		String prnum1 = request.getParameter("prnum1");
		String prnum2 = request.getParameter("prnum2");
		
//		int num1 = 0;
//		if(prnum1 != "" && prnum1 != null) {
//			num1 = Integer.parseInt(prnum1);
//		}
//		
//		int num2 = 0;
//		if(prnum2 != "" && prnum2 != null) {
//			num2 = Integer.parseInt(prnum2);
//		}
		
		
		 if(prSelect.equals("캔디/껌/초콜릿")){
		 prSelect = "PT2";
		} else if(prSelect.equals("과자")){
			prSelect = "PT1";
		} else if(prSelect.equals("커피/차")){
			prSelect = "PT3";
		} else if(prSelect.equals("음료")){
			prSelect = "PT4";
		} else if(prSelect.equals("컵라면/컵밥")){
			prSelect = "PT5";
		} else if(prSelect.equals("케이크")){
			prSelect = "PT6";
		} else if(prSelect.equals("선택")){
			prSelect = "";
		}
		
		
		System.out.println(prCom);
		System.out.println(prSelect);
		System.out.println(prName);
		System.out.println(prCode);
		System.out.println(prnum1);
		System.out.println(prnum2);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();		
		
		hmap.put("prCom", prCom);
		hmap.put("prSelect", prSelect);
		hmap.put("prName", prName);
		hmap.put("prCode", prCode);
		hmap.put("prnum1", prnum1);
		hmap.put("prnum2", prnum2);
		
		ArrayList<HashMap<String, Object>> searchMember = null;
		
		searchMember = new ProductService().SearchProductStock(hmap);
		
		if(searchMember != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(searchMember, response.getWriter());
		} else {
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
