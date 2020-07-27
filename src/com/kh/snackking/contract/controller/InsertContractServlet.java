package com.kh.snackking.contract.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.contract.model.service.ContractService;
import com.kh.snackking.contract.model.vo.Contract;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class InsertContractServlet
 */
@WebServlet("/insertContract.co")
public class InsertContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertContractServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* private String businessNo;   //사업자등록번호
		private String startDate;    //계약시작일
		private String endDate;      //계약종료일 
		private String conDate;      //계약일
		private int delivCount;    	 //월배송횟수
		private int amountPDeliv;  	 //회차당 금액
		private String endYN;        //계약종료여부YN. 체크 제약조건
		private int userNo;          //회원번호. foriegn key
		private String corpName;     //거래처명 
		private int ttlAmount;       //월 계약금액
		private int conNo;           //계약번호. 시퀀스 nextval로 숫자 순차적으로 나열. primary key */
		
		
		String businessNo = request.getParameter("businessNo");
		String startDate = request.getParameter("startDate"); 
//		String[] startDate1 = startDate.split("-");
//		String startDate2 = startDate1[0] + startDate1[1] + startDate1[2];
		
		String endDate = request.getParameter("endDate");
//		String[] endDate1 = endDate.split("-");
//		String endDate2 = endDate1[0] + endDate1[1] + endDate1[2];
		
		String conDate = request.getParameter("conDate");
		//오라클 데이터베이스에서는 Date형식. 여기서는 getParameter 쓰기 위해서
		//String 타입으로 적었다. 2020-07-19형식으로 출력되는데
		// - 기준으로 쪼개고 합쳐서 20200719 문자열 형식으로 만드려고 한다!
		//쿼리문에서 TO_DATE 써서 Date 형식으로 다시 바꿔주기
//		String[] conDate1 = conDate.split("-");
//		String conDate2 = conDate1[0] + conDate1[1] + conDate1[2];
		
		int delivCount = Integer.parseInt(request.getParameter("delivCount"));
		int amountPDeliv = Integer.parseInt(request.getParameter("amountPDeliv"));
		String corpName = request.getParameter("corpName");
		int ttlAmount = Integer.parseInt(request.getParameter("ttlAmount"));
		

		//뷰 페이지에서 키(name) 값을 쓴다. userNo
		//키밸류는 값을 String으로 가져오기 때문에 int로 쓸 때 parsing을 해줘야 한다.
		int num = Integer.parseInt(request.getParameter("userNo"));
		System.out.println("num : " + num);
		
		
		
		//크롬열고 뷰페이지에서 값 대충 입력하고 잘 넘어왔는지 잘 나오는지 확인
		System.out.println("businessNo : " + businessNo);
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		System.out.println("conDate : " + conDate);
		System.out.println("delivCount : " + delivCount);
		System.out.println("amountPDeliv : " + amountPDeliv);
		System.out.println("corpName : " + corpName);
		System.out.println("ttlAmount : " + ttlAmount);
		
		
		//계약 객체 만들어서 값 담았다.
		Contract contract = new Contract();
		contract.setBusinessNo(businessNo);
		contract.setStartDate(startDate);
		contract.setEndDate(endDate);
		contract.setConDate(conDate);
		contract.setDelivCount(delivCount);
		contract.setAmountPDeliv(amountPDeliv);
		contract.setCorpName(corpName);
		contract.setTtlAmount(ttlAmount);
		contract.setUserNo(num);
		
		//date 타입 날짜 3개를 String으로 바꿨는데 잘 나오는지 확인했다. 잘 나온다.
//		System.out.println(contract);
		 
//		int result = new ContractService().insertContract(contract);
		User reqUser = new ContractService().insertContract(contract);
		
		//view - controller - service - dao 갔다가 다시 역순으로 돌아옴
		//그래서 지금 dao까지 아직 완성 안 했으면 dao에 있는 0 값이 다시 controller까지 역순으로 돌아와서
		//지금 출력하면 0으로 뜬다.
//		System.out.println("insert controller servlet result : " + result);
		
		
		//if문 써서 result > 0  쓰는 부분은 dao 갔다가 돌아올 때 쓰는 부분인 듯.
		String page = "";
//		if(result > 0) {
		if(reqUser != null) {
			//성공했을 때 이 뷰페이지로 넘어오면 
			//<% int num = (int) request.getAttribute("num"); 
			//%>    
			//가 있는데 이건 꼭 이 값을 넘겨줘야 한다. 값 넘겨주고 나서 다시 이 페이지로 돌아오면 
			//값을 또 넘겨줘야 함으로 여기로 돌아올 수 없음. 그래서 계약 조회페이지로 넘긴당.
			//page = "views/chiefManager/cmContractInsert.jsp";
			
			System.out.println("계약 등록 성공쓰!!!");
			//request는 새로고침 할 때마다 반복하고, response는 반복하지 않는다고 알아두자.
			//이렇게 쓰니까 새로고침해도 등록 안 된다.
			response.sendRedirect(request.getContextPath() + "/selectContract.co");
			
		} else {
			System.out.println("계약 등록 실패!");
			//else 밖에 있던 이 코드를 else 안에 썼다.
			request.getRequestDispatcher(page).forward(request, response);
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
