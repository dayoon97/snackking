package com.kh.snackking.user.model.dao;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.adjustment.model.vo.Adjustment;
import com.kh.snackking.equipment.model.vo.EquipmentRent;
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
				loginUser.settName(rset.getString("TNAME"));
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



	public ArrayList<User> selectUserNameList(User user, int nno, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		ArrayList<User> list = null;
		String query = "";
		if(user.getUserName() == "") {count += 1;}
		if(user.getCompany() == "") {count += 1;}
		if(user.getUserId() == "") {count += 1;}
		if(user.getPhone() == "") {count += 1;}
		
		if(count == 4) {
			query = "SELECT USER_NO , USER_ID , COMPANY , USER_NAME , ADDRESS , PHONE , ENROLL_DATE FROM USER_INFO WHERE MANAGER = ?";
		}else {
			query = "SELECT USER_NO , USER_ID , COMPANY , USER_NAME , ADDRESS , PHONE , ENROLL_DATE FROM USER_INFO WHERE MANAGER = ? AND ";
		
			
			if(user.getUserName() != "") {
				//날짜를 그냥 where 조건문에 넣었더니 계속 조회가 안됨
				//날짜 YY/MM/DD 형식으로 바꾸기
				
				query += "USER_NAME LIKE '%'||'" + user.getUserName() + "'||'%' AND ";}
			
			if(user.getCompany() != "") { query += "COMPANY LIKE '%'||'" + user.getCompany() + "'||'%' AND ";}
			if(user.getUserId() != "") { query += "USER_ID LIKE '%'||'" + user.getUserId() + "'||'%' AND ";}
			if(user.getPhone() != null) { query += "PHONE LIKE '%'||'" + user.getPhone() + "'||'%' AND ";}

			if(query.substring(query.length()-5).equals(" AND ")) {
				query = query.substring(0, query.length()-5);
				//query += ";";
			}
			//query += "STATUS = 'Y'";
		}
		//쿼리문 실행
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<User>();
			
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
				
				System.out.println("회원  검색:" + list);
			}	
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		close(pstmt);
		close(rset);
		}
		//System.out.println("DAO: " + list);
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
	

	public ArrayList<User> adminUserList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("adminUserList");
		
		try {
			stmt = con.createStatement();
			
			list = new ArrayList<User>();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				User u = new User();
				u.setUserNo(rset.getInt("USER_NO"));
				u.setUserId(rset.getString("USER_ID"));
				u.setCompany(rset.getString("COMPANY"));
				u.setUserName(rset.getString("USER_NAME"));
				u.setAddress(rset.getString("ADDRESS"));
				u.setPhone(rset.getString("PHONE"));
				u.setEnrollDate(rset.getDate("ENROLL_DATE"));
				u.settCode(rset.getString("TCODE"));
				
				//add는 어레이리스트일 때 쓴다
				list.add(u);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<User> adminEmployeeSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("adminEmployeeList");
		
		try {
			stmt = con.createStatement();
			
			list = new ArrayList<User>();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				User u = new User();
				u.setUserNo(rset.getInt("USER_NO"));
				u.settCode(rset.getString("TCODE"));
				u.setUserName(rset.getString("USER_NAME"));
				u.setAddress(rset.getString("ADDRESS"));
				u.setPhone(rset.getString("PHONE"));
				u.setEnrollDate(rset.getDate("ENROLL_DATE"));
				u.setStatus(rset.getString("STATUS"));
				
				list.add(u);

				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public int changeEmployeeTcode(Connection con, int userNo, String tcode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateEmployeeTcode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tcode);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteUser(Connection con, int userNo, String tcode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteUser");
		
		
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<User> searchUserList(User user, Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		ArrayList<User> list = null;
		String query = "";
		if(user.getUserName() == "") {count += 1;}
		if(user.getCompany() == "") {count += 1;}
		if(user.getUserId() == "") {count += 1;}
		if(user.getPhone() == "") {count += 1;}
		if(user.gettCode() == "") {count += 1;}
		
		System.out.println(user.gettCode());
		
		if(count == 5) {
			query = "SELECT USER_NO , USER_ID , COMPANY , USER_NAME , ADDRESS , PHONE , ENROLL_DATE, TCODE FROM USER_INFO WHERE TCODE IN ('T1', 'T2')";
		}else {
			query = "SELECT USER_NO , USER_ID , COMPANY , USER_NAME , ADDRESS , PHONE , ENROLL_DATE, TCODE FROM USER_INFO WHERE TCODE IN ('T1', 'T2') AND ";
		
			
			if(user.getUserName() != "") {
				query += "USER_NAME LIKE '%'||'" + user.getUserName() + "'||'%' AND ";}
			
			if(user.getCompany() != "") { query += "COMPANY LIKE '%'||'" + user.getCompany() + "'||'%' AND ";}
			if(user.getUserId() != "") { query += "USER_ID LIKE '%'||'" + user.getUserId() + "'||'%' AND ";}
			if(user.getPhone() != "") { query += "PHONE LIKE '%'||'" + user.getPhone() + "'||'%' AND ";}
			if(user.gettCode() != "") { query += "TCODE = '" + user.gettCode() + "' ";}

			if(query.substring(query.length()-6).equals(" AND ")) {
				query = query.substring(0, query.length()-6);
				//query += ";";
			}
			//query += "STATUS = 'Y'";
		}
		//쿼리문 실행
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<User>();
			
			while(rset.next()) {
				User u = new User();
				u.setUserNo(rset.getInt("USER_NO"));
				u.setUserId(rset.getString("USER_ID"));
				u.setCompany(rset.getString("COMPANY"));
				u.setUserName(rset.getString("USER_NAME"));
				u.setAddress(rset.getString("ADDRESS"));
				u.setPhone(rset.getString("PHONE"));
				u.setEnrollDate(rset.getDate("ENROLL_DATE"));
				u.settCode(rset.getString("TCODE"));
				
				list.add(u);
				
				System.out.println("회원  검색:" + list);
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		System.out.println("DAO: " + list);
		
		return list;
	}

	public ArrayList<User> searchEmpSearch(User user, Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		ArrayList<User> list = null;
		String query = "";
		if(user.getUserName() == null) {count += 1;}
		if(user.gettCode() == null) {count += 1;}
		if(user.getUserNo() == 0) {count += 1;}
		if(user.getStatus() == null) {count += 1;}
		
		System.out.println(user.getUserName());
		System.out.println(user.gettCode());
		System.out.println(user.getUserNo());
		System.out.println(user.getStatus());
		
		
		if(count == 4) {
			query = "SELECT USER_NO , TCODE , USER_NAME , ADDRESS, PHONE, ENROLL_DATE, STATUS FROM USER_INFO WHERE TCODE IN('T4', 'T5') ";
		}else {
			query = "SELECT USER_NO , TCODE , USER_NAME , ADDRESS, PHONE, ENROLL_DATE, STATUS FROM USER_INFO WHERE TCODE IN('T4', 'T5') AND ";
		
			
			if(user.getUserName() != null) {query += "USER_NAME LIKE '%'||'" + user.getUserName() + "'||'%' AND ";}
			if(user.gettCode() != null) { query += "TCODE = '" + user.gettCode() + "' AND ";}
			if(user.getUserNo() != 0) { query += "USER_NO = " + user.getUserNo() + " AND ";}
			if(user.getStatus() != null) { query += "STATUS = '" + user.getStatus() + "' AND ";}

			if(query.substring(query.length()-5).equals(" AND ")) {
				query = query.substring(0, query.length()-5);
				//query += ";";
			}
			//query += "STATUS = 'Y'";
		}
		//쿼리문 실행
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<User>();
			
			while(rset.next()) {
				User u = new User();
				u.setUserNo(rset.getInt("USER_NO"));
				u.settCode(rset.getString("TCODE"));
				u.setUserName(rset.getString("USER_NAME"));
				u.setAddress(rset.getString("ADDRESS"));
				u.setPhone(rset.getString("PHONE"));
				u.setEnrollDate(rset.getDate("ENROLL_DATE"));
				u.setStatus(rset.getString("STATUS"));
				
				list.add(u);
				
				System.out.println("검색 직원 리스트 : " + list);
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<User> searchCompany(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("searchCompany");
	
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				User u = new User();
				u.setCompany(rset.getString("COMPANY"));
				
				list.add(u);
			}
			System.out.println("회사 드롭박스 리스트 : " + list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<User> matchingSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("matchingSelect");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<User> ();
			while(rset.next()) {
				User u = new User();
				u.setManager(rset.getString("EMP_NAME"));
				u.setUserName(rset.getString("USER_NAME"));
				u.setCompany(rset.getString("COMPANY"));
				u.setPhone(rset.getString("PHONE"));
				u.setAddress(rset.getString("ADDRESS"));
				
				list.add(u);
				
			}
			System.out.println("매칭 리스트 : " + list);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList<User> matchingEmpSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("matchingEmpSelect");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<User> ();
			while(rset.next()) {
				User u = new User();
				u.setUserName(rset.getString("USER_NAME"));
			
				list.add(u);
				
			}
			System.out.println("직원 리스트 : " + list);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList<User> matchingUserSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("matchingUserSelect");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<User> ();
			while(rset.next()) {
				User u = new User();
				u.setUserName(rset.getString("USER_NAME"));
			
				list.add(u);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	public int updateMatching(Connection con, String uName, String emName) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMatching");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, emName);
			pstmt.setString(2, uName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<User> matchingSearch(Connection con, User user) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		ArrayList<User> list = null;
		String query = "";
		if(user.getUserName() == "") {count += 1;}
		if(user.getCompany() == "") {count += 1;}
		if(user.getPhone() == "") {count += 1;}
		
		if(count == 3) {
			query = "SELECT U2.USER_NAME AS EMP_NAME, U1.USER_NAME, U1.COMPANY, U1.PHONE, U1.ADDRESS FROM USER_INFO U1, USER_INFO U2 WHERE U1.MANAGER = U2.USER_NO ";
		}else {
			query = "SELECT U2.USER_NAME AS EMP_NAME, U1.USER_NAME, U1.COMPANY, U1.PHONE, U1.ADDRESS FROM USER_INFO U1, USER_INFO U2 WHERE U1.MANAGER = U2.USER_NO AND ";
		
			
			if(user.getUserName() != "") {
				//날짜를 그냥 where 조건문에 넣었더니 계속 조회가 안됨
				//날짜 YY/MM/DD 형식으로 바꾸기
				
				query += "U2.USER_NAME LIKE '%'||'" + user.getUserName() + "'||'%' AND ";}
			
			if(user.getCompany() != "") { query += "U1.COMPANY LIKE '%'||'" + user.getCompany() + "'||'%' AND ";}
			if(user.getPhone() != "") { query += "U1.PHONE LIKE '%'||'" + user.getPhone() + "'||'%' AND ";}

			if(query.substring(query.length()-5).equals(" AND ")) {
				query = query.substring(0, query.length()-5);
				//query += ";";
			}
			//query += "STATUS = 'Y'";
		}
		//쿼리문 실행
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<User>();
			
			while(rset.next()) {
				User u = new User();
				u.setManager(rset.getString("EMP_NAME"));
				u.setUserName(rset.getString("USER_NAME"));
				u.setCompany(rset.getString("COMPANY"));
				u.setPhone(rset.getString("PHONE"));
				u.setAddress(rset.getString("ADDRESS"));
				
				list.add(u);
				
				System.out.println("회원  검색:" + list);
			}	
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		close(stmt);
		close(rset);
		}
		//System.out.println("DAO: " + list);
		return list;
		
		
	}

	public ArrayList<User> matchingSearch(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("SelectNewUser");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<User>();
			
			while(rset.next()) {
				User u = new User();
				u.setUserName(rset.getString("USER_NAME"));
				u.setEnrollDate(rset.getDate("ENROLL_DATE"));
				
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}



}
