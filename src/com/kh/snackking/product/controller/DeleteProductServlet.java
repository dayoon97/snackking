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

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/delProduct")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pCode = request.getParameter("pCode");
		//System.out.println("DeleteProductServlet : " + pCode);
		
		//update 성공 여부 확인
		int result = new ProductService().deleteProduct(pCode);
		if(result > 0 ) {//성공했으면 리스트 다시 조회해옴.
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(result,response.getWriter());
			
		}else {
			//가
			request.setAttribute("result", "삭제실패");
			response.sendRedirect(request.getContextPath() + "/views/product/productManagement.jsp");
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
