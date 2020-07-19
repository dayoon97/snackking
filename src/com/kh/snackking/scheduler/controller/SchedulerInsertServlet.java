package com.kh.snackking.scheduler.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.scheduler.model.service.SchedulerService;
import com.kh.snackking.scheduler.model.vo.SchedulerInfo;

/**
 * Servlet implementation class SchedulerInsertServlet
 */
@WebServlet("/insert.da")
public class SchedulerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SchedulerInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int s_code = Integer.parseInt(request.getParameter("s_code"));
		Date s_date = java.sql.Date.valueOf(request.getParameter("s_date"));
		Time s_time = java.sql.Time.valueOf(request.getParameter("s_time"));
		int cu_no = Integer.parseInt(request.getParameter("cu_no"));
		int con_no = Integer.parseInt(request.getParameter("con_no"));
		int s_count = Integer.parseInt(request.getParameter("s_count"));
		
		System.out.println(s_code);
		System.out.println(s_date);
		System.out.println(s_time);
		System.out.println(cu_no);
		System.out.println(con_no);
		System.out.println(s_count);
		
		ArrayList<SchedulerInfo> siList = new ArrayList<>();
		
	    siList = new SchedulerService().schedulerInsert();
	    
	    request.setAttribute("siList", siList);
	    request.getRequestDispatcher("views/calen2.jsp").forward(request, response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
