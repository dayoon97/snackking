package com.kh.snackking.preference.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.preference.model.service.PreferenceService;
import com.kh.snackking.preference.model.vo.Preference;

/**
 * Servlet implementation class InsertPerference
 */
@WebServlet("/insertPer.per")
public class InsertPerference extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPerference() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userid"); //유저번호 ( 숫자로 바꿔야함 )
		int user = 0;
		if(userId != "" && userId != null) {
			user = Integer.parseInt(userId);
		}
		
		
		int budget = Integer.parseInt(request.getParameter("budget")); //예산
		int personnel = Integer.parseInt(request.getParameter("personnel")); //간식먹을 인원
		
		String age1 = request.getParameter("age1"); //나이20
		String age2 = request.getParameter("age2");	//나이30
		String age3 = request.getParameter("age3");	//나이40
		String age4 = request.getParameter("age4");	//나이50
		String age5 = request.getParameter("age5");	//나이60
		String age = age1 + ", " + age2 + ", " + age3 + ", " + age4 + ", " + age5;
		
		String[] kinds = request.getParameterValues("kinds"); //과자 종류
		String kindsList = "";
		if(kinds != null) {
			for(int i = 0; i < kinds.length; i++) {
				if(i == 0) {
					kindsList += kinds[i] + ",";
				}else if(i == kinds.length-1) {
					kindsList += kinds[i];
				}else {
					kindsList += kinds[i] + ",";
				}
				
			}
		}
		String[] flavor = request.getParameterValues("flavor"); //맛 종류
		String flavorList = "";
		if(kinds != null) {
			for(int i = 0; i < kinds.length; i++) {
				if(i == 0) {
					kindsList += kinds[i] + ",";
				}else if(i == kinds.length-1) {
					kindsList += kinds[i];
				}else {
					kindsList += kinds[i] + ",";
				}
				
			}
		}
		
		String[] smell = request.getParameterValues("smell"); //향 종류
		String smellList = "";
		if(smell != null) {
			for(int i = 0; i < smell.length; i++) {
				if(i == 0) {
					smellList += smell[i] + ",";
				}else if(i == kinds.length-1) {
					smellList += smell[i];
				}else {
					smellList += smell[i] + ",";
				}
				
			}
		}
		
		String freesmell = request.getParameter("freesmell"); //선호하는 향
		
		String[] allergy = request.getParameterValues("allergy"); //알레르기 종류
		String allergyList = "";
		if(allergy != null) {
			for(int i = 0; i < allergy.length; i++) {
				if(i == 0) {
					allergyList += allergy[i] + ",";
				}else if(i == allergy.length-1) {
					allergyList += allergy[i];
				}else {
					allergyList += allergy[i] + ",";
				}
				
			}
		}
		
		String perstyle = request.getParameter("perstyle"); //스타일
		
		String[] equipment = request.getParameterValues("equipment"); //설비
		String equipmentList = "";
		if(equipment != null) {
			for(int i = 0; i < equipment.length; i++) {
				if(i == 0) {
					equipmentList += equipment[i] + ",";
				}else if(i == kinds.length-1) {
					equipmentList += equipment[i];
				}else {
					equipmentList += equipment[i] + ",";
				}
				
			}
		}
		
		
		System.out.println(budget + personnel + age + kindsList + flavorList + smellList + freesmell + allergyList + perstyle + equipmentList);
		
		Preference insertPre = new Preference();
		insertPre.setUserNo(user);
		insertPre.setPreBudget(budget);
		insertPre.setPrePersonnel(personnel);
		insertPre.setPreAge("age");
		insertPre.setPreProductTypes(kindsList);
		insertPre.setPreTaste(flavorList);
		insertPre.setPreFlavor(smellList);
		insertPre.setPreEtcFlavor(freesmell);
		insertPre.setPreAlName(allergyList);
		insertPre.setPreStyle(perstyle);
		insertPre.setPreEquipment(equipmentList);
		
		System.out.println(insertPre);
		int result = new PreferenceService().insertPreference(insertPre);
		System.out.println(result);
		
		String page = "";
		if(result > 0) {
			page = "views/common/userMenu.jsp";
			request.setAttribute("insertPre", insertPre);
		}else {
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
