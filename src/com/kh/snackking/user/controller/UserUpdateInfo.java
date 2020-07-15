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
 * Servlet implementation class UserUpdateInfo
 */
@WebServlet("/updateUserInfo.us")
public class UserUpdateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String password = null;
		if(password2.length() > 20) {
			password = password2;
		} else {
			password = password1;
		}
		String userName = request.getParameter("userName");
		String company = request.getParameter("company");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int zipNo = Integer.parseInt(request.getParameter("zipNo"));
		String address = request.getParameter("address");
		
		System.out.println("pass1 : " + password1);
		System.out.println("pass2 : " + password2);
		System.out.println("real password : " + password);
		
		User reqUser = new User();
		reqUser.setUserNo(userNo);
		reqUser.setUserPwd(password);
		reqUser.setUserName(userName);
		reqUser.setCompany(company);
		reqUser.setPhone(phone);
		reqUser.setEmail(email);
		reqUser.setZipNo(zipNo);
		reqUser.setAddress(address);
		
		User responseUser = new UserService().updateUserInfo(reqUser);
		
		String page = "";
		if(responseUser != null) {
			request.getSession().setAttribute("loginUser", responseUser);
	    	response.sendRedirect("index.jsp");
		} else {
			page = "views/common/errorPage.jsp";
	        request.setAttribute("errorCode", "updateUser");
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
