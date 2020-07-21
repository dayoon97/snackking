package com.kh.snackking.adjustment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.adjustment.model.vo.Adjustment;


public class AdjustmentDao {
	private Properties prop = new Properties();
	
	public AdjustmentDao() {
		String fileName = Adjustment.class.getResource("/sql/adjustment/adjustment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Adjustment> adjustmentSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Adjustment> list = null;
		
		String query = prop.getProperty("adjustmentSelect");
		
		try {
			stmt = con.createStatement();
			
			list = new ArrayList<Adjustment>();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Adjustment ad = new Adjustment();
				ad.setad
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}
}
