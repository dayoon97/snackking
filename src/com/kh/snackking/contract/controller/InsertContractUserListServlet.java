package com.kh.snackking.contract.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class InsertContractUserListServlet
 */
@WebServlet(name = "insertContractUserListServlet.co", urlPatterns = { "/insertContractUserList.co" })
public class InsertContractUserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertContractUserListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		System.out.println("유저리스트 서블릿 잘 나오나요~??");
		ArrayList<User> adminlist = new UserService().adminUserList(); 
		
		//여기 위까지 쓰고 돌아오는거 확인한 다음 아래 내용 작성해주자
//		System.out.println("회원 리스트 : " + adminlist);
		
		String page = "";
		if(adminlist != null) {
			page = "views/chiefManager/cmContractUserList.jsp";
			request.setAttribute("list", adminlist);
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
