package com.kh.snackking.curating.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.curating.model.service.CurationService;
import com.kh.snackking.curating.model.vo.CurationList;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class SelectUserCurationServlet
 */
@WebServlet("/selectUserCuration.cur")
public class SelectUserCurationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectUserCurationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User reqUser = (User) request.getSession().getAttribute("loginUser");
//		System.out.println("reqUser No : " + reqUser.getUserNo());
		int num = reqUser.getUserNo();
		
		ArrayList<CurationList> list = new CurationService().selectUserCurationList(num);
//		System.out.println("list : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/common/userCuratingHistory.jsp";
			request.setAttribute("list", list);
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
