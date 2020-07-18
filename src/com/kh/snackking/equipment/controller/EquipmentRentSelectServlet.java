package com.kh.snackking.equipment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.equipment.model.service.EquipmentRentService;
import com.kh.snackking.equipment.model.vo.EquipmentRent;

/**
 * Servlet implementation class EquipmentRentSelectServlet
 */
@WebServlet("/equipmentRentSelect")
public class EquipmentRentSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EquipmentRentSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String rentDate = request.getParameter("rentDate");
		//String rentDate = request.getParameter("rentDate");
		String equipCode = request.getParameter("equipCode");
		String company = request.getParameter("company");
		String backOk = request.getParameter("backOk");
		EquipmentRent equipmentRent = new EquipmentRent();
		//문자열 date로 바꾸기
		
		/*java.sql.Date rentDate = null;
		if(day != "") {
			rentDate = java.sql.Date.valueOf(day);
		}*/
		
		if(rentDate != null) {equipmentRent.setRentDate(rentDate);}
		if(equipCode != null) {equipmentRent.setEquipCode(equipCode);}
		if(company != null) {equipmentRent.setCompany(company);}
		if(backOk != null) {equipmentRent.setStatus(backOk);}
		ArrayList<EquipmentRent> list = new EquipmentRentService().selectRentList(equipmentRent);
		
		
		
		if(list == null) {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "equipmentList");
			request.getRequestDispatcher(page).forward(request, response);
			
		}
		//리스트 통으로 전송
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		System.out.println("servlet list : " + list);
		//알아서 자바 객체를 바꿔서 넘겨줌
		//별도 디코딩할필요 없음
		new Gson().toJson(list,response.getWriter());
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
