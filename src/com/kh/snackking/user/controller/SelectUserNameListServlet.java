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
		String[] member = request.getParameterValues("list");
		int nno = (Integer.parseInt(request.getParameter("user")));
//		String list = "";
//		if(member != null) {
//			for(int i = 0; i < member.length; i++) {
//				if(i == 0) {
//					list += member[i];
//				} else {
//					list += ", " + member[i];
//				}
//			}
//		}
		
		System.out.println(nno);
		//System.out.println(list);
		
		System.out.println(member[0]);
		System.out.println(member[1]);
		System.out.println(member[2]);
		System.out.println(member[3]);
		
		//ArrayList<User> list = new UserService().selectUserNameList(nno);
		
		ArrayList<User> searchMember = null;
		
		
		if(member[0] != "") {
			String userName = member[0];
			
			searchMember = new UserService().selectUserNameList(userName, nno);
		} 
			
		if(member[1] != "") {
			String userCompany = member[1];
			
			searchMember = new UserService().selectUserCompanyList(userCompany, nno);
		}
		if(member[2] != "") {
			String userId = member[2];
			
			searchMember = new UserService().selectUserIdList(userId, nno);
		}
		if(member[3] != "") {
			String userPhone = member[3];
			
			searchMember = new UserService().selectUserPhoneList(userPhone, nno);
		}
		
		
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
