package com.kh.snackking.contract.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.contract.model.service.ContractService;
import com.kh.snackking.contract.model.vo.Contract;

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
		
		//거래처명, 계약코드, 계약일, 계약기간(시작.끝), 배송횟수(월), 회차당 금액, 월 계약금액
		String corpName = request.getParameter("corpName");
		String conCode = request.getParameter("conCode");
		
		String conDate = request.getParameter("conDate");
		//오라클 데이터베이스에서는 Date형식. 여기서는 getParameter 쓰기 위해서
		//String 타입으로 적었다. 2020-07-19형식으로 출력되는데
		// - 기준으로 쪼개고 합쳐서 20200719 문자열 형식으로 만드려고 한다!
		//쿼리문에서 TO_DATE 써서 Date 형식으로 다시 바꿔주기
		String[] conDate1 = conDate.split("-");
		String conDate2 = conDate1[0] + conDate1[1] + conDate1[2];
		
		String startDate = request.getParameter("startDate"); 
		String[] startDate1 = startDate.split("-");
		String startDate2 = startDate1[0] + startDate1[1] + startDate1[2];
		
		String endDate = request.getParameter("endDate");
		String[] endDate1 = endDate.split("-");
		String endDate2 = endDate1[0] + endDate1[1] + endDate1[2];
		
		
		int delivCount = Integer.parseInt(request.getParameter("delivCount"));
		int amountPDeliv = Integer.parseInt(request.getParameter("amountPDeliv"));
		int ttlAmount = Integer.parseInt(request.getParameter("ttlAmout"));
	
		//크롬열고 뷰페이지에서 값 대충 입력하고 잘 넘어왔는지 잘 나오는지 확인
		System.out.println("corpName : " + corpName);
		System.out.println("conCode : " + conCode);
		System.out.println("conDate : " + conDate2);
		System.out.println("startDate : " + startDate2);
		System.out.println("endDate : " + endDate2);
		System.out.println("delivCount : " + delivCount);
		System.out.println("amountPDeliv : " + amountPDeliv);
		System.out.println("ttlAmount : " + ttlAmount);
		
		//계약 객체 만들어서 값 담았다.
		Contract contract = new Contract();
		contract.setCorpName(corpName);
		contract.setConCode(conCode);
		contract.setConDate(conDate2);
		contract.setStartDate(startDate2);
		contract.setEndDate(endDate2);
		contract.setDelivCount(delivCount);
		contract.setAmountPDeliv(amountPDeliv);
		contract.setTtlAmount(ttlAmount);
		
		//date 타입 날짜 3개를 String으로 바꿨는데 잘 나오는지 확인했다. 잘 나온다.
//		System.out.println(contract);
		 
		int result = new ContractService().insertContract(contract);
		
		//view - controller - service - dao 갔다가 다시 역순으로 돌아옴
		//그래서 지금 dao까지 아직 완성 안 했으면 dao에 있는 0 값이 다시 controller까지 역순으로 돌아와서
		//지금 출력하면 0으로 뜬다.
//		System.out.println("insert controller servlet result : " + result);
		
		
		//if문 써서 result > 0  쓰는 부분은 dao 갔다가 돌아올 때 쓰는 부분인 듯.
		//지금 dao 쿼리문에서 막힘 ㅜㅜ insert 말고 select 조회하러 감미다
		
		
	}
		
		
		//private String conCode;    //계약코드. 
		//private Date startDate;    //계약시작일
		//private Date endDate;      //계약종료일
		//private Date conDate;      //계약일
		//private int delivCount;    //월배송횟수
		//private int amountPDeliv;  //회차당 금액
		//private String denYN;      //계약종료여부YN. 체크 제약조건
		//private int userNo;        //회원번호. foriegn key
		//private String corpName;   //거래처명 
		//private int ttlAmount;     //월 계약금액
		//private int conNo;         //계약번호. 시퀀스 nextval로 숫자 순차적으로 나열. primary key

		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
