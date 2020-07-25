package com.kh.snackking.curating.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.curating.model.service.CurationService;
import com.kh.snackking.curating.model.vo.curating;
import com.kh.snackking.preference.model.vo.curatingList;

/**
 * Servlet implementation class CuratingListSearch
 */
@WebServlet("/curatingListSearch.cu")
public class CuratingListSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuratingListSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("Job-code"); //유저 확인여부
		String userCompany = request.getParameter("userCompany"); //회사명
		String userName= request.getParameter("userName"); //유저이름
		String preNo = request.getParameter("preNo"); // 선호도 번호
		
		
		curatingList cu = new curatingList();
		cu.setUserCom(userCompany);
		cu.setUserName(userName);
		cu.setStatus(status);
		
		if(preNo != null && preNo != "") {
			int pno = Integer.parseInt(preNo);
			cu.setPreNo(pno);
		}
		
		ArrayList<curatingList> cuList = new CurationService().CuratingListSearch(cu);
		
		String page = "";
		if(cuList != null) {
			page = "views/curator/curatingList.jsp";
			request.setAttribute("culist", cuList);
		}else {
			page = "views/curator/curatingList.jsp";
			request.setAttribute("culist", cuList);
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
