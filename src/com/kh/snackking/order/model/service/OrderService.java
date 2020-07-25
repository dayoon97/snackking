package com.kh.snackking.order.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.order.model.dao.OrderDao;
import com.kh.snackking.order.model.vo.StorageProduct;

public class OrderService {

	public ArrayList<StorageProduct> selectOrderProductList(String pNum) {
		
		Connection con = getConnection();
		
		ArrayList<StorageProduct> list = new OrderDao().selectOrderProductList(con, pNum);
		
		close(con);
		
		return list;
	}


}
