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
 * Servlet implementation class CuratingDeletePro
 */
@WebServlet("/curatingDelete.pro")
public class CuratingDeletePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuratingDeletePro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cuno = Integer.parseInt(request.getParameter("cuno"));
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("cuno : " + cuno);
		CuratingProduct cu = new CuratingProduct();
		cu.setPreNo(no);
		cu.setCuratingNo(cuno);
		
		ArrayList<CuratingProduct> pro =  new ProductService().curatingdeletePro(cu);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(pro, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
