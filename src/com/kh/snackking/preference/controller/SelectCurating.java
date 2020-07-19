package com.kh.snackking.preference.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.preference.model.service.PreferenceService;
import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;

/**
 * Servlet implementation class SelectCurating
 */
@WebServlet("/selectCurating.pre")
public class SelectCurating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCurating() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pno = request.getParameter("pno");
		
		int num = Integer.parseInt(pno);
		System.out.println("num : " + num);
		Preference p = new PreferenceService().selectCurating(num);
		
		ArrayList<Product> selectProduct = new ProductService().CuratorSelectProduct(p);
		
		System.out.println(" selectProduct :" + selectProduct);
		
		System.out.println("p : " + p);
		String page = "";
		if(p != null) {
			page = "views/curator/curatingForm.jsp";
			request.setAttribute("insertPre", p);
			request.setAttribute("Product", selectProduct);
		}else {
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
