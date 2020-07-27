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
		String startDate = request.getParameter("startDate"); 
		String endDate = request.getParameter("endDate");
		String conDate = request.getParameter("conDate");
		int delivCount = Integer.parseInt(request.getParameter("delivCount"));
		int amountPDeliv = Integer.parseInt(request.getParameter("amountPDeliv"));
		String corpName = request.getParameter("corpName");
		int ttlAmount = Integer.parseInt(request.getParameter("ttlAmount"));
		
		int conNo = Integer.parseInt(request.getParameter("conNo"));
		
		
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
		
		Contract contractUpdate = new ContractService().updateContract(contract);
		
		String page ="";
		if(contractUpdate != null) {
			page = "views/chiefManager/noticeDetail.jsp";
			request.setAttribute("contract", contractUpdate);
		} else {
			page = "";
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
