package com.kh.snackking.equipment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.equipment.model.service.EquipmentService;
import com.kh.snackking.equipment.model.vo.Equipment;

/**
 * Servlet implementation class AddEquipmentServlet
 */
@WebServlet("/addEquipment")
public class AddEquipmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEquipmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String equipType = request.getParameter("newEquipType");
		String equipName = request.getParameter("newEquipName");
		String equipMake = request.getParameter("newEquipMake");
		Equipment equipment = new Equipment();
		if(equipType != null) {equipment.setEquipType(equipType);}
		if(equipMake != null) {equipment.setEquipMake(equipMake);}
		if(equipName != null) {equipment.setEquipName(equipName);}
		int result = new EquipmentService().insertEquipment(equipment);
		
		/*if(result == 0) {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "addEquipment");
			request.getRequestDispatcher(page).forward(request, response);
			
		}*/
		//리스트 통으로 전송
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		//알아서 자바 객체를 바꿔서 넘겨줌
		//별도 디코딩할필요 없음
		new Gson().toJson(result,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
