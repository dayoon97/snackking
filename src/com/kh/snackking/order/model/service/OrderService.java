package com.kh.snackking.order.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.commit;
import static com.kh.snackking.common.JDBCTemplate.getConnection;
import static com.kh.snackking.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.snackking.order.model.dao.OrderDao;
import com.kh.snackking.order.model.vo.PickingList;
import com.kh.snackking.order.model.vo.PickingProduct;
import com.kh.snackking.order.model.vo.StorageProduct;

public class OrderService {

	public ArrayList<StorageProduct> selectOrderProductList(String pNum) {
		
		Connection con = getConnection();
		
		ArrayList<StorageProduct> list = new OrderDao().selectOrderProductList(con, pNum);
		
		close(con);
		
		return list;
	}

	public ArrayList<PickingProduct> insertPickingStockList(String sNum, int amount, int pListNo) {
		
		Connection con = getConnection();
		ArrayList<PickingProduct> list = null;
		
		int result = new OrderDao().storageAmount(con, sNum, amount);
		System.out.println("service result : " + result);
		if(result > 0) {
			int quanCheck = new OrderDao().quanCheck(con, sNum, amount);
			System.out.println("sevice quan : " + quanCheck);
			if(quanCheck >= 0) {
				commit(con);
				
				int result2 = new OrderDao().pickingStockList(con, pListNo, sNum, amount);
				System.out.println("service result2 : " + result2);
				if(result2 > 0) {
					list = new OrderDao().selectPickingStockList(con, pListNo);
					commit(con);
				} else {
					rollback(con);
				}
				
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		return list;
	}

	public PickingList insertPickingList(int cuListNo) {
		
		Connection con = getConnection();
		PickingList pList = null;
		int result = new OrderDao().insertPickingList(con, cuListNo);
		System.out.println("insert pickingList result : " + result);
		if(result > 0) {
			int num = new OrderDao().searchPickingCurrval(con);
			pList = new OrderDao().selectOnePickingList(con, num);
			if(pList != null) {
				commit(con);
			}
		} else {
			rollback(con);
		}
		
		close(con);
		
		return pList;
	}

	public StorageProduct selectOneStorage(String sNum) {
		
		Connection con = getConnection();
		
		StorageProduct sProduct = new OrderDao().selectOneStorage(con, sNum);
		
		close(con);
		
		return sProduct;
	}



}
