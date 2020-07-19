package com.kh.snackking.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.product.model.dao.ProductDao;
import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;

/**
 * Servlet implementation class ProductInsertServlet
 */
@WebServlet("/productInsert")
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pName = request.getParameter("pName");
		int pExp = Integer.parseInt(request.getParameter("pExp"));
		String pVendor = request.getParameter("pVendor");
		String ptName = request.getParameter("ptName");
		String flavor = request.getParameter("flavor");
		String taste = request.getParameter("taste");
		String allergy = request.getParameter("allergy");
		String age = request.getParameter("age");
		int price = Integer.parseInt(request.getParameter("price"));
		Product product = new Product();
		if(pName != null) {product.setpName(pName);}
		if(pExp != 0) {product.setpExp(pExp);}
		if(pVendor != null) {product.setpVendor(pVendor);}
		if(ptName != null) {product.setPtName(ptName);}
		if(flavor != null) {product.setFlavor(flavor);}
		if(taste != null) {product.setTaste(taste);}
		if(allergy != null) {product.setAllergy(allergy);}
		if(age != null) {product.setAge(age);}
		if(price != 0) {product.setPrice(price);}
		System.out.println("servlet product : " + product);
		//0이 돌아오면 이름이 이미 있는거고, 1이 오면 insert 성공
		int result = new ProductService().insertProduct(product);
		System.out.println("servlet " + result);
		//response.setContentType("application/json");
		//response.setCharacterEncoding("UTF-8");
		
		String page = "";
		if(result == 1 ) {
			//request.setAttribute("msg", "productInsertSuccess");
			//request.getRequestDispatcher("views/product/productManagement.jsp").forward(request, response);
			
			response.sendRedirect(request.getContextPath() + "/views/product/productManagement.jsp");
		}else if(result == -1){
			request.setAttribute("product", product);
			request.setAttribute("result", "-1");
			response.sendRedirect(request.getContextPath() + "/views/product/productAdd.jsp");
		}else {
			request.setAttribute("product", product);
			request.setAttribute("result", "0");
			response.sendRedirect(request.getContextPath() + "/views/product/productAdd.jsp");
		}
	}
	
	
/*case "productInsertSuccess" : 
	successMessage = "상품 등록에 성공하였습니다!";
	movePath = "<%= request.getContextPath()%>/views/product/productManagement.jsp";
	break;*/
	
/*case "productNameOverlap" : 
	errorsMessage = "상품 등록시 이름이 중복되었습니다!!";
	movePath = "<%= request.getContextPath()%>/views/product/productAdd.jsp";
	break;
	
case "productInsertFail" : 
	errorsMessage = "상품 등록에 실패했습니다!!";
	movePath = "<%= request.getContextPath()%>/views/product/productAdd.jsp";
	break;*/


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
