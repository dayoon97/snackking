package com.kh.snackking.scheduler.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.scheduler.model.service.SchedulerService;
import com.kh.snackking.scheduler.model.vo.Scheduler;
import com.kh.snackking.scheduler.model.vo.SchedulerInfo;

/**
 * Servlet implementation class calendarChangeServlet
 */
@WebServlet("/change.ca")
public class SchedulerChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SchedulerChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rId = Integer.valueOf(request.getParameter("rId"));
		Date date = Date.valueOf(request.getParameter("date"));

		
		System.out.println("sdate값 :" +date);
		System.out.println("rId값 :" +rId);
		
		SchedulerInfo cal = new SchedulerInfo(date, rId);

		ArrayList<Scheduler> slist = SchedulerService.updateDate(cal);
		
		System.out.println("servletChange " +slist);
		RequestDispatcher view = null;
		if(!slist.isEmpty()) {
			view = request.getRequestDispatcher("views/calen3.jsp");
			request.setAttribute("slist", slist);
			view.forward(request, response);
		}else {
			PrintWriter out = response.getWriter();
			out.print("1");
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
