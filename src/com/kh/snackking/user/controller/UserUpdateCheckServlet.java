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
 * Servlet implementation class UserUpdateCheckServlet
 */
@WebServlet("/updateUserCheck.us")
public class UserUpdateCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String password = request.getParameter("password1");
		
//		System.out.println(userNo);
//		System.out.println(password);
		User reqUser = new User();
		reqUser.setUserNo(userNo);
		reqUser.setUserPwd(password);
		
		boolean result = new UserService().updatePwdCheck(reqUser);
		
		String page = "";
		if(result) {
//			System.out.println("성공");
			page = "views/common/userUpdateInfo.jsp";
		} else {
//			System.out.println("실패");
			page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "updatePwdCheck");
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
