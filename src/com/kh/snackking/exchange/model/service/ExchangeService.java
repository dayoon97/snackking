package com.kh.snackking.exchange.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.exchange.model.dao.ExchangeDao;
import com.kh.snackking.exchange.model.vo.Exchange;

public class ExchangeService {

	public ArrayList<Exchange> selectList(Exchange exchange) {
		Connection con = getConnection();
		ArrayList<Exchange> list = new ExchangeDao().selectList(con, exchange);
		close(con);
		return list;
		
	}

}
