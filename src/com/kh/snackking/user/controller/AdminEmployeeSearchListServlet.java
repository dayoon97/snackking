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
 * Servlet implementation class AdminSearchListServlet
 */
@WebServlet("/adminSearchList.ad")
public class AdminEmployeeSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEmployeeSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] member = request.getParameterValues("list");
		String name = member[0];
		String company = member[1];
		String id = member[2];
		String phone = member[3];
		
		System.out.println(name);
		System.out.println(company);
		System.out.println(id);
		System.out.println(phone);
		
		User user = new User();
		
		if(name != null) {user.setUserName(name);}
		if(company != null) {user.setCompany(company);}
		if(id != null) {user.setUserId(id);}
		if(phone != null) {user.setPhone(phone);}
		
		ArrayList<User> searchMember = null;
		
		searchMember = new UserService().searchUserList(user);
	
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(searchMember, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
