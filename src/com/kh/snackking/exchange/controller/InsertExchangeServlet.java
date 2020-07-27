package com.kh.snackking.exchange.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.exchange.model.service.ExchangeService;
import com.kh.snackking.exchange.model.vo.Exchange;

/**
 * Servlet implementation class InsertExchangeServlet
 */
@WebServlet("/insertExchange.ex")
public class InsertExchangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertExchangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Exchange exchange = new Exchange();
		ArrayList<Exchange> list = new ExchangeService().selectList(exchange);
	/*	
		
		String page = "";
		if(list != null) {
			page = "views/equipment/equipmentList.jsp";
			request.setAttribute("list", list);
			
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "equipmentList");
		}
		request.getRequestDispatcher(page).forward(request, response);*/
		
		if(list == null) {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "equipmentList");
			request.getRequestDispatcher(page).forward(request, response);
			
		}
		//리스트 통으로 전송
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		//알아서 자바 객체를 바꿔서 넘겨줌
		//별도 디코딩할필요 없음
		new Gson().toJson(list,response.getWriter());
		
		System.out.println(list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
