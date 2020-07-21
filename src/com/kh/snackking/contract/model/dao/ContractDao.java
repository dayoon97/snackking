package com.kh.snackking.contract.model.dao;

//여기서는 close 메소드 쓰기 위해서 JDBCTemplate 임포트했다.
import static com.kh.snackking.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.contract.model.vo.Contract;


public class ContractDao {

	private Properties prop = new Properties();

	public ContractDao() {
		String fileName = ContractDao.class.getResource("/sql/contract/contract-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//계약 insert
	public int insertContract(Connection con, Contract contract) {

		
//		System.out.println(contract.getUserNo());
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertContract");
		
//		System.out.println("query : " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			
//			System.out.println("pstmt : " + pstmt);
			
			//String썼다가 Date로 고침
			//오라클 데이터베이스 테이블 순서와 자바 이클립스 preparedstatement ?의 순서가 일치해야한다
			//corpName 회사명을  디비에 등록된 것으로 써야 함 
			
			/*VALUES('20207015-06','2020-07-21','2020-09-18','2020-07-21',3,400000,'Y',111,
                    (SELECT COMPANY
                       FROM USER_INFO
                      WHERE USER_NO = 111),1200000,SEQ_CONNO.NEXTVAL);*/
			
			
			pstmt.setString(1, contract.getBusinessNo());
			pstmt.setString(2, contract.getStartDate());
			pstmt.setString(3, contract.getEndDate());
			pstmt.setString(4, contract.getConDate());
			pstmt.setInt(5, contract.getDelivCount());
			pstmt.setInt(6, contract.getAmountPDeliv());
			pstmt.setInt(7, contract.getUserNo());
			pstmt.setInt(8, contract.getUserNo());
			pstmt.setInt(9, contract.getTtlAmount());
			
			result = pstmt.executeUpdate();
			
		
			
			/*private String conCode;    //계약코드
			private String startDate;    //계약시작일
			private String endDate;      //계약종료일 
			private String conDate;      //계약일
			private int delivCount;    //월배송횟수
			private int amountPDeliv;  //회차당 금액
			private String denYN;      //계약종료여부YN. 체크 제약조건
			private int userNo;        //회원번호. foriegn key
			private String corpName;   //거래처명 
			private int ttlAmount;     //월 계약금액
			private int conNo;*/
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		System.out.println("insert dao result : " +  result);
		
		return result;
	}

	
	//페이징 처리 하기 전 게시물 목록 조회용 메소드
	//아직 넘길 값 없어서 statement로 씀?
	public ArrayList<Contract> selectList(Connection con) {
//		System.out.println(con);
		
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Contract> list = null;
		
		String query = prop.getProperty("selectList");
		
//		System.out.println(query);
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Contract>();
			
//			System.out.println("dd");
			while(rset.next()) {
				
//				System.out.println("넹");
				Contract c = new Contract();
				
				/////////진행중ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
				c.setConCode(rset.getString("CONTRACT_CODE"));
				c.setCorpName(rset.getString("CORP_NAME"));
				c.setConDate(rset.getString("CONTRACT_DATE"));
				c.setStartDate(rset.getString("START_DATE"));
				c.setEndDate(rset.getString("END_DATE"));
				c.setDelivCount(rset.getInt("DELIV_COUNT"));
				c.setAmountPDeliv(rset.getInt("AMOUNT_PER_DELIVE"));
				c.setTtlAmount(rset.getInt("TOTAL_AMOUNT"));
				
//				System.out.println("contract : " + c);
				
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
//		System.out.println("select dao list : " + list);
		
		return list;
	}

	
	//페이징 처리 할 때 목록갯수 조회
	public int getListCount(Connection con) {

		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return listCount;
	}
	
	
	
	
	
	
	
	
	

}
