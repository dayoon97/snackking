package com.kh.snackking.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int userNo = Integer.parseInt(request.getParameter("num"));
//		System.out.println("select board list userNO servlet : " + userNo);
		
		// 페이징  처리 후 -------------------------------------------------------------
		int currentPage;                 // 현재 페이지를 표시할 변수
		int limit;                       // 한 페이지에 게시글이 몇 개 보여질 것인지 표
		int maxPage;                     // 전체 페이지에서 가장 마지막 페이지
		int startPage;                   // 한 번에 표시될 페이지가 시작할 페이지
		int endPage;                     // 한 번에 표시될 페이지가 끝나는 페이지
		
		// 게시판은 보통 1부터 시작함.
		currentPage = 1;
				
		// 전달받은 request가 있다면 전달받은 값으로 덮어씀
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		// 한 페이지에 보여질 목록 갯수
		limit = 10;
				
		// 전체 목록 갯수를 조회
		int listCount = new BoardService().getListCount();
		System.out.println("list count : " + listCount);
				
		// 총 페이지 수 계산
		// 예를 들면 목록 갯수가 123개이면, 총 필요한 페이지 수는 13개임.
		// double로 바꾼 listcount를 limit로 나눴을때 소수점(따까리)가 하나라도 나왔을 때, 0.9를 더해주면 무조건 올림 처리를 할 수 있다.
		maxPage = (int)((double) listCount / limit + 0.9);
				
		// 현재 페이지에 보여줄 시작 페이지 수 (limit(10개)개씩 보여지게 할 경우)
		// 아래 쪽 페이지 수가 10개씩 보여진다면
		// 1, 11, 21, 31, 41, . . .
		startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1 ) * 10 + 1;
				
		// 목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, . . .)
		endPage = startPage + 10 - 1;
				
		if(maxPage < endPage) {
			endPage = maxPage;
		}
			
		PageInfoVO pi = new PageInfoVO(currentPage, listCount, limit, maxPage, startPage, endPage);
				
		ArrayList<BoardVO> list = new BoardService().selectList(pi);
				
		String page = "";
		if(list != null) {
			page = "views/board/boardList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
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
