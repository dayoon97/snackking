package com.kh.snackking.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class UserInsertServlet
 */
@WebServlet("/insertUser.us")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("password1");
		String userName = request.getParameter("userName");
		String company = request.getParameter("company");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int zipNo = Integer.parseInt(request.getParameter("zipNo"));
		String address = request.getParameter("address");
		
//		System.out.println("userId : " + userId);
//		System.out.println("password : " + userPwd);
//		System.out.println("name : " + userName);
//		System.out.println("company : " + company);
//		System.out.println("phone : " + phone);
//		System.out.println("email : " + email);
//		System.out.println("zipno : " + zipNo);
//		System.out.println("address : " + address);
		
		User reqUser = new User();
		reqUser.setUserId(userId);
		reqUser.setUserPwd(userPwd);
		reqUser.setUserName(userName);
		reqUser.setCompany(company);
		reqUser.setPhone(phone);
		reqUser.setEmail(email);
		reqUser.setZipNo(zipNo);
		reqUser.setAddress(address);
		
//		System.out.println("reqUser : " + reqUser);
		
		int result = new UserService().insertUser(reqUser);
		
		if(result > 0) {
//			System.out.println("성공");
		} else {
//			System.out.println("실패");
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
