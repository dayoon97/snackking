package com.kh.snackking.equipment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.equipment.model.dao.EquipmentDao;
import com.kh.snackking.equipment.model.vo.Equipment;


import static com.kh.snackking.common.JDBCTemplate.*;


public class EquipmentService {
	
	//설비 insert
	public int insertEquipment(Equipment equipment) {
		Connection con = getConnection();
		int result = new EquipmentDao().insertEquipment(con, equipment);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	
	//설비 selectAll
	public ArrayList<Equipment> selectList(Equipment equipment) {
		Connection con = getConnection();
		ArrayList<Equipment> list = new EquipmentDao().selectList(con, equipment);
		close(con);
		return list;
	}
	
	//설비 update
	public int updateEquipment(Equipment equipment) {
		Connection con = getConnection();
		int result = new EquipmentDao().updateEquipment(con, equipment);
		if(result > 0) { 
				commit(con);
		}else {
				rollback(con);
		}
		close(con);
		return result;
	}
	
	
	
	
	
}
