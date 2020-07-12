package com.kh.snackking.user.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;

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
		
		return result;
	}

}
