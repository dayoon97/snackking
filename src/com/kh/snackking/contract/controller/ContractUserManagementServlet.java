package com.kh.snackking.contract.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.contract.model.service.ContractService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class ContractUserManagementServlet
 */
@WebServlet("/contractUserManagement.co")
public class ContractUserManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContractUserManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//유저 정보 가지고 와야함. user 인데 계약 contract에서 넘깁니당
		ArrayList<User> conUserList = new ContractService().conUserList();
		
		//확인용으로 적어봅니당
//		System.out.println("계약회원 리스트 : " + conUserList);
		
		String page = "";
		if(conUserList != null) {
			page = "views/chiefManager/cmContractUserManagement.jsp";
			request.setAttribute("list", conUserList);
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
