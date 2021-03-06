package com.kh.snackking.contract.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SelectOneContractServlet
 */
@WebServlet("/selctOneContract.co")
public class SelectOneContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneContractServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		System.out.println("확인쓰");
		//num 회원번호를 가지고 오기 위한 서블릿
		int num = Integer.parseInt(request.getParameter("num"));
//		System.out.println(num);
		
		request.setAttribute("num", num);
		//회원번호 가지고 여기로 뷰로 보내준다
		String page = "views/chiefManager/cmContractInsert.jsp";
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
