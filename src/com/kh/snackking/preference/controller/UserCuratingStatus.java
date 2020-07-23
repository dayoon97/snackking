package com.kh.snackking.preference.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.preference.model.service.PreferenceService;

/**
 * Servlet implementation class UserCuratingStatus
 */
@WebServlet("/userCuratingStatus.pre")
public class UserCuratingStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCuratingStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int preNo = Integer.parseInt(request.getParameter("num"));
		
		int result = new PreferenceService().CuartingStatus(preNo);
		
		String page = "";
		if(result > 0) {
			
			page = "curatingList.cu";
		}else {
			System.out.println("에러");
		}
		request.getRequestDispatcher(page).forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
