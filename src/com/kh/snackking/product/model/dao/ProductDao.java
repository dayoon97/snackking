package com.kh.snackking.product.model.dao;

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

import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.product.model.vo.Product;

public class ProductDao {
	private Properties prop = new Properties();
	public ProductDao() {
		
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int insertProduct(Connection con, Product product) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, product.getpName());
			pstmt.setInt(2, product.getpExp());
			pstmt.setString(3, product.getpVendor());
			pstmt.setString(4, product.getPtName());
			pstmt.setInt(5, product.getPrice());
			pstmt.setString(6, product.getFlavor());
			pstmt.setString(7, product.getTaste());
			pstmt.setString(8, product.getAllergy());
			pstmt.setString(9, product.getAge());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		if(result > 0) {
			System.out.println("dao에서 insert 성공했음 : " + result);
		}else {
			System.out.println("dao에서 insert 실패했음 : " + result);
		}
		
		return result;
	}


	//상품 등록시 상품명 중복되는지 확인
	public int checkProductName(Connection con, Product product) {
		PreparedStatement pstmt = null;
		Product p = null;
		int num = 0;
		//조회라서 rset 해놓음
		ResultSet rset = null;
		String query = prop.getProperty("checkProductName");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1, product.getpName());
			//상품명 동일한 것 있을 경우 조회해옴 
			rset = pstmt.executeQuery();
			if(rset.next()) {
				num = -1;	//상품명이 중복임			
			} else {
				num = 1;	//상품명이 중복 아님	 			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return num;
	}

	public ArrayList<Product> CuratorSelectProduct(Connection con, Preference curatingProduct) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> product = null;
		int count = 0;
		String[] taste = curatingProduct.getPreTaste().split(","); //맛
		String[] flavor = curatingProduct.getPreFlavor().split(",");//향
		String[] protypes = curatingProduct.getPreProductTypes().split(",");//종류
		String[] alname = curatingProduct.getPreAlName().split(",");//알레르기
		
		String query = "SELECT "
			              	+ "P.PCODE, P.PNAME, P.PVENDOR, PT.PT_NAME, P.TASTE"
			              + ", P.FLAVOR, P.ALLERGY, P.PPRICE  "
			            + "FROM PRODUCT P JOIN PRODUCT_TYPE PT ON(P.PT_CODE = PT.PT_CODE) "
			           + "WHERE";
		
		for(int i = 0; i < taste.length; i++) {//상품종류
			if(i == 0) {
				query += " PT.PT_NAME LIKE '%" + protypes[i] +"%' " ;
			}else {
				query += "OR PT.PT_NAME LIKE '%"+ protypes[i] +"%' ";
			}
		}
		for(int i = 0; i < taste.length; i++) {//맛
			if(i == 0) {
				query += "OR P.TASTE LIKE '%"+ taste[i] +"%' ";
			}
			
		}
		for(int i = 0; i < flavor.length; i++) {//향
			if(i == 0) {
				query += "OR P.FLAVOR LIKE '%"+ flavor[i] +"%' ";
			}
		}
		if(alname != null) {
			for(int i = 0; i < alname.length; i++) {
				if(i == 0) {
					query += "OR NOT P.ALLERGY LIKE '%"+ alname[i] +"%' ";
				}
			}
		}
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			product = new ArrayList<Product>();
			
			while(rset.next()) {
				Product p = new Product();
				p.setpCode(rset.getString("PCODE"));
				p.setpName(rset.getString("PNAME"));
				p.setpVendor(rset.getString("PVENDOR"));
				p.setPtName(rset.getString("PT_NAME"));
				p.setTaste(rset.getString("TASTE"));
				p.setFlavor(rset.getString("FLAVOR"));
				p.setAllergy(rset.getString("ALLERGY"));
				
				
				product.add(p);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
			
		}
		
		return product;
	}



	
	
}
