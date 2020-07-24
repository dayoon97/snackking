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
import com.kh.snackking.scheduler.model.vo.SchedulerInfo;

import static com.kh.snackking.common.JDBCTemplate.*;

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

	public ArrayList<Scheduler> shedulerSearch(Connection conn, int manager) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Scheduler> slist = null;
		System.out.println("dao : " +manager);
		
		
		String query = prop.getProperty("schedulerSearch");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, manager);
			
			slist = new ArrayList<Scheduler>();
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Scheduler s = new Scheduler();
				s.setDelivCount(rset.getInt("DELIVERY_COUNT"));
				s.setUserName(rset.getString("USER_NAME"));
				s.setUserNo(rset.getInt("USER_NO"));
				s.setCompany(rset.getString("COMPANY"));
				s.setMngId(rset.getInt("MANAGER"));
				s.setScheduleDate(rset.getDate("SCHEDULE_DATE"));

				
				slist.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		System.out.println(slist);
		
		return slist;
	}

	public ArrayList<Scheduler> updateDate(Connection conn, SchedulerInfo cal) {
		PreparedStatement pstmt = null;
		ArrayList<Scheduler> slist = null;
		ResultSet rset = null;
		int result = 0;
		System.out.println("cal 값 : "+ cal);
		
		String query = prop.getProperty("schedulerUpdate");
		String query2 = prop.getProperty("schedulerSearch");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, cal.getS_date());
			pstmt.setInt(2, cal.getCon_no());
			
			result = pstmt.executeUpdate();
			System.out.println("배송 일정 변경 AFTER DAO : " +result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		if(result>0) {
			try {
				pstmt = conn.prepareStatement(query2);
				slist = new ArrayList<Scheduler>();
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Scheduler s = new Scheduler();
					s.setDelivCount(rset.getInt("DELIVERY_COUNT"));
					s.setUserName(rset.getString("USER_NAME"));
					s.setUserNo(rset.getInt("USER_NO"));
					s.setCompany(rset.getString("COMPANY"));
					s.setMngId(rset.getInt("MANAGER"));
					s.setScheduleDate(rset.getDate("SCHEDULE_DATE"));

					slist.add(s);
				}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
			
		
		return slist;
	}

	

}




















