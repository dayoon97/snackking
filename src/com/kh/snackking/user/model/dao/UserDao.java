package com.kh.snackking.user.model.dao;

import static com.kh.snackking.common.JDBCTemplate.*;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

	public User loginCheck(Connection con, User requestMember) {
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("DAO" + requestMember);
		String query = prop.getProperty("loginCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getUserId());
			pstmt.setString(2, requestMember.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new User();
				loginUser.setUserNo(rset.getInt("USER_NO"));
				loginUser.settCode(rset.getString("TCODE"));
				loginUser.setUserId(rset.getString("USER_ID"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setUserName(rset.getString("USER_NAME"));
				loginUser.setCompany(rset.getString("COMPANY"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setZipNo(rset.getInt("ZIPNO"));
				loginUser.setAddress(rset.getString("ADDRESS"));
				loginUser.setMngId(rset.getInt("MANAGER"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setWithdrawalDate(rset.getDate("WITHDRAWAL_DATE"));
				loginUser.setStatus(rset.getString("STATUS"));
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}

}
