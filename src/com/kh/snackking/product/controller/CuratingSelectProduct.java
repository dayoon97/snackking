package com.kh.snackking.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;

/**
 * Servlet implementation class CuratingSelectProduct
 */
@WebServlet("/curatingSelectProduct.pro")
public class CuratingSelectProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuratingSelectProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kinds = request.getParameter("kinds");
		String flavor = request.getParameter("flavor");
		String smell = request.getParameter("smell");
		String allergy = request.getParameter("allergy");
		int userNo = Integer.parseInt(request.getParameter("userNo"));/*request.getParameter("userNo");*/
		int preNo = Integer.parseInt(request.getParameter("preNo"));
		System.out.println("kinds : " + kinds);
		System.out.println("flavor : " + flavor);
		System.out.println("smell : " + smell);
		System.out.println("allergy : " + allergy);
		System.out.println("userNo : " + userNo);
		System.out.println("preNo : " + preNo);
		
		Preference pre = new Preference();
		
		pre.setPreProductTypes(kinds);
		pre.setPreTaste(flavor);
		pre.setPreFlavor(smell);
		pre.setPreAlName(allergy);
		pre.setUserNo(userNo);
		pre.setPreNo(preNo);
		
		System.out.println("pre : " + pre);
		
		ArrayList<Product> pro = new ProductService().CuratorSelectProduct(pre);
		System.out.println("pro : " + pro);
		
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
