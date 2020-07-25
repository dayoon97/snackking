package com.kh.snackking.curating.model.dao;

import static com.kh.snackking.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.curating.model.vo.CurationList;
import com.kh.snackking.curating.model.vo.CurationProduct;
import com.kh.snackking.curating.model.vo.curating;

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
		System.out.println("selectCuratingProduct dao num : " + num);
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
		System.out.println("selectCuratingProduct dao list : " + list);
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
	
	
	public int insertCuratingList(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCurating");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public curating SelectCuratingListOne(Connection con, int num) {
		Statement stmt = null;
		ResultSet rset = null;
		curating cu = null;
		
		String query = prop.getProperty("SelectCuratingListOne");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				cu = new curating();
				cu.setCuNo(rset.getInt("CU_LIST_NO"));
				cu.setPreNo(rset.getInt("PRE_NO"));
				cu.setCuPrice(rset.getInt("PRICE"));
				cu.setProCount(rset.getInt("AMOUNT"));
				cu.setUserYN(rset.getString("STATUS"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return cu;
	}

	public int UpdateCuratingList(Connection con, int cuNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("CuratingUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cuNo);
			pstmt.setInt(2, cuNo);
			pstmt.setInt(3, cuNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int changeCuratingStatus(Connection con, int listNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeCuratingSutatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, listNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public curating UpdateCuratingSelect(Connection con,int cuNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		curating cu = null;
		String query = prop.getProperty("UpdateCuratingSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cuNo);
			
			if(rset.next()) {
				cu = new curating();
				cu.setCuNo(rset.getInt("CU_LIST_NO"));
				cu.setPreNo(rset.getInt("PRE_NO"));
				cu.setCuPrice(rset.getInt("PRICE"));
				cu.setProCount(rset.getInt("AMOUNT"));
				cu.setUserYN(rset.getString("STATUS"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
			
		}
		
		
		return cu;
	}
	
	
}



































