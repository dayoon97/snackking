package com.kh.snackking.adjustment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static com.kh.snackking.common.JDBCTemplate.*;
import com.kh.snackking.adjustment.model.vo.Adjustment;


public class AdjustmentDao {
	private Properties prop = new Properties();
	
	public AdjustmentDao() {
		String fileName = Adjustment.class.getResource("/sql/adjustment/adjustment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, Object>> adjustmentSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		
		String query = prop.getProperty("adjustmentSelect");
		
		try {
			stmt = con.createStatement();
			
			list = new ArrayList<>();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				hmap = new HashMap<>();
				hmap.put("company", rset.getString("COMPANY"));
				hmap.put("adJustmentAmount", rset.getInt("ADJUSTMENT_AMOUNT"));
				hmap.put("adJustmentComplete", rset.getString("ADJUSTMENT_COMPLETE"));
				
				
				list.add(hmap);
				
				System.out.println(list);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	public int adjustmentComplete(Connection con, String company) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adjustmentComplete");
		
		System.out.println("query : " + query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, company);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("dao result : " + result);
		
		return result;
	}
}
