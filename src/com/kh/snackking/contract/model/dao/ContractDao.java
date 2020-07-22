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
			
		
			
			/*BUSINESS_NO			VARCHAR2(60 BYTE)	No		1	사업자등록번호
			START_DATE			VARCHAR2(30 BYTE)	No		2	계약시작일
			END_DATE			VARCHAR2(30 BYTE)	No		3	계약종료일
			CONTRACT_DATE		VARCHAR2(30 BYTE)	No		4	계약일
			DELIVERY_COUNT		NUMBER(20,0)	No		5		월배송횟수
			AMOUNT_PER_DELIVERY	NUMBER(30,0)	No		6		회차당 금액
			END_YN				VARCHAR2(10 BYTE)	No	'Y' 	7	계약종료여부YN
			USER_NO				NUMBER(30,0)	No		8		회원번호
			CORP_NAME			VARCHAR2(60 BYTE)	No		9	거래처명
			TOTAL_AMOUNT		NUMBER(30,0)	No		10		월계약금액
			CONTRACT_NO			NUMBER(30,0)	No		11		계약번호 */
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		System.out.println("insert dao result : " +  result);
		
		return result;
	}

	
	//페이징 처리 하기 전 게시물 목록 조회용 메소드
	//아직 넘길 값 없어서 Statement. 값이 바뀔 수 있는게 아니고 정해진 값만 구할 때 Statement 쓴다.
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
				
				c.setBusinessNo(rset.getString("BUSINESS_NO"));
				c.setStartDate(rset.getString("START_DATE"));
				c.setEndDate(rset.getString("END_DATE"));
				c.setConDate(rset.getString("CONTRACT_DATE"));
				c.setDelivCount(rset.getInt("DELIVERY_COUNT"));
				c.setAmountPDeliv(rset.getInt("AMOUNT_PER_DELIVERY"));
				c.setEndYN(rset.getString("END_YN"));
				c.setUserNo(rset.getInt("USER_NO"));
				c.setCorpName(rset.getString("CORP_NAME"));
				c.setTtlAmount(rset.getInt("TOTAL_AMOUNT"));
				c.setConNo(rset.getInt("CONTRACT_NO"));
				
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

	
	//계약내역 조회(select)에서 종료된 계약내역 확인 버튼 클릭시 리스트  
	public ArrayList<Contract> endContractList(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Contract> list = null;
		
		String query = prop.getProperty("endContractList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Contract>();
			
			while(rset.next()) {
				
				Contract c = new Contract();
				
				c.setBusinessNo(rset.getString("BUSINESS_NO"));
				c.setStartDate(rset.getString("START_DATE"));
				c.setEndDate(rset.getString("END_DATE"));
				c.setConDate(rset.getString("CONTRACT_DATE"));
				c.setDelivCount(rset.getInt("DELIVERY_COUNT"));
				c.setAmountPDeliv(rset.getInt("AMOUNT_PER_DELIVERY"));
				c.setEndYN(rset.getString("END_YN"));
				c.setUserNo(rset.getInt("USER_NO"));
				c.setCorpName(rset.getString("CORP_NAME"));
				c.setTtlAmount(rset.getInt("TOTAL_AMOUNT"));
				c.setConNo(rset.getInt("CONTRACT_NO"));
				
//				System.out.println("contract : " + c);
				
				list.add(c);
				
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}
	

}
