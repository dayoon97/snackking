package com.kh.snackking.preference.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	public Preference UpdatePreference(Preference updatePre) {
		Connection con = getConnection();
		int  result = new PreferenceDao().UpdatePreference(con, updatePre);
		Preference Pre = null;
		if(result > 0) {
			Pre = new PreferenceDao().selectOne(con, updatePre);
			if(Pre != null) {
				commit(con);
			}else {
				rollback(con);
				Pre = null;
			}
		}else {
			rollback(con);
			
		}
		
		close(con);
		return Pre;
	}

	public Preference selectOne(Preference userNo) {
		Connection con = getConnection();
		
		Preference Pre = new PreferenceDao().selectOne(con, userNo);
		
		System.out.println("Pre : " + Pre);
		if(Pre != null) {
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return Pre;
	}

	public ArrayList<Preference> selectPreference() {
		Connection con = getConnection();
		
		ArrayList<Preference> List = new PreferenceDao().selectPreference(con);
		System.out.println("srtvice List : " + List);
		if(List != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return List;
	}

	public Preference cmSelectOne(Preference pre) {
		Connection con = getConnection();
		
		Preference P = new PreferenceDao().cmSelectOne(con, pre);
		
		System.out.println("Pre : " + P);
		if(P != null) {
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return P;
	}
}
