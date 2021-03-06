package com.kh.snackking.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.curating.model.service.CurationService;
import com.kh.snackking.curating.model.vo.CurationProduct;
import com.kh.snackking.order.model.service.OrderService;
import com.kh.snackking.order.model.vo.PickingList;

/**
 * Servlet implementation class SelectCuProductSelect
 */
@WebServlet("/selectProductSelect.or")
public class SelectCuProductSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCuProductSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cuListNo = Integer.parseInt(request.getParameter("cuListNo"));
		System.out.println("cuListno : " + cuListNo);
		HashMap<String, Object> hmap = new HashMap<>();
		
		PickingList pList = new OrderService().insertPickingList(cuListNo);
		System.out.println("pList : " + pList);
		hmap.put("pList", pList);
		
		ArrayList<CurationProduct> cuList = new CurationService().selectOrderCuratingProduct(cuListNo);
		System.out.println("list : " + cuList);
		hmap.put("cuList", cuList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(hmap, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
