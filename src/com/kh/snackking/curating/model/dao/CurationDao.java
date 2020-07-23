package com.kh.snackking.curating.model.dao;

import static com.kh.snackking.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.curating.model.vo.CurationList;
import com.kh.snackking.curating.model.vo.CurationProduct;

public class CurationDao {
	private Properties prop = new Properties();
	
	public CurationDao() {
		String fileName = Board.class.getResource("/sql/curation/curation-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<CurationList> selectUserCurationList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<CurationList> list = null;
		
		String query = prop.getProperty("selectUserCurationList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			System.out.println("dao pstmt check : " + pstmt);
			rset = pstmt.executeQuery();
			System.out.println("dao rset check : " + rset);
			list = new ArrayList<CurationList>();
			while(rset.next()) {
				CurationList cl = new CurationList();
				cl.setCuListNo(rset.getInt("CU_LIST_NO"));
				cl.setPreNo(rset.getInt("PRE_NO"));
				cl.setClDate(rset.getDate("CL_DATE"));
				cl.setPrice(rset.getInt("PRICE"));
				cl.setAmount(rset.getInt("AMOUNT"));
				cl.setStatus(rset.getString("STATUS"));
				cl.setUserNo(rset.getInt("USER_NO"));
				System.out.println("curating list : " + cl);
				list.add(cl);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("dao list check : " + list);
		return list;
	}

	public ArrayList<CurationProduct> selectCuratingProduct(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<CurationProduct> list = null;
		
		String query = prop.getProperty("selectCuratingProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<CurationProduct>();
			
			while(rset.next()) {
				CurationProduct c = new CurationProduct();
				c.setpName(rset.getString("PNAME"));
				c.setpCount(rset.getInt("PRO_COUNT"));
				c.setUnitCount(rset.getInt("UNIT_PRICE"));
				c.setPrice(rset.getInt("PRICE"));
				
				list.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int curatingProductPrice(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("curatingProductPrice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
	
	
}



































