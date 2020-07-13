package com.kh.snackking.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.snackking.user.model.vo.User;

public class UserDao {
	
	private Properties prop = new Properties();
	
	public UserDao() {
		String fileName = User.class.getResource("/sql/user/user-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertUser(Connection con, User reqUser) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqUser.getUserId());
			pstmt.setString(2, reqUser.getUserPwd());
			pstmt.setString(3, reqUser.getUserName());
			pstmt.setString(4, reqUser.getCompany());
			pstmt.setString(5, reqUser.getPhone());
			pstmt.setString(6, reqUser.getEmail());
			pstmt.setInt(7, reqUser.getZipNo());
			pstmt.setString(8, reqUser.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("inserUser dao : " + result);
		return result;
	}

}
