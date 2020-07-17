package com.kh.snackking.scheduler.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.scheduler.model.vo.Scheduler;
import static com.kh.snackking.common.JDBCTemplate.close;

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

	public static ArrayList<Scheduler> shedulerSearch(Connection conn, String userid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Scheduler sc = new Scheduler();
		ArrayList<Scheduler> slist = new ArrayList<>();
		String query = null;
		
		if(userid.equals("admin")) {
			query = "SELECT * FROM USER_INFO";
		}else {
			query = "SELECT * FROM USER_INFO WHERE USER_ID='"+userid+"'";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				sc = new Scheduler(rset.getString("USER_NAME"));
				
				slist.add(sc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
			
		}
		return slist;
	}

	

}




















