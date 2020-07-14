package com.kh.snackking.preference.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

}
