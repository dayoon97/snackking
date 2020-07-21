package com.kh.snackking.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.board.model.service.BoardService;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.board.model.vo.PageInfo;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class CmSelectBoardListServlet
 */
@WebServlet("/cuBoardList.bo")
public class CuSelectBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuSelectBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(userNo);
		
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
				
		int listCount = new BoardService().getCuListCount(userNo);
//		System.out.println("list count : " + listCount);
				
		maxPage = (int)((double) listCount / limit + 0.9);
				
		startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1 ) * 10 + 1;
				
		endPage = startPage + 10 - 1;
				
		if(maxPage < endPage) {
			endPage = maxPage;
		}
			
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
				
		ArrayList<Board> list = new BoardService().selectList(pi);
		
//		System.out.println("select board list : " + list);
//		
//		String page = "";
//		if(list != null) {
//			page = "views/chiefManager/cmBoardMain.jsp";
//			request.setAttribute("list", list);
//			request.setAttribute("pi", pi);
//		} else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("errorCode", "selectBoardList");
//		}
//		
//		request.getRequestDispatcher(page).forward(request, response);
//		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
