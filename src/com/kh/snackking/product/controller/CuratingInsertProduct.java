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
import com.kh.snackking.product.model.vo.CuratingProduct;

/**
 * Servlet implementation class CuratingInsertProduct
 */
@WebServlet("/curatingInsert.pro")
public class CuratingInsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuratingInsertProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proAdd = request.getParameter("proAdd");
		int no = Integer.parseInt(request.getParameter("no"));
		int count = Integer.parseInt(request.getParameter("count"));
		System.out.println("proAdd : " + proAdd);
		System.out.println("preNo : " + no);
		System.out.println("count : " + count);
		
		CuratingProduct cp = new CuratingProduct();
		cp.setCuNo(no);
		cp.setProNo(proAdd);
		cp.setCount(count);
		
		ArrayList<CuratingProduct> insertCuraPro = new ProductService().insertCuraPro(cp);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(insertCuraPro, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
