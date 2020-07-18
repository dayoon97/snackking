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

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertContract");
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			//String썼다가 Date로 고침
			pstmt.setString(1, contract.getCorpName());
			pstmt.setString(2, contract.getConCode());
			pstmt.setDate(3, contract.getConDate());
			pstmt.setDate(4, contract.getStartDate());
			pstmt.setDate(5, contract.getEndDate());
			pstmt.setInt(6, contract.getDelivCount());
			pstmt.setInt(7, contract.getAmountPDeliv());
			pstmt.setInt(8, contract.getTtlAmount());
			
			result = pstmt.executeUpdate();
			
			/* String corpName = request.getParameter("corpName");
			String conCode = request.getParameter("conCode");
			String conDate = request.getParameter("conDate");
			String startDate = request.getParameter("startDate"); 
			String endDate = request.getParameter("endDate");
			int delivCount = Integer.parseInt(request.getParameter("delivCount"));
			int amountPDeliv = Integer.parseInt(request.getParameter("amountPDeliv"));
			int ttlAmount = Integer.parseInt(request.getParameter("ttlAmout")); */
		
			
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
		
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Contract> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Contract>();
			
			while(rset.next()) {
				Contract c = new Contract();
				
				c.setConCode(rset.getString("CONTRACT_CODE"));
				c.setCorpName(rset.getString("CORP_NAME"));
				c.setConDate(rset.getDate("CONTRACT_DATE"));
				c.setStartDate(rset.getDate("START_DATE"));
				c.setEndDate(rset.getDate("END_DATE"));
				c.setDelivCount(rset.getInt("DELIV_COUNT"));
				c.setAmountPDeliv(rset.getInt("AMOUNT_PER_DELIVE"));
				c.setTtlAmount(rset.getInt("TOTAL_AMOUNT"));
				
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		System.out.println("dao list : " + list);
		
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
