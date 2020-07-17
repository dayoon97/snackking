package com.kh.snackking.equipment.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.equipment.model.dao.EquipmentRentDao;
import com.kh.snackking.equipment.model.vo.EquipmentRent;

public class EquipmentRentService {

	
	
	//equipmentRent select all
	public ArrayList<EquipmentRent> selectRentList(EquipmentRent equipmentRent) {
		Connection con = getConnection();
		ArrayList<EquipmentRent> list = new EquipmentRentDao().selectRentList(con, equipmentRent);
		close(con);
		return list;
	}

	
	
	
	
}
