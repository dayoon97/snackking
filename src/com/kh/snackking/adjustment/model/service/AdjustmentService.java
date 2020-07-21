package com.kh.snackking.adjustment.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.adjustment.model.dao.AdjustmentDao;
import com.kh.snackking.adjustment.model.vo.Adjustment;

public class AdjustmentService {

	public ArrayList<Adjustment> adjustmentSelect() {
		Connection con = getConnection();
		
		ArrayList<Adjustment> list = new AdjustmentDao().adjustmentSelect(con);
		
		close(con);
		
		return list;
	}
	
	
}
