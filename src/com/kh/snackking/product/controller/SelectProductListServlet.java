package com.kh.snackking.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.equipment.model.vo.Equipment;
import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;

/**
 * Servlet implementation class SelectProductListServlet
 */
@WebServlet("/selectProductAllList")
public class SelectProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pCode = request.getParameter("pCode");
		String pName = request.getParameter("pName");
		String pexp = request.getParameter("pExp");
		String ptName = request.getParameter("ptName");
		String pr1 = request.getParameter("price1");
		String pr2 = request.getParameter("price2");
		String flavor = request.getParameter("flavor");
		String taste = request.getParameter("taste");
		String allergy = request.getParameter("allergy");
		String age = request.getParameter("age");
		Product p1 = new Product();
		if(pCode != null || pCode != "") {p1.setpCode(pCode);}
		if(pName != null || pName != "") {p1.setpName(pName);}
		//숫자
		int pExp = 0;
		if(pexp != "") {
			pExp = Integer.parseInt(pexp);
			p1.setpExp(pExp);
		}
		
		if(ptName != null || ptName != "") {p1.setPtName(ptName);}
		
		//숫자
		int price1 = 0;
		if(pr1 != "") {
			price1 = Integer.parseInt(pr1);
			p1.setPrice(price1);
		}
		
		if(flavor != null || flavor != "") {p1.setFlavor(flavor);}
		if(taste != null || taste != "") {p1.setTaste(taste);}
		if(allergy != null || allergy != "") {p1.setAllergy(allergy);}
		if(age != null || age != "") {p1.setAge(age);}
	
		//price1 ~ price2 범위까지 가격 찾을 건데, product 객체 price는 int형이라 한가지만 담을 수 있어서
		//product2 생성하여 price2정보만 담음
		Product p2 = new Product();
		//숫자
		int price2 = 0;
		if(pr2 != "") {
			price2 = Integer.parseInt(pr2);
			p2.setPrice(price2);
		}
		
		//검색 조건 정보 p1, p2를 모두 list에 담는다.
		//해시맵에 담기
		HashMap<String, Product> conditionList = new HashMap<String, Product>();
		conditionList.put("p1", p1);
		conditionList.put("p2", p2);
		//System.out.println(p1);
		//System.out.println(p2);
		//조건에 맞는 상품 검색하여 상품 정보 담아오기
		ArrayList<Product> productList = new ProductService().selectProductAllList(conditionList);
		//new ProductService().selectProductList(equipment);
		
		//System.out.println("servlet selectProductAllList : " + productList);
		/*if(list == null) {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "equipmentList");
			request.getRequestDispatcher(page).forward(request, response);
			
		}*/
		//리스트 통으로 전송
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	
		new Gson().toJson(productList,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
