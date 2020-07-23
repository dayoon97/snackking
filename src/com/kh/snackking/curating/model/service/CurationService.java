package com.kh.snackking.curating.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.snackking.curating.model.dao.CurationDao;
import com.kh.snackking.curating.model.vo.CurationList;
import com.kh.snackking.curating.model.vo.CurationProduct;

public class CurationService {

	public ArrayList<CurationList> selectUserCurationList(int num) {
		
		Connection con = getConnection();
		
		ArrayList<CurationList> list = new CurationDao().selectUserCurationList(con, num);

		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectCuratingProduct(int num) {
		
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		int result = 0;
		ArrayList<CurationProduct> list = new CurationDao().selectCuratingProduct(con, num);
		
		if(list != null) {
			hmap = new HashMap<>();
			hmap.put("list", list);
			result = new CurationDao().curatingProductPrice(con, num);
			if(result > 0) {
//				System.out.println("service result : " + result);
				String total = String.format("%,d", result);
//				System.out.println("service result format : " + total);
				hmap.put("toPrice", total);
			}
		}
		
		close(con);
		
		return hmap;
	}

}
