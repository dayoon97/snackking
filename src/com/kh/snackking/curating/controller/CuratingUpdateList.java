package com.kh.snackking.curating.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.curating.model.service.CurationService;
import com.kh.snackking.preference.model.service.PreferenceService;

/**
 * Servlet implementation class CuratingUpdateList
 */
@WebServlet("/curatingUpdateList.cu")
public class CuratingUpdateList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuratingUpdateList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cuNo = Integer.parseInt(request.getParameter("num"));
		
		int result = new CurationService().UpdateCuratingList(cuNo);
		int preCuStatus = new PreferenceService().PreCuSratus(cuNo);
		
		System.out.println("preCuStatus" + preCuStatus);
		if(result > 0) {
			if(preCuStatus > 0) {
				request.getRequestDispatcher("curatingList.cu");
			}else {
				System.out.println("에러");
			}
		}else {
			System.out.println("에러");
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
