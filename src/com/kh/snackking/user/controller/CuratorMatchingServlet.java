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
 * Servlet implementation class CuratorMatchingServlet
 */
@WebServlet("/matchingSelect")
public class CuratorMatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuratorMatchingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<User> list = new UserService().matchingSelect();
		
		ArrayList<User> emplist = new UserService().matchingEmpSelect();
		
		ArrayList<User> userlist = new UserService().matchingUserSelect();
		
		String page = "";
		if((list != null) && (emplist != null) && (userlist != null)) {
			page = "views/employee/employeeMatching.jsp";
			request.setAttribute("list", list);
			request.setAttribute("emplist", emplist);
			request.setAttribute("userlist", userlist);
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
