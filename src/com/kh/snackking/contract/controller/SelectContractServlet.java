package com.kh.snackking.contract.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.contract.model.service.ContractService;
import com.kh.snackking.contract.model.vo.Contract;
import com.kh.snackking.contract.model.vo.PageInfo;

/**
 * Servlet implementation class SelectContractServlet
 */
@WebServlet("/selectContract.co")
public class SelectContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectContractServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Contract> list = new ContractService().selectList();
		
		System.out.println("select controller list : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/chiefManager/cmContractSearchList.jsp";
			request.setAttribute("list", list);
		} else {
			page = "";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		/*int currentPage;
		int limit; 		
		int maxPage;	
		int startPage;	
		int endPage;	
		
		
		currentPage = 1;
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		limit = 10;
		
		//전체 목록 갯수를 조회
		int listCount = new ContractService().getListCount();
		System.out.println("list count : " + listCount);
		
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		
		startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1) * 10 + 1;
		
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//객체 만듦
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		System.out.println("pi : " + pi);
		
		ArrayList<Contract> list = new ContractService().selectList(pi);
		
		String page = "";
		if(list != null) {
			page = "views/board/ContractList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "게시판 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		*/
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
