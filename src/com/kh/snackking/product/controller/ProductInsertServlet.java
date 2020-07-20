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
 * Servlet implementation class ProductInsertServlet
 */
@WebServlet("/productInsert")
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


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
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				//System.out.println("name : " + name);
				//key 역할 할 값들이 출력됨
				//역순으로 넘어옴 주의! (사진 1개밖에 없음..)
				//변경된 파일을 saveFile 에 넣어준다.
				pAttachment.setChangeName(multiRequest.getFilesystemName(name));
				//원본이름도 반환해서 리스트에 넣음
				pAttachment.setOriginName(multiRequest.getOriginalFileName(name));
			}
			//저장 경로도 setter 해줌
			pAttachment.setFilePath(savePath);

			//pAttachment에 파일 저장 관련 정보 다 담음
			//System.out.println("변경 후 이름 : " + pAttachment.getChangeName());
			//System.out.println("변경 전 기존 이름 : " + pAttachment.getChangeName());
			

			//mutiRequest. 객체 에서 파일 외의 값들도 꺼낼 수 있다.
		
			String pName = multiRequest.getParameter("pName");
			int pExp = Integer.parseInt(multiRequest.getParameter("pExp"));
			String pVendor = multiRequest.getParameter("pVendor");
			String ptName = multiRequest.getParameter("ptName");
			String flavor = multiRequest.getParameter("flavor");
			String taste = multiRequest.getParameter("taste");
			String allergy = multiRequest.getParameter("allergy");
			String age = multiRequest.getParameter("age");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
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
			
			
			//1.먼저 입력한 상품명이 기존에 등록된 것인지 중복확인한다. 한번 DAO 갔다옴.
			//num = 1인 경우 상품이름이 중복이 아니고 num = -1인경우 상품 이름 중복이므로
			//num = 1일때만 다시 
			int num1 = new ProductService().checkProductName(product);
			if(num1 == 1) { //1일때만 다시 감
				
					//먼저 사진 제외하고 상품 정보 먼저 저장함.(시퀀스로 상품 코드 자동 생성하고, 생성한 pCode 기준으로
					//pAttachment insert할 때, 테이블에 pCode 넣을 것이라서. 상품 정보 먼저 저장함
					int result = new ProductService().insertProduct(product);
					//System.out.println("servlet " + result);
					//response.setContentType("application/json");안씀
					//response.setCharacterEncoding("UTF-8");안씀
					
					//String page = "";
					//사진 외 상품 정보 저장 성공시 result=1 을 반환함
					if(result > 0) {
						//request.setAttribute("msg", "productInsertSuccess");
						//request.getRequestDispatcher("views/product/productManagement.jsp").forward(request, response);
						
						
						//상품 정보 등록 성공 후 등록한 상품의 고유 상품 코드 가져오기
						//상품명도 unique라서 상품명 기준으로 code 가져옴
						String pCode = new ProductService().selectProductCode(product);
						//pCode 가져온거 pAttachment에 붙임
						pAttachment.setpCode(pCode);
						//System.out.println("servlet pAttachment 다 담음: " + pAttachment);
						
						//성공하면 첨부 pAttachment도 insert 해주기
						attachmentResult = new ProductService().insertProductAttachment(pAttachment);
						//메뉴바 위치 자꾸 바뀌어서 sendRedirect로 보냈음.
						
						//첨부파일 등록도 최종적으로 성공하면 !!
						if(attachmentResult > 0) {
						response.sendRedirect(request.getContextPath() + "/views/product/productManagement.jsp");
						}else {
						//첨부파일(사진) 등록에 실패하면	
						//아예 상품 기본 정보만 등록된거라서. 상품 기본정보 삭제해버리기 
						}
					}else {
						//등록 실패하면 그냥 등록창으로 다시 돌아감
						request.setAttribute("product", product);
						request.setAttribute("result", "0");
						response.sendRedirect(request.getContextPath() + "/views/product/productAdd.jsp");
					}
					
			}else{  //num = -1 이 온 경우 (상품명 중복으로)
				request.setAttribute("product", product);
				request.setAttribute("result", "-1");
				response.sendRedirect(request.getContextPath() + "/views/product/productAdd.jsp");
			}
	}		
}
	
//쓰는게 잘 안되서 일단 적어놓음.
/*case "productInsertSuccess" : 
	successMessage = "상품 등록에 성공하였습니다!";
	movePath = "<%= request.getContextPath()%>/views/product/productManagement.jsp";
	break;*/
	
/*case "productNameOverlap" : 
	errorsMessage = "상품 등록시 이름이 중복되었습니다!!";
	movePath = "<%= request.getContextPath()%>/views/product/productAdd.jsp";
	break;
	
case "productInsertFail" : 
	errorsMessage = "상품 등록에 실패했습니다!!";
	movePath = "<%= request.getContextPath()%>/views/product/productAdd.jsp";
	break;*/


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
