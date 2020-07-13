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
 * Servlet implementation class SelectUserListServlet
 */
@WebServlet("/selectUserList.us")
public class SelectUserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectUserListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("userId");
		String company = request.getParameter("company");
		String userName = request.getParameter("userName");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String enrollDate = request.getParameter("enrollDate");
		int mngId = Integer.parseInt(request.getParameter("mngId"));
		
		System.out.println(userNo);
		
		ArrayList<User> list = new UserService().selectUserList(mngId); 
		
		System.out.println("회원 리스트 : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/chiefManager/cmMemberSelect.jsp";
			request.setAttribute("list", list);
		} else {
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
