package com.kh.snackking.preference.model.dao;

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

import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.preference.model.vo.curatingList;

import static com.kh.snackking.common.JDBCTemplate.*;

public class PreferenceDao {
	private Properties prop = new Properties();
	
	public PreferenceDao() {
		String fileName = Preference.class.getResource("/sql/preference/preference-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertPreference(Connection con, Preference insertPre) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPreference");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, insertPre.getUserNo());
			pstmt.setInt(2, insertPre.getPreBudget());
			pstmt.setInt(3, insertPre.getPrePersonnel());
			pstmt.setString(4, insertPre.getPreAge());
			pstmt.setString(5, insertPre.getPreProductTypes());
			pstmt.setString(6, insertPre.getPreTaste());
			pstmt.setString(7, insertPre.getPreFlavor());
			pstmt.setString(8, insertPre.getPreEtcFlavor());
			pstmt.setString(9, insertPre.getPreAlName());
			pstmt.setString(10, insertPre.getPreStyle());
			pstmt.setString(11, insertPre.getPreEquipment());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int UpdatePreference(Connection con, Preference updatePre) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UpdatePreference");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, updatePre.getPreBudget());
			pstmt.setInt(2, updatePre.getPrePersonnel());
			pstmt.setString(3, updatePre.getPreAge());
			pstmt.setString(4, updatePre.getPreProductTypes());
			pstmt.setString(5, updatePre.getPreTaste());
			pstmt.setString(6, updatePre.getPreFlavor());
			pstmt.setString(7, updatePre.getPreEtcFlavor());
			pstmt.setString(8, updatePre.getPreAlName());
			pstmt.setString(9, updatePre.getPreStyle());
			pstmt.setString(10,  updatePre.getPreEquipment());
			pstmt.setInt(11, updatePre.getUserNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("update result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Preference selectOne(Connection con, Preference updatePre) {
		PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 Preference p = null;
		 
		 String query = prop.getProperty("selectOne");
		 
		 try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, updatePre.getUserNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 p = new Preference();
				
				p.setUserNo(rset.getInt("USER_NO"));
				p.setPreNo(rset.getInt("PRE_NO"));
				p.setPreBudget(rset.getInt("PRE_BUDGET"));
				p.setPrePersonnel(rset.getInt("PRE_PERSONNEL"));
				p.setPreAge(rset.getString("PRE_AGE"));
				p.setPreProductTypes(rset.getString("PRE_PROTYPES"));
				p.setPreTaste(rset.getString("PRE_TASTE"));
				p.setPreFlavor(rset.getString("PRE_FLAVOR"));
				p.setPreEtcFlavor(rset.getString("PRE_ETCFLAVOR"));
				p.setPreAlName(rset.getString("PRE_ALNAME"));
				p.setPreStyle(rset.getString("PRE_STYLE"));
				p.setPreEquipment(rset.getString("PRE_EQUIPMENT"));
				p.setPreDate(rset.getString("PRE_DATE"));
				p.setStatus(rset.getString("PRE_STATUS"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	public ArrayList<Preference> selectPreference(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Preference> List = null;
		
		String query = prop.getProperty("selectPreference");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			List = new ArrayList<Preference>();
			while(rset.next()) {
				Preference p = new Preference();
				
				p.setUserNo(rset.getInt("USER_NO"));
				p.setUserName(rset.getString("USER_NAME"));
				p.setUserCom(rset.getString("COMPANY"));
				p.setPreNo(rset.getInt("PRE_NO"));
				p.setPreBudget(rset.getInt("PRE_BUDGET"));
				p.setPrePersonnel(rset.getInt("PRE_PERSONNEL"));
				p.setPreAge(rset.getString("PRE_AGE"));
				p.setPreProductTypes(rset.getString("PRE_PROTYPES"));
				p.setPreTaste(rset.getString("PRE_TASTE"));
				p.setPreFlavor(rset.getString("PRE_FLAVOR"));
				p.setPreEtcFlavor(rset.getString("PRE_ETCFLAVOR"));
				p.setPreAlName(rset.getString("PRE_ALNAME"));
				p.setPreStyle(rset.getString("PRE_STYLE"));
				p.setPreEquipment(rset.getString("PRE_EQUIPMENT"));
				p.setPreDate(rset.getString("PRE_DATE"));
				p.setStatus(rset.getString("PRE_STATUS"));
				p.setCuraStatus(rset.getString("PRE_CURATING"));
				
				List.add(p);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return List;
	}

	public Preference cmSelectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 Preference p = null;
		 
		 String query = prop.getProperty("cmSelectOne");
		 
		 try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 p = new Preference();
				
				p.setUserNo(rset.getInt("USER_NO"));
				p.setPreNo(rset.getInt("PRE_NO"));
				p.setPreBudget(rset.getInt("PRE_BUDGET"));
				p.setPrePersonnel(rset.getInt("PRE_PERSONNEL"));
				p.setPreAge(rset.getString("PRE_AGE"));
				p.setPreProductTypes(rset.getString("PRE_PROTYPES"));
				p.setPreTaste(rset.getString("PRE_TASTE"));
				p.setPreFlavor(rset.getString("PRE_FLAVOR"));
				p.setPreEtcFlavor(rset.getString("PRE_ETCFLAVOR"));
				p.setPreAlName(rset.getString("PRE_ALNAME"));
				p.setPreStyle(rset.getString("PRE_STYLE"));
				p.setPreEquipment(rset.getString("PRE_EQUIPMENT"));
				p.setPreDate(rset.getString("PRE_DATE"));
				p.setStatus(rset.getString("PRE_STATUS"));
				p.setCuraStatus(rset.getString("PRE_CURATING"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	public int delicatePreference(Connection con, int pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("delicatePreference");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public ArrayList<curatingList> curatingSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<curatingList> list = null;
		String query = prop.getProperty("curatingSelect");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<curatingList>();
			while(rset.next()) {
				curatingList cu = new curatingList();
				cu.setPreNo(rset.getInt("PRE_NO"));
				cu.setUserCom(rset.getString("COMPANY"));
				cu.setStatus(rset.getString("PRE_CURATING"));
				cu.setUserName(rset.getString("USER_NAME"));
				
				list.add(cu);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public int CuratingStatus(Connection con, int preNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("CuratingStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, preNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		
		return result;
	}

	public int PreCuSratus(Connection con, int cuNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("PreCuStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cuNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}




}
