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
 * Servlet implementation class InsertAdjustmentServlet
 */
@WebServlet("/insertAdjustment")
public class InsertAdjustmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdjustmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String company = request.getParameter("company"); 
		
		System.out.println(company);
			
		
		ArrayList<HashMap<String, Object>> list  = new AdjustmentService().insertAdjustment(company);
		
		String page = "";
		if(list != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(list, response.getWriter());
		} else {
			System.out.println("에러");
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
