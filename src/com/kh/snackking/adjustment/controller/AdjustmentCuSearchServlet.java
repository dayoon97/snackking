package com.kh.snackking.adjustment.controller;

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

/**
 * Servlet implementation class AdjustmentCuSearchServlet
 */
@WebServlet("/adjustmentCuSearch")
public class AdjustmentCuSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdjustmentCuSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String company = request.getParameter("company");
		String month = request.getParameter("money");
		String complete = request.getParameter("yn");
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(company);
		System.out.println(month);
		System.out.println(complete);
		System.out.println(num);
		
		if(complete.equals("결제")) {
			complete = "Y";
		} else if(complete.equals("미결제")) {
			complete = "N";
		} else {
			complete = "";
		}
		
		HashMap<String, String> hmap = new HashMap<String, String>();		
		
		hmap.put("company", company);
		hmap.put("month", month);
		hmap.put("complete", complete);
		
		ArrayList<HashMap<String, Object>> searchMember = null;
		
		searchMember = new AdjustmentService().adjustmentCuSearch(hmap, num);

		System.out.println(searchMember);
		
		if(searchMember != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(searchMember, response.getWriter());
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
