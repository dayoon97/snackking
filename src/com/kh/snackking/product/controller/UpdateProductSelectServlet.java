package com.kh.snackking.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.board.model.vo.Attachment;
import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;
import com.kh.snackking.product.model.vo.ProductAttachment;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/updateProductSelect")
public class UpdateProductSelectServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //수정할 상품의 tCode을 변수에 담는다.
      String tCode = request.getParameter("tCode");
      //System.out.println(tCode);
      //상품 코드 기준으로 update할 상품의 기존 정보를 가져온다.
      Product product = new ProductService().updateProductSelect(tCode);
      System.out.println(product);
  	//페이지 이동
		String page = "";
		if(product != null) {
			//성공하면 상품 사진 정보를 가지고 update.jsp 로 이동한다.
			ProductAttachment productAttachment = new ProductService().selectOneAttachment(tCode);

			
			
			page = "views/product/productUpdate.jsp";
			request.setAttribute("product",product);
			request.setAttribute("productAttachment", productAttachment);
			request.getRequestDispatcher(page).forward(request, response);
			//response.sendRedirect(request.getContextPath() + "/" + page);
			
		}else {
			page = "views/product/productManagement.jsp";
			request.setAttribute("msg", "상품 업데이트 실패");
			request.getRequestDispatcher(page).forward(request, response);
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