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
import com.kh.snackking.preference.model.vo.curatingList;

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
//			System.out.println("dao pstmt check : " + pstmt);
			rset = pstmt.executeQuery();
//			System.out.println("dao rset check : " + rset);
			list = new ArrayList<CurationList>();
			while(rset.next()) {
				CurationList cl = new CurationList();
				cl.setCuListNo(rset.getInt("CU_LIST_NO"));
				cl.setPreNo(rset.getInt("PRE_NO"));
				cl.setClDate(rset.getDate("CL_DATE"));
				cl.setPrice(rset.getInt("PRICE"));
				cl.setAmount(rset.getInt("AMOUNT"));
				if(rset.getString("STATUS").equals("N")) {
					cl.setStatus("미승인");
				} else {
					cl.setStatus("주문 진행");
				}
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
//		System.out.println("dao list check : " + list);
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
			
			rset = pstmt.executeQuery();
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

	public ArrayList<curatingList> CuratingListSearch(Connection con, curatingList cu) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<curatingList> cuList = null;
		Integer cuNo = cu.getCuNo();
		
		String query = "SELECT CU_LIST_NO, PRE_NO, USER_NAME, CL_DATE,PRICE , AMOUNT, STATUS"
				         + " , COMPANY "
				       + "FROM (SELECT CL.CU_LIST_NO, CL.PRE_NO, I.USER_NAME, CL.CL_DATE, PRICE "
				                  + ", CL.AMOUNT, CL.STATUS, I.COMPANY"
				              + " FROM CURATING_LIST CL "
				              + " JOIN USER_PRE PRE ON(CL.PRE_NO = PRE.PRE_NO) "
				              + " JOIN USER_INFO I ON (I.USER_NO = PRE.USER_NO) "
				             + " WHERE PRE.PRE_STATUS = 'Y' AND PRE.PRE_CURATING = 'Y')";
		if(cu.getPreNo() > 0 || cu.getUserCom() != null || cu.getUserName() != null || cu.getStatus() != null
				&& cu.getUserCom() != "" || cu.getUserName() != "" || cu.getStatus() != "") {
			int count = 0;
			if (cu.getPreNo() > 0 && count == 0) {
				query += "WHERE ";
				query += "PRE_NO = "+ cu.getPreNo() +" ";
				count++;
			}
			
			if(cu.getUserCom() != null && cu.getUserCom() != "" && count == 0) {
				query += "WHERE ";
				query += "COMPANY LIKE '%'||'"+ cu.getUserCom() + "'||'%' ";
				count++;
			}else if(cu.getUserCom() != null && cu.getUserCom() != "" && count > 0){
				query += "OR COMPANY LIKE '%'||'"+ cu.getUserCom() + "'||'%' ";
			}
			
			if(cu.getUserName() != null && cu.getUserName() != "" && count == 0) {
				query += "WHERE ";
				query += "USER_NAME LIKE '%'||'"+ cu.getUserName() +"'||'%' ";
				count++;
			}else if(cu.getUserName() != null && cu.getUserName() != "" && count > 0){
				query += "OR USER_NAME LIKE '%'||'"+ cu.getUserName() +"'||'%' ";
			}
			
			if(cu.getStatus() != null && cu.getStatus() != "" && count == 0) {
				query += "WHERE ";
				query += "STATUS = '" + cu.getStatus() + "'";
				count++;
			}else if(cu.getStatus() != null && cu.getStatus() != "" && count > 0){
				query += "OR STATUS = '" + cu.getStatus() + "'";
			}
		}
		System.out.println("QUERT : " + query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			cuList = new ArrayList<curatingList>();
			
			while(rset.next()) {
				curatingList c = new curatingList();
				c.setCuNo(rset.getInt("CU_LIST_NO"));
				c.setPreNo(rset.getInt("PRE_NO"));
				c.setUserCom(rset.getString("COMPANY"));
				c.setUserName(rset.getString("USER_NAME"));
				c.setStatus(rset.getString("STATUS"));
				
				cuList.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
			
		}
		return cuList;
	}
	
	
}






