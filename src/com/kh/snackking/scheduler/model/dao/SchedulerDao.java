package com.kh.snackking.scheduler.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.snackking.common.JDBCTemplate.*;
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
	
	
	
	public int insertDate(Connection con, Scheduler scheduler) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertDate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}




















