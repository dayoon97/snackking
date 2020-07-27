package com.kh.snackking.exchange.model.dao;

import static com.kh.snackking.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.kh.snackking.equipment.model.vo.Equipment;
import com.kh.snackking.exchange.model.vo.Exchange;

public class ExchangeDao {

	public ArrayList<Exchange> selectList(Connection con, Exchange exchange) {
		ArrayList<Exchange> list = null;
		Statement stmt = null;
		
		ResultSet rset = null;
		int count  = 0;
		String query = "";
		
		
		
		if(count == 0) {
			query = "SELECT * FROM EXCHANGE_PRODUCT WHERE STATUS = 'N'";
		}else {
			query = "SELECT * FROM EXCHANGE_PRODUCT WHERE ";
		
		
			//if(query.substring(query.length()-5).equals(" AND ")) {
				//query = query.substring(0, query.length()-5);
				//query += ";";
			
			//}
			
		}
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			
			list = new ArrayList<Exchange>();
			
			while(rset.next()) {
				Exchange e = new Exchange();
				e.setList_Code(rset.getInt("LIST_CODE"));
				e.setCount(rset.getInt("EXCHANGE_COUNT"));
				e.setP_Code(rset.getString("PCODE"));
				e.setExchange_Code(rset.getString("EXCHANGE_CODE"));
				e.setUser_No(rset.getInt("USER_NO"));
				e.setStatus(rset.getString("STATUS"));
				list.add(e);
			}	
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		close(stmt);
		close(rset);
		}
		System.out.println("exchangeDao : " + list);
		return list;
		
		
	}

}
