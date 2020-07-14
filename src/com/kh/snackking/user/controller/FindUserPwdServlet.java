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
 * Servlet implementation class FindUserPwdServlet
 */
@WebServlet("/findPwd.us")
public class FindUserPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindUserPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
//		System.out.println("findPwd userId servlet : " + userId);
//		System.out.println("findPwd name servlet : " + name);
//		System.out.println("findPwd email servlet : " + email);
		
		User reqUser = new User();
		reqUser.setUserId(userId);
		reqUser.setUserName(name);
		reqUser.setEmail(email);
		
		int result = new UserService().findUserPwd(reqUser);
		
		if(result > 0) {
			// 임시비밀번호 발송
		} else {
			// 다시 작성해라 애송이
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
