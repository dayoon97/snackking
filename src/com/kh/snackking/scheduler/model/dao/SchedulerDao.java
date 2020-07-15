package com.kh.snackking.scheduler.model.dao;

import static com.kh.snackking.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.scheduler.model.vo.Scheduler;

public class SchedulerDao {
	private Properties prop = new Properties();
	
	public SchedulerDao() {
		String fileName = Scheduler.class.getResource("/sql/scheduler/scheduler-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}




















