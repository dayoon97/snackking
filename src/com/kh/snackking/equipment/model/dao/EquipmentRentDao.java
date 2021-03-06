package com.kh.snackking.equipment.model.dao;

import static com.kh.snackking.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import com.kh.snackking.equipment.model.vo.EquipmentRent;

public class EquipmentRentDao {

	private Properties prop = new Properties();
	public EquipmentRentDao() {
		
		String fileName = EquipmentRentDao.class.getResource("/sql/equipment/equipment-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public ArrayList<EquipmentRent> selectRentList(Connection con, EquipmentRent equipmentRent) {
		ArrayList<EquipmentRent> list = null;
		Statement stmt = null;
		//System.out.println("dao : " + equipmentRent);
		ResultSet rset = null;
		int count  = 0;
		String query = "";
		if(equipmentRent.getRentDate() == "") {count += 1;}
		if(equipmentRent.getEquipCode() == "") {count += 1;}
		if(equipmentRent.getCompany() == "") {count += 1;}
		if(equipmentRent.getStatus() == null) {count += 1;}
		//검색어 갯수 출력
		//System.out.println(count);
		if(count == 4) {
			query = "SELECT R.RENT_CODE, R.RENT_DATE, R.BACK_DATE, R.EQUIP_CODE, E.EQUIP_TYPE, E.EQUIP_NAME, E.EQUIP_MAKE, R.USER_NO, U.COMPANY, R.STATUS FROM EQUIPMENT_RENT R JOIN EQUIPMENT E ON(E.EQUIP_CODE = R.EQUIP_CODE) JOIN USER_INFO U ON(U.USER_NO = R.USER_NO)";
		}else {
			query = "SELECT R.RENT_CODE, R.RENT_DATE, R.BACK_DATE, R.EQUIP_CODE, E.EQUIP_TYPE, E.EQUIP_NAME, E.EQUIP_MAKE, R.USER_NO, U.COMPANY, R.STATUS FROM EQUIPMENT_RENT R JOIN EQUIPMENT E ON(E.EQUIP_CODE = R.EQUIP_CODE) JOIN USER_INFO U ON(U.USER_NO = R.USER_NO) WHERE ";
		
			
			if(equipmentRent.getRentDate() != "") {
				//날짜를 그냥 where 조건문에 넣었더니 계속 조회가 안됨
				//날짜 YY/MM/DD 형식으로 바꾸기
				String rentDate = equipmentRent.getRentDate().substring(2).replace("-", "/");
				//String rentDate = equipmentRent.getRentDate().replace("-", "/");
				System.out.println(rentDate);
				query += "R.RENT_DATE = '" + rentDate + "' AND ";}
			
			if(equipmentRent.getEquipCode() != "") { query += "R.EQUIP_CODE LIKE '%'||'" +  equipmentRent.getEquipCode() + "'||'%' AND ";}
			if(equipmentRent.getCompany() != "") { query += "U.COMPANY  LIKE '%'||'" + equipmentRent.getCompany() + "'||'%' AND ";}
			if(equipmentRent.getStatus() != null) { query += "R.STATUS = '" + equipmentRent.getStatus() + "' AND ";}

			if(query.substring(query.length()-5).equals(" AND ")) {
				query = query.substring(0, query.length()-5);
				//query += ";";
			}
			//query += "STATUS = 'Y'";
		}
		//쿼리문 실행
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<EquipmentRent>();
			
			while(rset.next()) {
				EquipmentRent e = new EquipmentRent();
				e.setBackDate(rset.getString("BACK_DATE"));
				e.setCompany(rset.getString("COMPANY"));
				e.setEquipCode(rset.getString("EQUIP_CODE"));
				e.setEquipMake(rset.getString("EQUIP_MAKE"));
				e.setEquipName(rset.getString("EQUIP_NAME"));
				e.setEquipType(rset.getString("EQUIP_TYPE"));
				e.setRentCode(rset.getInt("RENT_CODE"));
				e.setRentDate("20" + rset.getString("RENT_DATE").replace("/", "-"));
				e.setStatus(rset.getString("STATUS"));
				e.setUserNo(rset.getInt("USER_NO"));
				list.add(e);
			}	
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		close(stmt);
		close(rset);
		}
		//System.out.println("DAO: " + list);
		return list;
	}

	
	
}
