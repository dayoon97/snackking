package com.kh.snackking.board.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class SelectBoardListServlet
 */
@WebServlet("/selectBoardList.bo")
public class SelectBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User reqUser = (User) request.getSession().getAttribute("loginUser");
		
		int userNo = reqUser.getUserNo();
//		System.out.println("select board list userNO servlet : " + userNo);
		
		int currentPage;                 
		int limit;                       
		int maxPage;                     
		int startPage;                  
		int endPage;                    
		
		currentPage = 1;
				
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 10;
				
		int listCount = new BoardService().getListCount(userNo);
//		System.out.println("list count : " + listCount);
				
		maxPage = (int)((double) listCount / limit + 0.9);
				
		startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1 ) * 10 + 1;
				
		endPage = startPage + 10 - 1;
				
		if(maxPage < endPage) {
			endPage = maxPage;
		}
			
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
				
		ArrayList<Board> list = new BoardService().selectList(userNo, pi);
		
		System.out.println("select board list : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/common/userBoard.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
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
