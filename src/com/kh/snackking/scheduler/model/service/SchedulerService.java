package com.kh.snackking.scheduler.model.service;

import java.sql.Connection;

import com.kh.snackking.scheduler.model.dao.SchedulerDao;
import com.kh.snackking.scheduler.model.vo.Scheduler;

import static com.kh.snackking.common.JDBCTemplate.*;

public class SchedulerService {

	
	public int insertDate(Scheduler scheduler) {
		Connection con = getConnection();
		
		int result = new SchedulerDao().insertDate(con, scheduler);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
