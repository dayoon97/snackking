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
import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;
import com.kh.snackking.product.model.vo.ProductAndAttachment;
import com.kh.snackking.product.model.vo.ProductAttachment;

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
		
		//검색박스에 입력했던 조건에 맞는 상품 검색하여 상품 정보 담아오기
		ArrayList<Product> productList = new ProductService().selectProductAllList(conditionList);
		//list 조회해 온것이 null이 아니면, 사진도 조회하러 간다.
		///////////////////////////////////////////조건문 넣어주기
		
		
		//리스트 사이즈만큼 배열 만들어주고 
		String [] pCodeArray = new String [productList.size()];
		//배열에 코드 이름을 담는다. (코드 이름으로 attachment 가져올거라서!)
	      for(int i = 0; i < productList.size(); i++){
	    	  pCodeArray[i] = productList.get(i).getpCode();
		      //System.out.println("selectProductServlet : CodeArray : " + pCodeArray[i]);
	      }
	      
	      
	     //상품코드에 맞는 attachment 파일을 가져온다. 
	     ArrayList<ProductAttachment> attachmentList = new ProductService().selectAttachment(pCodeArray);
	    // System.out.println("serlvet" + attachmentList);

	      
	    //조건에 맞는 상품과 첨부사진을 모두 조회해오면 
	    //PRODUCT, PRODUCTATTACHMENT 를 합쳐놓은 새로운 VO(PRODUCT'AND'ATTACHMENT)에 한꺼번에 다 담아서 값을 AJAX로 넘겨준다.
	     ArrayList<ProductAndAttachment> totalList = new ArrayList<ProductAndAttachment>();
	     for(int i = 0; i < attachmentList.size(); i++) {
	    	 //일단 반복문 돌때마다 담을 객체 새로 하나 생성한다.
	         ProductAndAttachment p = new ProductAndAttachment();
		     p.setChangeName(attachmentList.get(i).getChangeName());
		     p.setUploadDate(attachmentList.get(i).getUploadDate());
		     p.setOriginName(attachmentList.get(i).getOriginName());
		     p.setFilePath(attachmentList.get(i).getFilePath());
		     p.setFid(attachmentList.get(i).getFid());
		     p.setStatus(attachmentList.get(i).getStatus());
		     //p코드는 겹치는데 product에서 가져옴.
		     
		     p.setAge(productList.get(i).getAge());
		     p.setAllergy(productList.get(i).getAllergy());
		     p.setDelete_YN(productList.get(i).getDelete_YN());
		     p.setFlavor(productList.get(i).getFlavor());
		     p.setpCode(productList.get(i).getpCode());
		     p.setpExp(productList.get(i).getpExp());
		     p.setpName(productList.get(i).getpName());
		     p.setPrice(productList.get(i).getPrice());
		     p.setPtCode(productList.get(i).getPtCode());
		     p.setPtName(productList.get(i).getPtName());
		     p.setpVendor(productList.get(i).getpVendor());
		     p.setSearch_YN(productList.get(i).getSearch_YN());
		     p.setTaste(productList.get(i).getTaste());
		     //System.out.println("servlet all vo " + p);
		     totalList.add(p);
	     }
	
	  
	      
		//System.out.println("servlet selectProductAllList : " + productList);
		/*if(list == null) {
			String page = "views/common/errorPage.jsp";
			request.setAttribute("errorCode", "equipmentList");
			request.getRequestDispatcher(page).forward(request, response);
			
		}*/
		//리스트 통으로 전송
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	
		new Gson().toJson(totalList,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
