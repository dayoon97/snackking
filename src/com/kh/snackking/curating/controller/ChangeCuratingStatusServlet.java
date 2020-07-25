package com.kh.snackking.curating.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.curating.model.service.CurationService;
import com.kh.snackking.curating.model.vo.CurationList;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class ChangeCuratingStatusServlet
 */
@WebServlet("/changeCuStatus.cur")
public class ChangeCuratingStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCuratingStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User reqUser = (User) request.getSession().getAttribute("loginUser");
		int num = reqUser.getUserNo();
		
		int listNo = Integer.parseInt(request.getParameter("listNo"));
//		System.out.println("listNo : " + listNo);
		
		ArrayList<CurationList> list = new CurationService().changeCuratingStatus(num, listNo);
		System.out.println("result servlet : " + list);
		
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
