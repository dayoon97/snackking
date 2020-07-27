package com.kh.snackking.balju.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.balju.model.dao.BaljuDao;
import com.kh.snackking.balju.model.vo.Balju;
import static com.kh.snackking.common.JDBCTemplate.*;

public class BaljuService {

	public ArrayList<Balju> BarjuSelect() {
		Connection con = getConnection();
		
		ArrayList<Balju> bj = new BaljuDao().BarjuSelect(con);
		
		return bj;
	}

	public ArrayList<Balju> BaljuAccept(String bjNo) {
		Connection con = getConnection();
		ArrayList<Balju> bjList = null;
		int result = new BaljuDao().BaljuAccept(con, bjNo);
		
		if(result > 0) {
			bjList = new BaljuDao().BarjuSelect(con);
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return bjList;
	}

}
