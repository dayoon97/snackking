package com.kh.snackking.user.model.service;


import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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



	public ArrayList<User> selectUserNameList(User user) {
		Connection con = getConnection();
		
		ArrayList<User> list = new UserDao().selectUserNameList(con, user);
		
		close(con);
		
		return list;
	}

	public String findUserId(User reqUser) {
		
		Connection con = getConnection();
		
		String userId = new UserDao().findUserId(con, reqUser);
		
		close(con);
		
		return userId;
	}

}
