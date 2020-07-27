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

}
