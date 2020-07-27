package com.kh.snackking.equipment.model.dao;


import static com.kh.snackking.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.equipment.model.vo.Equipment;

public class EquipmentDao {
	
	private Properties prop = new Properties();
	public EquipmentDao() {
		
		String fileName = EquipmentDao.class.getResource("/sql/equipment/equipment-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	//설비 추가
	public int insertEquipment(Connection con, Equipment equipment) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertEquipment");
		try {
			//설비코드는 SEQ로 자동생성, 대여가능 번호 초기 값은 Y
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, equipment.getEquipType());
			pstmt.setString(2, equipment.getEquipName());
			pstmt.setString(3, equipment.getEquipMake());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	//조건에 맞는 설비 내역 조회
	public ArrayList<Equipment> selectList(Connection con, Equipment equipment) {
		ArrayList<Equipment> list = null;
		Statement stmt = null;
		
		ResultSet rset = null;
		int count  = 0;
		String query = "";
		if(equipment.getEquipType() == null || equipment.getEquipType() == "") {count += 1;}
		if(equipment.getEquipName() == null || equipment.getEquipName() == "") {count += 1;}
		if(equipment.getPossible() == null || equipment.getPossible() == "") {count += 1;}
		if(equipment.getEquipMake() == null || equipment.getEquipMake() == "") {count += 1;}
		
		
		if(count == 4) {
			query = "SELECT * FROM EQUIPMENT WHERE STATUS = 'Y'";
		}else {
			query = "SELECT * FROM EQUIPMENT WHERE ";
		
			if(equipment.getEquipType() != null && equipment.getEquipType() != "") { query += "EQUIP_TYPE LIKE '%'||'" + equipment.getEquipType() + "'||'%' AND ";}
			if(equipment.getEquipName() != null && equipment.getEquipName() != "") { query += "EQUIP_NAME LIKE '%'||'" + equipment.getEquipName() + "'||'%' AND ";}
			if(equipment.getPossible() != null && equipment.getPossible() != "") { query += "POSSIBLE LIKE '%'||'" + equipment.getPossible() + "'||'%' AND ";}
			if(equipment.getEquipMake() != null && equipment.getEquipMake() != "") { query += "EQUIP_MAKE LIKE '%'||'" + equipment.getEquipMake() + "'||'%' AND ";}

			//if(query.substring(query.length()-5).equals(" AND ")) {
				//query = query.substring(0, query.length()-5);
				//query += ";";
			
			//}
			
			query += "STATUS = 'Y'";
		}
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			
			list = new ArrayList<Equipment>();
			
			while(rset.next()) {
				Equipment e = new Equipment();
				e.setEquipCode(rset.getString("EQUIP_CODE"));
				e.setEquipType(rset.getString("EQUIP_TYPE"));
				e.setEquipName(rset.getString("EQUIP_NAME"));
				e.setPossible(rset.getString("POSSIBLE"));
				e.setEquipMake(rset.getString("EQUIP_MAKE"));
				e.setStatus(rset.getString("STATUS"));
				list.add(e);
			}	
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		close(stmt);
		close(rset);
		}
		return list;
	}
	
	
	
	
	

	//설비 업데이트
	public int updateEquipment(Connection con, Equipment equipment) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateEquipment");
		try {
			//고유 번호는 안바꿔주고 나머지는 업데이트 가능
			String status = "";
			System.out.println(equipment);
			pstmt = con.prepareStatement(query);
			if(equipment.getPossible().equals("Y")) {
				status = "N";
			}else {
				status = "Y";
			}
			pstmt.setString(1, status);
			pstmt.setString(2, equipment.getEquipCode());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}



	public int deleteEquipment(Connection con, String equipCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteEquipment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, equipCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		System.out.println("DAO " + result);
		return result;
	}



	public ArrayList<Equipment> selectListRenew(Connection con) {
		ArrayList<Equipment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectListRenew");
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			
			list = new ArrayList<Equipment>();
			
			while(rset.next()) {
				Equipment e = new Equipment();
				e.setEquipCode(rset.getString("EQUIP_CODE"));
				e.setEquipType(rset.getString("EQUIP_TYPE"));
				e.setEquipName(rset.getString("EQUIP_NAME"));
				e.setPossible(rset.getString("POSSIBLE"));
				e.setEquipMake(rset.getString("EQUIP_MAKE"));
				e.setStatus(rset.getString("STATUS"));
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
			}
			return list;
		}








}
