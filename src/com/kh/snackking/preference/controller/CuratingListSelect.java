package com.kh.snackking.preference.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.preference.model.service.PreferenceService;
import com.kh.snackking.preference.model.vo.curatingList;

/**
 * Servlet implementation class CuratingListSelect
 */
@WebServlet("/curatingList.cu")
public class CuratingListSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuratingListSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<curatingList> list = new PreferenceService().curatingSelect();
		System.out.println("list : " + list);
		String page = "";
		if(list != null) {
			page = "views/curator/curatingList.jsp";
			request.setAttribute("culist", list);
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
