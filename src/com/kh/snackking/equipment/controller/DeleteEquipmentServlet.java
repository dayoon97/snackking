package com.kh.snackking.equipment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.equipment.model.service.EquipmentService;

/**
 * Servlet implementation class DeleteEquipmentServlet
 */
@WebServlet("/deleteEquipment")
public class DeleteEquipmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEquipmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String equipCode = request.getParameter("str");
		
		
		int result = new EquipmentService().deleteEquipment(equipCode);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		//알아서 자바 객체를 바꿔서 넘겨줌
		//별도 디코딩할필요 없음
		new Gson().toJson(result,response.getWriter());
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
