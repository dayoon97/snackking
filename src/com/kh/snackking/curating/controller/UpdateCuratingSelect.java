package com.kh.snackking.curating.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.curating.model.service.CurationService;
import com.kh.snackking.curating.model.vo.curating;
import com.kh.snackking.preference.model.service.PreferenceService;
import com.kh.snackking.preference.model.vo.Preference;

/**
 * Servlet implementation class UpdateCuratingSelect
 */
@WebServlet("/updateCuratingSelect.cu")
public class UpdateCuratingSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCuratingSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cuNo = Integer.parseInt(request.getParameter("cuNo"));
		
		Preference pre = new PreferenceService().UpdateCuratingSelect(cuNo);
		
//		curating cu = new CurationService().UpdateCuratingSelect(cuNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
