package com.kh.snackking.contract.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.contract.model.service.ContractService;
import com.kh.snackking.contract.model.vo.Contract;

/**
 * Servlet implementation class SelectContractUserList
 */
@WebServlet("/selectContractUserList.co")
public class SelectContractUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectContractUserList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//회사명, 사업자등록번호, 계약일, 계약시작일, 계약종료일
		String corpName = request.getParameter("corpName");
		String businessNo = request.getParameter("businessNo");
		String conDate = request.getParameter("conDate");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
//		System.out.println("servlet corpName : " + corpName);
//		System.out.println("servlet businessNo :" + businessNo);
//		System.out.println("servlet conDate : " + conDate);
//		System.out.println("servlet startDate : " + startDate);
//		System.out.println("servlet endDate : " + endDate);
		
		//키, 밸류 방식으로 받아와서 쓴다. 해시맵
		HashMap<String, String> hmap = new HashMap<>();
		if(corpName != null) {
			hmap.put("corpName", corpName);
		}
		if(businessNo != null) {
			hmap.put("businessNo", businessNo);
		}
		if(conDate != null) {
			hmap.put("conDate", conDate);
		}
		if(startDate != null) {
			hmap.put("startDate", startDate);
		}
		if(endDate != null) {
			hmap.put("endDate", endDate);
		}
		
		
		ArrayList<Contract> list = new ContractService().selectContractUserList(hmap);
		
		
		HashMap<String, Object> ajaxMap = new HashMap<>();
		ajaxMap.put("list", list);
		
		//이렇게 코드 3줄로 간단하게 작성 할 수 있당! Gson 사용코드
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(ajaxMap, response.getWriter());
        

		
		
	/*	String page = "";
		if(list != null) {
			page = "views/chiefManager/cmContractSearchList.jsp";
			request.setAttribute("list", list);
		} else {
			page = "";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	*/	
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
