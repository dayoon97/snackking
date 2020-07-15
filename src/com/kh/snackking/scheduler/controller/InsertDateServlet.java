package com.kh.snackking.scheduler.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.scheduler.model.service.SchedulerService;
import com.kh.snackking.scheduler.model.vo.Scheduler;

/**
 * Servlet implementation class InsertDateServlet
 */
@WebServlet("/insert.da")
public class InsertDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String enrollDate = request.getParameter("enrolldate");
		
		System.out.println("userNo : " + userNo);
		System.out.println("enrolldate : " + enrollDate);
		
		java.sql.Date day = null;
		
		if(enrollDate != "") {
			day = java.sql.Date.valueOf(enrollDate);
		}
		
		Scheduler scheduler = new Scheduler();
		scheduler.setUserNo(userNo);
		scheduler.setEnrollDate(day);
		
		System.out.println("scheduler : " + scheduler);
		
		int result = new SchedulerService().insertDate(scheduler);
		
		if(result > 0) {
			response.sendRedirect("/snackking/index.jsp");
		} else {
			request.setAttribute("msg", "공지사항 등록 실패!");
			request.getRequestDispatcher("/snackking/index.jsp").forward(request, response);
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
