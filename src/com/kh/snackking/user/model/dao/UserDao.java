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



	public ArrayList<User> selectUserNameList(String memberName, int nno, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("selectUserNameList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			pstmt.setString(2, memberName);
			
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
				
				System.out.println("UserNameList : " + list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public String findUserId(Connection con, User reqUser) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userId = null;
		
		String query = prop.getProperty("findUserId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqUser.getUserName());
			pstmt.setString(2, reqUser.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userId = rset.getString("USER_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("find userId userDao : " + userId);
		return userId;
	}

	public ArrayList<User> selectUserList(Connection con, int nno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("selectUserList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			
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
				
				System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(rset);
		}
	
		
		
		return list;
	}
	public User findUserPwd(Connection con, User reqUser) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User responseUser = null;
		
		String query = prop.getProperty("findUserPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqUser.getUserId());
			pstmt.setString(2, reqUser.getUserName());
			pstmt.setString(3, reqUser.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				responseUser = new User();
				responseUser.setUserNo(rset.getInt("USER_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return responseUser;
	}

	public int changePwd(Connection con, User reqUser, User responseUser) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changePwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqUser.getUserPwd());
			pstmt.setInt(2, responseUser.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Boolean updatePwdCheck(Connection con, User reqUser) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		
		String query = prop.getProperty("updatePwdCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqUser.getUserNo());
			pstmt.setString(2, reqUser.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public int updateUserInfo(Connection con, User reqUser) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateUserInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqUser.getUserPwd());
			pstmt.setString(2, reqUser.getUserName());
			pstmt.setString(3, reqUser.getCompany());
			pstmt.setString(4, reqUser.getPhone());
			pstmt.setString(5, reqUser.getEmail());
			pstmt.setInt(6, reqUser.getZipNo());
			pstmt.setString(7, reqUser.getAddress());
			pstmt.setInt(8, reqUser.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public User loginCheck(Connection con, int userNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User responseUser = null;
		
		String query = prop.getProperty("updateLoginCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				responseUser = new User();
				responseUser.setUserNo(rset.getInt("USER_NO"));
				responseUser.settCode(rset.getString("TCODE"));
				responseUser.setUserId(rset.getString("USER_ID"));
				responseUser.setUserPwd(rset.getString("USER_PWD"));
				responseUser.setUserName(rset.getString("USER_NAME"));
				responseUser.setCompany(rset.getString("COMPANY"));
				responseUser.setPhone(rset.getString("PHONE"));
				responseUser.setEmail(rset.getString("EMAIL"));
				responseUser.setZipNo(rset.getInt("ZIPNO"));
				responseUser.setAddress(rset.getString("ADDRESS"));
				responseUser.setMngId(rset.getInt("MANAGER"));
				responseUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				responseUser.setWithdrawalDate(rset.getDate("WITHDRAWAL_DATE"));
				responseUser.setStatus(rset.getString("STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return responseUser;
		
	}
	
}
