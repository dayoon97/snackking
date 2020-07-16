package com.kh.snackking.preference.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.preference.model.service.PreferenceService;
import com.kh.snackking.preference.model.vo.Preference;

/**
 * Servlet implementation class SelectPreference
 */
@WebServlet("/selectPre.pre")
public class SelectPreference extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPreference() {
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
		Pre.setUserNo(userNo);
		
		
		Preference userPreference = new PreferenceService().selectOne(Pre);
		System.out.println("userPreference: " + userPreference);
		String page = "";
		if(userPreference != null) {
			page = "views/common/userPreferenceUpdate.jsp";
			request.setAttribute("insertPre", userPreference);
		}else {
			page = "views/curator/preference.jsp";
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
