package com.kh.snackking.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class ChangeEmployeeTcodeServlet
 */
@WebServlet("/changeTcode.ad")
public class ChangeEmployeeTcodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeEmployeeTcodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String tcode = request.getParameter("Tcode");
		
		System.out.println("userId : " + userNo);
		System.out.println("tcode : " + tcode);
		
		
		ArrayList<User> list = new UserService().changeEmployeeTcode(userNo, tcode);
		
		
		if(list != null) {
			request.getRequestDispatcher("/adminEmpSelect.ad");
		}
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		
//		new Gson().toJson(list, response.getWriter());
		System.out.println(list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
