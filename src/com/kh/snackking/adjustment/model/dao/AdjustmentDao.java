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
import com.kh.snackking.user.model.vo.User;


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
				hmap.put("adJustmentDate", rset.getDate("ADJUSTMENT_DATE"));
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

	public int adjustmentInsertDate(Connection con, String company) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adjustmentDate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, company);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> adjustmentSearch(Connection con, HashMap<String, String> hmap) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		ArrayList<HashMap<String, Object>> hList = null;
		HashMap<String, Object> map = null;
		
		String query = "";
		if(hmap.get("company") == "") {count += 1;}
		if(hmap.get("month") == "") {count += 1;}
		if(hmap.get("complete") == "") {count += 1;}
		
		if(count == 3) {
			query = "SELECT COMPANY , ADJUSTMENT_AMOUNT , ADJUSTMENT_DATE, ADJUSTMENT_COMPLETE FROM ADJUSTMENT A JOIN USER_INFO U ON(U.USER_NO = A.USER_NO) ";
		}else {
			query = "SELECT COMPANY , ADJUSTMENT_AMOUNT , ADJUSTMENT_DATE, ADJUSTMENT_COMPLETE FROM ADJUSTMENT A JOIN USER_INFO U ON(U.USER_NO = A.USER_NO) WHERE ";
		
			
			if(hmap.get("company") != "") {
				//날짜를 그냥 where 조건문에 넣었더니 계속 조회가 안됨
				//날짜 YY/MM/DD 형식으로 바꾸기
				
				query += "COMPANY LIKE '%'||'" + hmap.get("company") + "'||'%' AND ";}
			
			if(hmap.get("month") != "") { 
				String date = hmap.get("month").substring(2).replace("-", "/");
				query += "ADJUSTMENT_DATE LIKE '" + date + "'||'%' AND ";}
			
			if(hmap.get("complete") != "") { query += "ADJUSTMENT_COMPLETE = '" + hmap.get("complete") + "' AND ";}

			
			if(query.substring(query.length()-5).equals(" AND ")) {
				query = query.substring(0, query.length()-5);
				//query += ";";
			}
			//query += "STATUS = 'Y'";
			System.out.println(query);
		}
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			hList = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				map = new HashMap<String, Object>();
				map.put("company", rset.getString("COMPANY"));
				map.put("adJustmentAmount", rset.getInt("ADJUSTMENT_AMOUNT"));
				map.put("adJustmentDate", rset.getDate("ADJUSTMENT_DATE"));
				map.put("adJustmentComplete", rset.getString("ADJUSTMENT_COMPLETE"));
				
				hList.add(map);
				System.out.println(map);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return hList;
		
	}
}
