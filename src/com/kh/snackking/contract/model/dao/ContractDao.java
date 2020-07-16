package com.kh.snackking.contract.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.snackking.contract.model.vo.Contract;

//여기서는 close 메소드 쓰기 위해서 JDBCTemplate 임포트했다.
import static com.kh.snackking.common.JDBCTemplate.*;


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
			
			pstmt.setString(1, contract.getCorpName());
			pstmt.setString(2, contract.getConCode());
			pstmt.setString(3, contract.getConDate());
			pstmt.setString(4, contract.getStartDate());
			pstmt.setString(5, contract.getEndDate());
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

}
