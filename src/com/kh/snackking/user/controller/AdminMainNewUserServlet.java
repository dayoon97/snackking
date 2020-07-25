package com.kh.snackking.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.adjustment.model.service.AdjustmentService;
import com.kh.snackking.adjustment.model.vo.Adjustment;
import com.kh.snackking.board.model.service.BoardService;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.curating.model.service.CurationService;
import com.kh.snackking.curating.model.vo.CurationList;
import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class AdminMainNewUserServlet
 */
@WebServlet("/mainNewUser")
public class AdminMainNewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainNewUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> list = new UserService().newUserSelect();
		
		ArrayList<Board> Blist = new BoardService().newBoardSelect();
		
		ArrayList<Adjustment> Alist = new AdjustmentService().newAdjustmentSelect();
		
		ArrayList<CurationList> Clist = new CurationService().newCuratingStatus();
		
		String page = "";
		if((list != null) && (Blist != null) && (Alist != null) && (Clist != null)) {
			page = "views/chiefManager/cmMainPage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("Blist", Blist);
			request.setAttribute("Alist", Alist);
			request.setAttribute("Clist", Clist);
		} else {
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
