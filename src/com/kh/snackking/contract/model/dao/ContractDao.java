package com.kh.snackking.contract.model.dao;

import static com.kh.snackking.common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
		
		
		
		
		
		return 0;
	}

}
