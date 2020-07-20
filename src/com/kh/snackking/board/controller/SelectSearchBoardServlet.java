package com.kh.snackking.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.board.model.service.BoardService;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.board.model.vo.PageInfo;

/**
 * Servlet implementation class SelectSearchBoardServlet
 */
@WebServlet("/searchList.bo")
public class SelectSearchBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSearchBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String boardType = request.getParameter("boardType");
		String checkType = request.getParameter("checkType");
		String searchDate = request.getParameter("searchDate");
		
//		System.out.println("servlet userId : " + userId);
//		System.out.println("servlet boardType : " + boardType);
//		System.out.println("servlet checkType : " + checkType);
//		System.out.println("servlet searchDate : " + searchDate);
		
		HashMap<String, String> hmap = new HashMap<>();
		if(userId != null) {
			hmap.put("userId", userId);
		}
		if(boardType != null) {
			hmap.put("boardType", boardType);
		} 
		if(checkType != null) {
			hmap.put("checkType", checkType);
		}
		if(searchDate != null) {
			hmap.put("searchDate", searchDate);
		}
		
		int currentPage;                 
		int limit;                       
		int maxPage;                     
		int startPage;                  
		int endPage;                    
		
		currentPage = 1;
				
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 8;
		int listCount = 0;
		
		ArrayList<Board> list = null;
		PageInfo pi = null;
		String page = "";
		listCount = new BoardService().getListCount(hmap);
//		System.out.println("list count : " + listCount);
		maxPage = (int)((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1 ) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		list = new BoardService().selectSearchList(pi, hmap);
		
//		System.out.println("select board list : " + list);
//		System.out.println("board list size : " + list.size());
		
		int ck = 1;
		if(list != null) {
			page = "views/chiefManager/cmBoardMain.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("ck", ck);
			request.setAttribute("hmap", hmap);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "selectBoardList");
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
