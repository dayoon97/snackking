package com.kh.snackking.order.model.dao;

import static com.kh.snackking.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.order.model.vo.PickingList;
import com.kh.snackking.order.model.vo.PickingProduct;
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

	public int insertPickingList(Connection con, int cuListNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPickingList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cuListNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int searchPickingCurrval(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT SEQ_PICK_NO.CURRVAL FROM DUAL";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
//		System.out.println("currval : " + result);
		return result;
	}
	
	public PickingList selectOnePickingList(Connection con, int result) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PickingList pList = null;
		
		String query = prop.getProperty("selectOnePickingList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, result);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pList = new PickingList();
				pList.setPickNo(rset.getInt("PICKING_NO"));
				pList.setCuListNo(rset.getInt("CU_LIST_NO"));
				pList.setPickDate(rset.getString("PICKING_DATE"));
				pList.setCompany(rset.getString("COMPANY"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;
	}
	
	public int storageAmount(Connection con, int sNum, int amount) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("storageAmount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, sNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int quanCheck(Connection con, int sNum, int amount) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("quanCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, sNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int pickingStockList(Connection con, int pListNo, int sNum, int amount) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("pickingStockList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pListNo);
			pstmt.setInt(2, sNum);
			pstmt.setInt(3, amount);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<PickingProduct> selectPickingStockList(Connection con, int pListNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PickingProduct> list = null;
		
		String query = prop.getProperty("selectPickingStockList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pListNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				PickingProduct p = new PickingProduct();
				
				p.setrNum(rset.getInt("RNUM"));
				p.setPickingProductNo(rset.getInt("PICKING_PRO_NO"));
				p.setCompany(rset.getString("PVENDOR"));
				p.setpName(rset.getString("PNAME"));
				p.setsCode(rset.getString("SCODE"));
				p.setpCount(rset.getInt("PPQUANTITY"));
				p.setLocation(rset.getString("SLOCATION"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public StorageProduct selectOneStorage(Connection con, int sNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		StorageProduct sProduct = null;
		
		String query = prop.getProperty("selectOneStorage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				sProduct = new StorageProduct();
				sProduct.setsCode(rset.getString("STORAGE_CODE"));
				sProduct.setsDate(rset.getString("STORAGE_DATE"));
				sProduct.setQuantity(rset.getInt("QUANTITY"));
				sProduct.setpCode(rset.getString("PCODE"));
				sProduct.setpName(rset.getString("PNAME"));
				sProduct.setLocation(rset.getString("SLOCATION"));
				sProduct.setManuDate(rset.getString("MFD"));
				sProduct.setSection(rset.getString("SECTION"));
				sProduct.setSecCode(rset.getString("SECTION_CODE"));
				sProduct.setColor(rset.getString("COLOR"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return sProduct;
	}


}
