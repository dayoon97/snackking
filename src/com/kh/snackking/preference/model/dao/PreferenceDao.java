package com.kh.snackking.preference.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.snackking.preference.model.vo.Preference;
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
		 Preference Pre = null;
		 
		 String query = prop.getProperty("selectOne");
		 
		 try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, updatePre.getUserNo());
			pstmt.setInt(2, updatePre.getUserNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				Pre = new Preference();
				Pre.setUserNo(rset.getInt("USER_NO"));
				Pre.setPreNo(rset.getInt("PRE_NO"));
				Pre.setPreBudget(rset.getInt("PRE_BUDGET"));
				Pre.setPrePersonnel(rset.getInt("PRE_PERSONNEL"));
				Pre.setPreAge(rset.getString("PRE_AGE"));
				Pre.setPreProductTypes(rset.getString("PRE_PROTYPES"));
				Pre.setPreTaste(rset.getString("PRE_TASTE"));
				Pre.setPreFlavor(rset.getString("PRE_FLAVOR"));
				Pre.setPreEtcFlavor(rset.getString("PRE_ETCFLAVOR"));
				Pre.setPreAlName(rset.getString("PRE_ALNAME"));
				Pre.setPreStyle(rset.getString("PRE_STYLE"));
				Pre.setPreEquipment(rset.getString("PRE_EQUIPMENT"));
				Pre.setPreDate(rset.getString("PRE_DATE"));
				Pre.setStatus(rset.getString("PRE_STATUS"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return Pre;
	}



}
