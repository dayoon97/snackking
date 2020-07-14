package com.kh.snackking.user.model.dao;

import static com.kh.snackking.common.JDBCTemplate.*;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
		} finally {
			close(pstmt);
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

	public int idCheck(Connection con, String userId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;						// 오라클 오류
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = -1;				// 아이디 중복
			} else {
				result = 1;					// 아이디 중복 X
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

//	public ArrayList<User> selectUserList(Connection con, User user) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		ArrayList<User> list = null;
//		
//		String query = prop.getProperty("selectUserList");
//		
//		try {
//			pstmt = con.prepareStatement(query);
//			pstmt.setInt(1, user.getMngId());
//			
//			list = new ArrayList<User>();
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				User u = new User();
//				u.setUserNo(rset.getInt("USER_NO"));
//				u.setUserId(rset.getString("USER_ID"));
//				u.setCompany(rset.getString("COMPANY"));
//				u.setAddress(rset.getString("ADDRESS"));
//				u.setPhone(rset.getString("PHONE"));
//				u.setEnrollDate(rset.getDate("ENROLL_DATE"));
//				
//				list.add(user);
//				
//				System.out.println(list);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}  finally {
//			close(pstmt);
//			close(rset);
//		}
//		
//		
//		
//		return list;
//	}

	public ArrayList<User> selectUserNameList(Connection con, User user) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("selectUserNameList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user.getUserNo());
			pstmt.setString(2, user.getUserName());
			
			list = new ArrayList<User>();
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				User u = new User();
				u.setUserNo(rset.getInt("USER_NO"));
				u.setUserId(rset.getString("USER_ID"));
				u.setCompany(rset.getString("COMPANY"));
				u.setUserName(rset.getString("USER_NAME"));
				u.setAddress(rset.getString("ADDRESS"));
				u.setPhone(rset.getString("PHONE"));
				u.setEnrollDate(rset.getDate("ENROLL_DATE"));
				
				list.add(u);
				
				System.out.println("Dao list : " + list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}
