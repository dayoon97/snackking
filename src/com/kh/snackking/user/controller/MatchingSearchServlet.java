package com.kh.snackking.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class MatchingSearchServlet
 */
@WebServlet("/searchMatching")
public class MatchingSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatchingSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("EmpName");
		String company = request.getParameter("company");
		String phone = request.getParameter("phone");
		
		System.out.println(name);
		System.out.println(company);
		System.out.println(phone);
		
		User user = new User();
		
		if(name != null) {user.setUserName(name);}
		if(company != null) {user.setCompany(company);}
		if(phone != null) {user.setPhone(phone);}
		
		ArrayList<User> list = new UserService().matchingSearch(user);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}