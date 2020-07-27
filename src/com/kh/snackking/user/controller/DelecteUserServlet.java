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
 * Servlet implementation class DelecteUserServlet
 */
@WebServlet("/deleteUser.us")
public class DelecteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelecteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("num"));
		String tcode = request.getParameter("tcode");
		
		System.out.println("userNo : " + userNo);
		System.out.println("Tcode : " + tcode);
		
		User user = new User();
		user.settCode(tcode);
		user.setUserNo(userNo);
		
		
		int result = new UserService().deleteUserSelect(user);
		
		System.out.println("result : " + result);
		
		String page = "";
		if(result == 3) {
//			request.getSession().invalidate();//session.invalidate()는 세션을 무효화하는 메서드이다.(소멸은 아니므로 혼동하지 않기로 주의한다.)
//			response.sendRedirect("index.jsp");
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(result, response.getWriter());
			
		} else if(result == 1){
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(result, response.getWriter());
			
//			request.getSession().invalidate();//session.invalidate()는 세션을 무효화하는 메서드이다.(소멸은 아니므로 혼동하지 않기로 주의한다.)
//			response.sendRedirect("index.jsp");
			
		} else if(result == 0) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(result, response.getWriter());
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
