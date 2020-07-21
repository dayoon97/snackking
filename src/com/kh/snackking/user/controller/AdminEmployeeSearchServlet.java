package com.kh.snackking.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class AdminEmployeeSearchServlet
 */
@WebServlet("/adminEmpSearch.ad")
public class AdminEmployeeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEmployeeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String tCode = request.getParameter("tCode");
		String userNo = request.getParameter("num");
		String status = request.getParameter("status");
		
		int no = 0;
		if(userNo !="" && userNo != null) {
			no = Integer.parseInt(userNo);
		}
		
		if(status.equals("근무중")) {
			status = "Y";
		} else if(status.equals("퇴사")) {
			status = "N";
		}
		
		User user = new User();
		
		if(name != "") {user.setUserName(name);}
		if(tCode != "") {user.settCode(tCode);}
		if(no != 0) {user.setUserNo(no);}
		if(status != "") {user.setStatus(status);}
		
		ArrayList<User> searchMember = null;
		
		searchMember = new UserService().selectEmpSearch(user);
		

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(searchMember, response.getWriter());
	
		System.out.println(name);
		System.out.println(tCode);
		System.out.println(userNo);
		System.out.println(status);
		System.out.println(no);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
