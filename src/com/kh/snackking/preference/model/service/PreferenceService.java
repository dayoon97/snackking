package com.kh.snackking.preference.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.preference.model.dao.PreferenceDao;
import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.preference.model.vo.curatingList;

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

	public ArrayList<Preference> selectPreference(int pno) {
		Connection con = getConnection();
		
		ArrayList<Preference> List = new PreferenceDao().selectPreference(con, pno);
		System.out.println("srtvice List : " + List);
		if(List != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return List;
	}

	public Preference cmSelectOne(int pre) {
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

	public ArrayList<Preference> DelicatePreference(int pno) {
		Connection con = getConnection();
		ArrayList<Preference> pre = null;
		int result = new PreferenceDao().delicatePreference(con, pno);
		
		if(result > 0) {
			 pre = new PreferenceDao().selectPreference2(con, pno);
			 if(pre != null) {
				 commit(con);
				 
			 }else {
				 rollback(con);
				 pre = null;
				 
			 }
		}else {
			rollback(con);
		}
		
		return pre;
	}

	public Preference selectCurating(int num) {
		Connection con = getConnection();
		
		Preference p = new PreferenceDao().cmSelectOne(con, num);
		
		if(p != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return p;
	}

	public ArrayList<curatingList> curatingSelect() {
		Connection con = getConnection();
		
		ArrayList<curatingList> list = new PreferenceDao().curatingSelect(con);
		
		if(list != null) {
			
		}else {
			
		}
		close(con);
		return list;
	}

	public int CuartingStatus(int preNo) {
		Connection con = getConnection();
		
		int result = new PreferenceDao().CuratingStatus(con, preNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int PreCuSratus(int cuNo) {
		Connection con = getConnection();
		
		int result = new PreferenceDao().PreCuSratus(con, cuNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Preference UpdateCuratingSelect(int cuNo) {
		Connection con = getConnection();
		
		Preference pre = new PreferenceDao().UpdateCuratingSelect(con, cuNo);
		
		close(con);
		
		return pre;
	}
}
