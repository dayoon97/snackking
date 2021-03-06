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
import com.kh.snackking.adjustment.model.vo.Adjustment;

/**
 * Servlet implementation class AdjustmentCompleteServlet
 */
@WebServlet("/adjustmentComplete")
public class AdjustmentCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdjustmentCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String company = request.getParameter("com");
		
		System.out.println(company);
		
		int result = new AdjustmentService().adjustmentComplete(company);
		
		
		System.out.println(result);
		String page = "";
		if(result > 0) {
			ArrayList<HashMap<String, Object>> list = new AdjustmentService().adjustmentSelect();
			
			page = "views/adjustment/adjustment.jsp";
			request.setAttribute("list", list);
			
		} else {
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
