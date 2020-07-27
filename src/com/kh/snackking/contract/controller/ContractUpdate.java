package com.kh.snackking.contract.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.contract.model.service.ContractService;
import com.kh.snackking.contract.model.vo.Contract;

/**
 * Servlet implementation class ContractUpdate
 */
@WebServlet("/contractUpdate.co")
public class ContractUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContractUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String businessNo = request.getParameter("businessNo");
		System.out.println("businessNo : " + businessNo);
		String startDate = request.getParameter("startDate"); 
		String endDate = request.getParameter("endDate");
		String conDate = request.getParameter("conDate");
		int delivCount = Integer.parseInt(request.getParameter("delivCount"));
//		System.out.println("delivCount : " + delivCount);
		int amountPDeliv = Integer.parseInt(request.getParameter("amountPDeliv"));
		System.out.println("amountPDeliv : " + amountPDeliv);
		String corpName = request.getParameter("corpName");
		System.out.println("corpName : " + corpName);
		int ttlAmount = Integer.parseInt(request.getParameter("ttlAmount"));
		System.out.println("ttlAmount : " + ttlAmount);
		int conNo = Integer.parseInt(request.getParameter("conNo"));
		System.out.println("conNo : " + conNo);
		
		
		//businessNo, startDate, endDate, conDate, delivCount, amountPDeliv, corpName, ttlAmount, conNo
		
		Contract contract = new Contract();
		contract.setBusinessNo(businessNo);
		contract.setStartDate(startDate);
		contract.setEndDate(endDate);
		contract.setConDate(conDate);
		contract.setDelivCount(delivCount);
		contract.setAmountPDeliv(amountPDeliv);
		contract.setCorpName(corpName);
		contract.setTtlAmount(ttlAmount);
		contract.setConNo(conNo);
		
		int result = new ContractService().updateContract(contract);
		
		
		
		
		//수정해왔으면 1(0이 아님) 서버까지 잘 값이 가서 들어온것. DML구문이 작동했는지 여부 판단
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectContract.co");
		}
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
