package com.kh.snackking.product.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.snackking.common.MyFileRenamePolicy;
import com.kh.snackking.product.model.service.ProductService;
import com.kh.snackking.product.model.vo.Product;
import com.kh.snackking.product.model.vo.ProductAttachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/updateProduct.pr")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//폼전송을 multipart/form-data로 전송하는 경우에는 
		//기존처럼 request.getParameter로 값을 받을 수 없다.
		//cos.jar가 파일도 받고 폼의 다름 값들도 받아주는 역할을 한다.
		if(ServletFileUpload.isMultipartContent(request)) {
			//전송 파일 용량 제한 : 10Mbyte로 제한
			int maxSize = 1024 * 1024 * 10;
			//웹서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("사진 저장시 나중에 ROOT 확인하기 조원들이랑 경로 다를 수 있음 :" +root);
			//파일 저장 경로 설정
			String savePath = root + "product_uploadImages/";
			int attachmentResult = 0;
			
			//사용자가 올린 파일명을 그대로 사용하지 않는 것이 일반적이다.
			//1. 같은 파일명이 있는 경우 이전 파일을 덮어쓸 수 있다.
			//2. 한글로 된 파일명, 특수기호, 띄어쓰기 등은 서버 운영체제의 인코딩 방식에 따라 문제가 생길 수 있다.
			//FileRenamePolicy 상속 후 오버라이딩
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//원본 파일명이랑, 수정된 파일명 여기다가 저장할 것임.
			ProductAttachment pAttachment = new ProductAttachment();
			
			//앞서 파일이 전송된 폼의 name을 반환
			//Enumeration 는 iterator 랑 비슷
			Enumeration<String> files = multiRequest.getFileNames(); 
			//System.out.println("file name : " + files);
			
			//앞서 폼에서 전송해온 파일의 '이름'정보를 가져온다
			if(files.hasMoreElements()) {
				String name = files.nextElement();
				//System.out.println("name : " + name);
				//key 역할 할 값들이 출력됨
				//역순으로 넘어옴 주의! (사진 1개밖에 없음..)
				//변경된 파일을 saveFile 에 넣어준다.
				pAttachment.setChangeName(multiRequest.getFilesystemName(name));
				//원본이름도 반환해서 리스트에 넣음
				pAttachment.setOriginName(multiRequest.getOriginalFileName(name));
			}
			//저장 경로도 setter 해줌.
			pAttachment.setFilePath(savePath);

			//pAttachment에 파일 저장 관련 정보 다 담음
			//System.out.println("변경 후 이름 : " + pAttachment.getChangeName());
			//System.out.println("변경 전 기존 이름 : " + pAttachment.getChangeName());
			

			//mutiRequest. 객체 에서 파일 외의 값들도 꺼낼 수 있다.
			String pName = multiRequest.getParameter("pName");
			int pExp = Integer.parseInt(multiRequest.getParameter("pExp"));
			String pVendor = multiRequest.getParameter("pVendor");
			String ptName = multiRequest.getParameter("ptName");
			int price = Integer.parseInt(multiRequest.getParameter("price"));

			
			//향 배열에 있는것 하나씩 꺼내서 String 타입 한줄로 만들기
			String[] f = multiRequest.getParameterValues("flavor");
			String flavor = "";
			if(flavor != null) {
				//넘어온 값이 null이 아니라면, 
				for(int i = 0; i < f.length; i++) {
					if(i != 0) {
						flavor += ",";
					}
					flavor += f[i];
				}
			}
			
			//String flavor = multiRequest.getParameter("flavor");
			//System.out.println("servlet : " + flavor);
			//맛 배열에 있는것 하나씩 꺼내서 String 타입 한줄로 만들기
			String [] t = multiRequest.getParameterValues("taste");
			String taste= "";
			if(t != null) {
				for(int i = 0; i < t.length; i++) {
					if(i != 0) {
						taste += ",";
					}
					taste += t[i]; 
				}
			}
			
			//알레르기 배열에 있는것 하나씩 꺼내서 String 타입 한줄로 만들기
			String []a = multiRequest.getParameterValues("allergy");
			String allergy = "";
			if(a != null) {
				for(int i = 0; i < a.length; i++) {
					if(i != 0) {
						allergy += ",";
					}
					allergy += a[i];
				}
			}
			
			
			String[] ag = multiRequest.getParameterValues("age");
			String age = "";
			if(ag != null) {
				for( int i = 0; i < ag.length; i++) {
					if(i != 0) {
						age += ",";
					}
					age += ag[i];
				}
			}
			
			
			Product product = new Product();
			
			
			if(pName != null) {product.setpName(pName);}
			if(pExp != 0) {product.setpExp(pExp);}
			if(pVendor != null) {product.setpVendor(pVendor);}
			if(ptName != null) {product.setPtName(ptName);}
			if(flavor != null) {product.setFlavor(flavor);}
			if(taste != null) {product.setTaste(taste);}
			if(allergy != null) {product.setAllergy(allergy);}
			if(age != null) {product.setAge(age);}
			if(price != 0) {product.setPrice(price);}
			//상품 정보는 product에 다 담았음
			//System.out.println("servlet product 다 담음: " + product);
			//0이 돌아오면 이름이 이미 있는거고, 1이 오면 insert 성공
			//System.out.println("update Product : " + product);
			///////////////////////////////////////////////////////////////////////////////
			System.out.println("servlet : " + product);
			int result = new ProductService().updateProduct(product);
			if(result > 0) {
				//상품명 가지고 가서 pCode 확인해서 가져옴
	            String pCode = new ProductService().selectProductCode(product);
	            pAttachment.setpCode(pCode);
	            System.out.println("servlet pAttachment : " + pAttachment);
	            attachmentResult = new ProductService().updateProductAttachment(pAttachment);
	            
	            System.out.println("servlet attachmentResult : " + attachmentResult);
	            if(attachmentResult > 0) {
					System.out.println("첨부파일 업데이트 성공 !");
					response.sendRedirect(request.getContextPath() + "/views/product/productManagement.jsp");
				}else {
				//첨부파일(사진) 등록에 실패하면	
				//아예 상품 기본 정보만 등록된거라서. 상품 기본정보 삭제해버리기 
				}
            
			}else {
				System.out.println("상품 정보 업데이트 실패");
			}
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
