package com.kh.snackking.scheduler.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.scheduler.model.dao.SchedulerDao;
import com.kh.snackking.scheduler.model.vo.Scheduler;
import com.kh.snackking.scheduler.model.vo.SchedulerInfo;

import static com.kh.snackking.common.JDBCTemplate.*;

public class SchedulerService {

	public ArrayList<Scheduler> schedulerSearch(int manager) {
		Connection conn = getConnection();
		
		ArrayList<Scheduler> sList= new SchedulerDao().shedulerSearch(conn, manager);
		
		close(conn);
		
		return sList;
	}

	public ArrayList<Scheduler> SchedulerUpdate() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<SchedulerInfo> schedulerInsert(int s_count) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	

}
