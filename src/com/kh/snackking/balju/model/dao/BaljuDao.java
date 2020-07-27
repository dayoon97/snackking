package com.kh.snackking.balju.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.balju.model.vo.Balju;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.common.JDBCTemplate.*;
import static com.kh.snackking.common.JDBCTemplate.*;

public class BaljuDao {
	
private Properties prop = new Properties();
	
	public BaljuDao() {
		String fileName = Board.class.getResource("/sql/balju/balju-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Balju> BarjuSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Balju> bj = null;
		
		String query = prop.getProperty("BarjuSelect");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			bj = new ArrayList<Balju>();
			while(rset.next()) {
				Balju b = new Balju();
				b.setBalCode(rset.getString("BALJU_CODE"));//발주코드
				b.setBalType(rset.getString("BALJU_TYPE"));//발주승인상태
				b.setQuantity(rset.getInt("QUANTITY"));//수량
				b.setBaljuDate(rset.getString("BALJU_DATE"));//발주 신청일
				b.setExpectedDate(rset.getString("EXPECTED_DATE"));//입고 예정일
				b.setPrice(rset.getInt("PRICE"));//가격
				b.setUnit(rset.getString("UNIT"));//단위
				b.setVendor(rset.getString("VENDOR"));//업체명
				b.setpCode(rset.getString("PCODE")); //상품코드
				b.setpName(rset.getString("PNAME")); //상품이름
				b.setUserNo(rset.getInt("USER_NO"));  //유저코드
				b.setUserName(rset.getString("USER_NAME"));//유저이름
				
				bj.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return bj;
	}

	
}
