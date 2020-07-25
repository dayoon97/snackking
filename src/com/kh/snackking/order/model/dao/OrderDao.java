package com.kh.snackking.order.model.dao;

import static com.kh.snackking.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.order.model.vo.StorageProduct;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		String fileName = Board.class.getResource("/sql/order/order-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<StorageProduct> selectOrderProductList(Connection con, String pNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<StorageProduct> list = null;
		
		String query = prop.getProperty("selectOrderProductList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pNum);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				StorageProduct s = new StorageProduct();
				s.setsCode(rset.getString("STORAGE_CODE"));
				s.setsDate(rset.getString("STORAGE_DATE"));
				s.setQuantity(rset.getInt("QUANTITY"));
				s.setpCode(rset.getString("PCODE"));
				s.setpName(rset.getString("PNAME"));
				s.setLocation(rset.getString("SLOCATION"));
				s.setManuDate(rset.getString("MFD"));
				s.setSection(rset.getString("SECTION"));
				s.setSecCode(rset.getString("SECTION_CODE"));
				s.setColor(rset.getString("COLOR"));
				
				list.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
