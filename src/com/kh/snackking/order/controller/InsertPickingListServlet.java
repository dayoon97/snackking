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
import com.kh.snackking.order.model.service.OrderService;
import com.kh.snackking.order.model.vo.PickingProduct;
import com.kh.snackking.order.model.vo.StorageProduct;

/**
 * Servlet implementation class InsertPickingListServlet
 */
@WebServlet("/insertPickingList.or")
public class InsertPickingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPickingListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sNum = request.getParameter("num");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int pListNo = Integer.parseInt(request.getParameter("pListNo"));
		System.out.println("sNum, amount : " + sNum + ", " + amount + ", " + pListNo);
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		ArrayList<PickingProduct> list = new OrderService().insertPickingStockList(sNum, amount, pListNo);
		System.out.println("list : " + list);
		hmap.put("list", list);
		
		StorageProduct storage = new OrderService().selectOneStorage(sNum);
		System.out.println("storage : " + storage.getQuantity());
		hmap.put("storage", storage);
		
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
