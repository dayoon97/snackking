package com.kh.snackking.preference.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.snackking.preference.model.dao.PreferenceDao;
import com.kh.snackking.preference.model.vo.Preference;

public class PreferenceService {

	public int insertPreference(Preference insertPre) {
		Connection con = getConnection();
		
		int result = new PreferenceDao().insertPreference(con, insertPre);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	
	
}
