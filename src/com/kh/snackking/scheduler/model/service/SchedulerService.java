package com.kh.snackking.scheduler.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.scheduler.model.dao.SchedulerDao;
import com.kh.snackking.scheduler.model.vo.Scheduler;

import static com.kh.snackking.common.JDBCTemplate.*;

public class SchedulerService {

	public ArrayList<Scheduler> schedulerSearch(String userid) {
		Connection conn = getConnection();
		
		ArrayList<Scheduler> sList= new ArrayList();
		
		sList = SchedulerDao.shedulerSearch(conn, userid);
		
		close(conn);
		
		return sList;
	}

	

	
	

}
