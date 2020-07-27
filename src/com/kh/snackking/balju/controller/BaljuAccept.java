package com.kh.snackking.balju.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.balju.model.service.BaljuService;
import com.kh.snackking.balju.model.vo.Balju;

/**
 * Servlet implementation class BaljuAccept
 */
@WebServlet("/baljuAccept.bj")
public class BaljuAccept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaljuAccept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bjNo = request.getParameter("num");
		
		System.out.println("bjNo : " + bjNo);
		
		ArrayList<Balju> bj = new BaljuService().BaljuAccept(bjNo);
		
		String page = "";
		if(bj != null) {
			page = "views/product/productOrderManagement.jsp";
			request.setAttribute("bj", bj);
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
