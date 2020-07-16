package com.kh.snackking.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class SelectUserNameListServlet
 */
@WebServlet("/selectName.us")
public class SelectUserNameListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectUserNameListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String MngNo = request.getParameter("num");
		
		int nno = 0;
		if(MngNo != "" && MngNo != null) {
			nno = Integer.parseInt(MngNo);
		}
		
		String memberName = request.getParameter("memberName");
	
		System.out.println(memberName);
		
		ArrayList<User> list = new UserService().selectUserNameList(memberName, nno);
		
		
		
//		if(searchCondition.equals("memberName")) {
//			String userName = request.getParameter("searchValue");
//			
//			list = new UserService().selectUserNameList(userName, nno);
//		} 
//		else if(searchCondition.equals("memberCompany")) {
//			String userCompany = request.getParameter("searchValue");
//			
//			list = new UserService().selectUserCompanyList(userCompany, nno);
//		} else if(searchCondition.equals("memberId")) {
//			String userId = request.getParameter("searchValue");
//			
//			list = new UserService().selectUserIdList(userId, nno);
//		} else if(searchCondition.equals("memberPhone")) {
//			String userPhone = request.getParameter("searchValue");
//			
//			list = new UserService().selectUserPhoneList(userPhone, nno);
//		}
		
		
		
		
		
		System.out.println("회원 리스트 : " + list);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
