package com.kh.snackking.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;
import com.kh.snackking.product.model.vo.ProductStorage;

/**
 * Servlet implementation class SelectProductStorageServlet
 */
@WebServlet("/selectProductStorage")
public class SelectProductStorageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductStorageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String storageDate = request.getParameter("storageDate");
		String mfd = request.getParameter("mfd");
		String pName = request.getParameter("pName");
		String color = request.getParameter("color");
		String storageCode = request.getParameter("storageCode");
		ProductStorage productStorage = new ProductStorage();
		productStorage.setStorageCode(storageCode);
		productStorage.setStorageDate(storageDate);
		productStorage.setColor(color);
		productStorage.setpName(pName);
		productStorage.setMfd(mfd);
		System.out.println(productStorage + "productStorage");
		//재고 등록에 관련된 VO : ProductStorage
		ArrayList<ProductStorage> productStorageList = new ProductService().selectProductStorage(productStorage);
		System.out.println("servlet  productStorageList : " + productStorageList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	
		new Gson().toJson(productStorageList,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
