package com.kh.snackking.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.ProductStorage;

/**
 * Servlet implementation class InsertProductStorageServlet
 */
@WebServlet("/insertProductStorage")
public class InsertProductStorageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductStorageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pName = request.getParameter("pName");
		String mfd = request.getParameter("mfd");
		String section = request.getParameter("section");
		String sectionCode = request.getParameter("sectionCode");
		String sLocation = request.getParameter("sLocation");
		String q = request.getParameter("quantity");
		int quantity = 0;
		if(q != null) {
			quantity = Integer.parseInt(q);
		}
		
		ProductStorage productStorage = new ProductStorage();
		productStorage.setQuantity(quantity);
		productStorage.setMfd(mfd);
		productStorage.setpName(pName);
		productStorage.setSection(section);
		productStorage.setSectionCode(sectionCode);
		productStorage.setsLocation(sLocation);
		System.out.println("productStorage Serlvet : " +  productStorage);
		int result = new ProductService().insertProductStorage(productStorage);
		
		
		
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
