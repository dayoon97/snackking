package com.kh.snackking.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.board.model.service.BoardService;
import com.kh.snackking.board.model.vo.Attachment;

/**
 * Servlet implementation class SelectOneBoardServlet
 */
@WebServlet("/selectOne.bo")
public class SelectOneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
//		System.out.println("num : " + num);
		
//		ArrayList<Object> list = new BoardService().selectOneBoard(num);
		Map<String, Object> boardMap = new BoardService().selectOneBoard(num);

//		System.out.println("selectOne board servlet : " + boardMap);
		
//		System.out.println("boardMap.Attachment : " + boardMap.get("Attachment"));
		ArrayList<Attachment> atlist = (ArrayList<Attachment>) boardMap.get("Attachment");
		
//		Attachment[] atArr = new Attachment[4];
//		
//		for(int i = 0; i < atlist.size(); i++) {
//			System.out.println("atlist" + i + " : " + atlist.get(i));
//			atArr[i] = atlist.get(i);
//			System.out.println("atArr" + i + " : " + atArr[i]);
//		}
		
		String page = "";
		if(boardMap != null) {
			page = "views/common/userBoardDetail.jsp";
			request.setAttribute("boardMap", boardMap);
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
