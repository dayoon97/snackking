package com.kh.snackking.equipment.model.dao;


import static com.kh.snackking.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, equipment.getEquipType());
			pstmt.setString(2, equipment.getEquipName());
			pstmt.setString(3, equipment.getPossible());
			pstmt.setString(4, equipment.getEquipMake());
			rset = pstmt.executeQuery();
			list = new ArrayList<Equipment>();
			
			while(rset.next()) {
				Equipment e = new Equipment();
				e.setEquipCode(rset.getInt("EQUIP_CODE"));
				e.setEquipType(rset.getString("EQUIP_TYPE"));
				e.setEquipName(rset.getString("EQUIP_NAME"));
				e.setPossible(rset.getString("POSSIBLE"));
				e.setEquipMake(rset.getString("EQUIP_MAKE"));
				list.add(e);
				System.out.println(e);
			}	
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		close(pstmt);
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
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, equipment.getEquipType());
			pstmt.setString(2, equipment.getEquipName());
			pstmt.setString(3, equipment.getPossible());
			pstmt.setString(4, equipment.getEquipMake());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}


}
