package com.kh.snackking.adjustment.model.dao;

import java.io.FileReader;
import java.io.IOException;
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
}
