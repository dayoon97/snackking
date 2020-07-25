package com.kh.snackking.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;

/**
 * Servlet implementation class SelectProductStockServlet
 */
@WebServlet("/totalProduct")
public class SelectProductStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductStockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> list = new ProductService().selectTotalProduct();
		
		String page = "";
		if(list != null) {
			page = "views/product/productStockManagement.jsp";
			request.setAttribute("list", list);
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
