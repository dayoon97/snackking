package com.kh.snackking.user.model.service;


import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.adjustment.model.vo.Adjustment;
import com.kh.snackking.user.model.dao.UserDao;
import com.kh.snackking.user.model.vo.User;

public class UserService {

	public int insertUser(User reqUser) {
		
		Connection con = getConnection();
		
		int result = new UserDao().insertUser(con, reqUser);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		System.out.println("insertUser service : " + result);
		return result;
	}

	public User loginCheck(User requestMember) {
		Connection con = getConnection();
		UserDao md = new UserDao();
		User loginUser = md.loginCheck(con, requestMember);
		close(con);
		return loginUser;
	}
	
	public int idCheck(String userId) {
		
		Connection con = getConnection();
		
		int result = new UserDao().idCheck(con, userId);
		
		close(con);
		
		return result;
	}



	public ArrayList<User> selectUserNameList(User user, int nno) {
		Connection con = getConnection();
		
		ArrayList<User> list = new UserDao().selectUserNameList(user, nno, con);
		
		System.out.println(user);
		System.out.println(nno);
		
		close(con);
		
		return list;
	}

	public String findUserId(User reqUser) {
		
		Connection con = getConnection();
		
		String userId = new UserDao().findUserId(con, reqUser);
		
		close(con);
		
		return userId;
	}
	
	public ArrayList<User> selectUserList(int nno) {
		
		Connection con = getConnection();
		
		ArrayList<User> list = new UserDao().selectUserList(con, nno);
		
		return list;
	}
	
	public int findUserPwd(User reqUser) {
		
		Connection con = getConnection();
		int result = 0;
		
		User responseUser = new UserDao().findUserPwd(con, reqUser);
		
		if(responseUser != null) {
			result = new UserDao().changePwd(con, reqUser, responseUser);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
				// 안해도 될 거 같은데 혹시 몰라서 써놓는다.
				responseUser = null;
			}
			
		}
		
		close(con);
		
		return result;
	}

	public boolean updatePwdCheck(User reqUser) {
		
		Connection con = getConnection();
		boolean result = false;
		
		result = new UserDao().updatePwdCheck(con, reqUser);
		
		close(con);
		
		return result;
	}

	public User updateUserInfo(User reqUser) {
		
		Connection con = getConnection();
		User responseUser = null;
		
		int result = new UserDao().updateUserInfo(con, reqUser);
		
		if(result > 0) {
			commit(con);
			responseUser = new UserDao().loginCheck(con, reqUser.getUserNo());
		} else {
			rollback(con);
		}
		
		return responseUser;
	}
	

	public ArrayList<User> adminUserList() {
		Connection con = getConnection();
		
		ArrayList<User> list = new UserDao().adminUserList(con);
		
		return list;
		
	}

	public ArrayList<User> adminEmployeeSelect() {
		Connection con = getConnection();
		
		ArrayList<User> list = new UserDao().adminEmployeeSelect(con);
		
		return list;
	}

	public ArrayList<User> changeEmployeeTcode(int userNo, String tcode) {
		Connection con = getConnection();
		User responseUser = null;
		
		int result = new UserDao().changeEmployeeTcode(con,userNo,tcode);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		
		ArrayList<User> list = new UserDao().adminEmployeeSelect(con);
		
		
		return list;
	}

	public int deleteUserSelect(int userNo) {
		Connection con = getConnection();
		int result = 0;
		
		result = new UserDao().deleteUser(con, userNo);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<User> searchUserList(User user) {
		Connection con = getConnection();
		
		ArrayList<User> list = new UserDao().searchUserList(user, con);
		
		close(con);
		
		return list;
	}

	public ArrayList<User> selectEmpSearch(User user) {
		Connection con = getConnection();
		
		ArrayList<User> list = new UserDao().searchEmpSearch(user, con);
		
		close(con);
		
		return list;
	}

}
