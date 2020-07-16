package com.kh.snackking.preference.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.preference.model.service.PreferenceService;
import com.kh.snackking.preference.model.vo.Preference;

/**
 * Servlet implementation class SelectDetail
 */
@WebServlet("/selectDetail.pre")
public class SelectDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		int userNo = 0;
		if(num != null && num != "") {
			userNo = Integer.parseInt(num);
		}
		
		System.out.println("userNo : " + userNo);
		
		Preference Pre = new Preference();
		Pre.setPreNo(userNo);
		
		Preference selectPre = new PreferenceService().cmSelectOne(Pre);
		System.out.println("userPreference: " + selectPre);
		String page = "";
		if(selectPre != null) {
			page = "views/order/cmOrderfavoriteDetail.jsp";
			request.setAttribute("insertPre", selectPre);
		}else {
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
