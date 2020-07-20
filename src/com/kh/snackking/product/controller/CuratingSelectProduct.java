package com.kh.snackking.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("kinds : " + kinds);
		System.out.println("flavor : " + flavor);
		System.out.println("smell : " + smell);
		System.out.println("allergy : " + allergy);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
