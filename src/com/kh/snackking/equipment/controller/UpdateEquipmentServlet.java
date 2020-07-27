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
import com.kh.snackking.product.model.service.ProductService;

/**
 * Servlet implementation class UpdateEquipmentServlet
 */
@WebServlet("/updateEquipment.eq")
public class UpdateEquipmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEquipmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String possible = request.getParameter("str2");
		String equipCode = request.getParameter("str1");
		Equipment e = new Equipment();
		e.setEquipCode(equipCode);
		e.setPossible(possible);
		
		int result = new EquipmentService().updateEquipment(e);
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
