package com.kh.snackking.curating.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.commit;
import static com.kh.snackking.common.JDBCTemplate.getConnection;
import static com.kh.snackking.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.snackking.contract.model.dao.ContractDao;
import com.kh.snackking.curating.model.dao.CurationDao;
import com.kh.snackking.curating.model.vo.CurationList;
import com.kh.snackking.curating.model.vo.CurationProduct;
import com.kh.snackking.curating.model.vo.curating;

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
	
	public curating insertCuratingList(int num) {
		Connection con = getConnection();
		curating cu = null;
		int result = new CurationDao().insertCuratingList(con, num);
		System.out.println("result : " + result);
		if(result > 0) {
			commit(con);
			cu = new CurationDao().SelectCuratingListOne(con, num);
//			if(cu != null) {
//				
//			}else {
//				rollback(con);
//				cu = null;
//			}
		}else {
			rollback(con);;
		}
		close(con);
		return cu;
	}

	public int UpdateCuratingList(int cuNo) {
		Connection con = getConnection();
		
		int result = new CurationDao().UpdateCuratingList(con, cuNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
