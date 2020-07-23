package com.kh.snackking.adjustment.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.snackking.adjustment.model.dao.AdjustmentDao;
import com.kh.snackking.adjustment.model.vo.Adjustment;
import com.kh.snackking.user.model.vo.User;

public class AdjustmentService {

	public ArrayList<HashMap<String, Object>> adjustmentSelect() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new AdjustmentDao().adjustmentSelect(con);
		
		close(con);
		
		return list;
	}

	public int adjustmentComplete(String company) {
		
		Connection con = getConnection();		
		
		int result = new AdjustmentDao().adjustmentComplete(con, company);
		int result2 = 0;
		
		if(result > 0) {
			result2 = new AdjustmentDao().adjustmentInsertDate(con, company);
			commit(con);
		} else {
			rollback(con);
		}
		
		System.out.println(result);
		close(con);
		
		return result2;
	}

	public ArrayList<HashMap<String, Object>> adjustmentSearch(HashMap<String, String> hmap) {
		
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> searchmember = new AdjustmentDao().adjustmentSearch(con, hmap);
	
		close(con);
		
		return searchmember;
	}

	public ArrayList<HashMap<String, Object>> adjustmentCuSelect(int no) {
		
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new AdjustmentDao().adjustmentCuSelect(con, no);
		
		close(con);
		
		return list;
	}
	
	
}
