package com.kh.snackking.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		/* int userNo = Integer.parseInt(request.getParameter("userNo")); */
		//String userId = request.getParameter("MemberId");
		
		  //String company = request.getParameter("MemberCompany"); 
		String userName = request.getParameter("MemberName"); //String address =
		  //request.getParameter("address"); 
		  //String phone =
		 // request.getParameter("MemberPhone"); 
		 // String enrollDate =
		  //request.getParameter("enrollDate");
		 
		int mngNo = Integer.parseInt(request.getParameter("mngNo"));
		
		System.out.println("MemberName: " + userName);
		System.out.println("mngNo : " + mngNo);
		
		/*
		 * java.sql.Date day = null;
		 * 
		 * if(enrollDate != "") { // String[] dateArr = date.split("-"); // int[] drr =
		 * new int[dateArr.length]; // // for(int i = 0; i < dateArr.length; i++) { //
		 * drr[i] = Integer.parseInt(dateArr[i]); // }
		 * 
		 * //day = new java.sql.Date(new GregorianCalendar(drr[0], drr[i] - 1,
		 * drr[2]).getTimeInMillis());
		 * 
		 * java.sql.Date.valueOf(enrollDate);
		 * 
		 * } else { day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		 * }
		 */
		
		User user = new User();
		
		//user.setUserNo(userNo);
		//user.setUserId(userId);
		//user.setCompany(company);
		user.setUserName(userName);
		//user.setAddress(address);
		//user.setPhone(phone);
		//user.setEnrollDate(day);
		user.setUserNo(mngNo);
		
		System.out.println("user : " + user);
		
		ArrayList<User> list = new UserService().selectUserNameList(user);
		
		//if(searchCondition.equals("findId")) {
		//	String userId = request.getParameter("searchValue");
			
		//	list = new MemberService().searchId(userId);
		//} else if(searchCondition.equals("findName")) {
		//	String userName = request.getParameter("searchValue");
			
		//	list = new MemberService().searchName(userName);
		//} else {
		//	String gender = request.getParameter("gender");
		//}
			
		
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
