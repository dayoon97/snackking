package com.kh.snackking.scheduler.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

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
@WebServlet("/search.da")
public class SchedulerSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SchedulerSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mana = request.getParameter("manager");
		System.out.println("manager aaa" + mana);
		
		int manager = 0;
		if(mana != "" && mana != null) {
			manager = Integer.parseInt(mana);
		}
		
		System.out.println("manager abc" +manager);
		ArrayList<Scheduler> sList = new ArrayList<>();
	
		sList = new SchedulerService().schedulerSearch(manager);
		
		
		

		request.setAttribute("sList", sList);
		request.getRequestDispatcher("views/calen2.jsp").forward(request, response);
		
		System.out.println("servlet schedulersearch " + sList); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
