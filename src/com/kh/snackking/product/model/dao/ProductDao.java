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
import java.util.HashMap;
import java.util.Properties;

import com.kh.snackking.equipment.model.vo.Equipment;
import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.product.model.vo.Product;
import com.kh.snackking.product.model.vo.ProductAttachment;

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
	
	
	//상품 등록용 메소드
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
			System.out.println("dao에서 상품 insert 성공했음 : " + result);
		}else {
			System.out.println("dao에서 상품 insert 실패했음 : " + result);
		}
		
		return result;
	}


	//상품 등록시 상품명 중복되는지 확인용 메소드
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


	//상품 정보 등록 후 자동 생성되는 상품 코드 가져오는 메소드(사진 등록에 상품코드 필요해서 작성)
	public String selectProductCode(Connection con, Product product) {
		String pCode = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProductCode");
		
		try {
			pstmt = con.prepareStatement(query);
			//이름 기준으로 insert 하며 자동생성한 pCode 가져옴 
			pstmt.setString(1, product.getpName());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				pCode = rset.getString("PCODE");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println("Dao : insert 한" + pCode);
		return pCode;
	}



	
	
	//사진 등록용 메소드
	public int insertProductAttachment(Connection con, ProductAttachment pAttachment) {
		PreparedStatement pstmt = null;
		int attachmentResult = 0;
		String query = prop.getProperty("insertProductAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pAttachment.getpCode());
			pstmt.setString(2, pAttachment.getOriginName());
			pstmt.setString(3, pAttachment.getChangeName());
			pstmt.setString(4, pAttachment.getFilePath());
			attachmentResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return attachmentResult;
	}


	//상품 기본정보 검색용 메소드(사진 x)
	public ArrayList<Product> selectProductAllList(Connection con, HashMap<String, Product> conditionList) {
		ArrayList<Product> productList = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		int count  = 0;
		String query = "";
		//해시맵 꺼내기
		Product p1 = conditionList.get("p1"); //price2 외 검색조건 전부 담아옴
		Product p2 = conditionList.get("p2"); //price2만 담아옴
		//System.out.println("p1" + p1);
		//System.out.println("p2" + p2);
		//조건 꺼내기
		if(p1.getpCode()== ""){count += 1;}
		if(p1.getpName()== ""){count += 1;}
		if(p1.getpExp()== 0){count += 1;}
		if(p1.getPtName()== ""){count += 1;}
		if(p1.getPrice()== 0){count += 1;}
		if(p2.getPrice()== 0){count += 1;}
		if(p1.getFlavor()== ""){count += 1;}
		if(p1.getTaste()== ""){count += 1;}
		if(p1.getAllergy()== ""){count += 1;}
		if(p1.getAge()== ""){count += 1;}

		
		if(count == 10) {
			query = "SELECT P.PCODE, P.PNAME, P.PEXP, P.DELETE_YN, P.SEARCH_YN, P.PVENDOR, P.PT_CODE, PT.PT_NAME, P.PPRICE, P.FLAVOR, P.TASTE, P.ALLERGY, P.AGE FROM PRODUCT P JOIN PRODUCT_TYPE PT ON(P.PT_CODE = PT.PT_CODE) WHERE DELETE_YN = 'N' AND SEARCH_YN = 'Y'";
		}else {
			query = "SELECT P.PCODE, P.PNAME, P.PEXP, P.DELETE_YN, P.SEARCH_YN, P.PVENDOR, P.PT_CODE, PT.PT_NAME, P.PPRICE, P.FLAVOR, P.TASTE, P.ALLERGY, P.AGE FROM PRODUCT P JOIN PRODUCT_TYPE PT ON(P.PT_CODE = PT.PT_CODE) WHERE ";
			if(p1.getpCode() != "") { query += "PCODE LIKE '%'||'" + p1.getpCode() + "'||'%' AND ";}
			if(p1.getpName() != "") { query += "PNAME LIKE '%'||'" + p1.getpName() + "'||'%' AND ";}
			if(p1.getpExp() != 0) { query += "PEXP ='" + p1.getpExp() + "' AND ";}
			if(p1.getPtName() != "") { query += "PT_NAME = '" + p1.getPtName() + "' AND ";}
			if(p1.getPrice()!= 0) { query += "PPRICE >= " + p1.getPrice() + " AND ";}
			if(p2.getPrice()!= 0 && (p1.getPrice()<= p2.getPrice())) { query += "PPRICE <= " + p2.getPrice() + " AND ";}
			if(p1.getFlavor()!= "") { query += "FLAVOR = '" + p1.getFlavor() + "' AND ";}
			if(p1.getTaste()!= "") { query += "TASTE = '" + p1.getTaste() + "' AND ";}
			if(p1.getAllergy()!= "") { query += "ALLERGY = '" + p1.getAllergy() + "' AND ";}
			if(p1.getAge()!= "") { query += "AGE LIKE '%'||'" + p1.getAge() + "'||'%' AND ";}

			query += "DELETE_YN = 'N' AND SEARCH_YN = 'Y' ";
			System.out.println("query " + query);
			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				productList = new ArrayList<Product>();
				while(rset.next()) {
					Product p = new Product();
					p.setpCode(rset.getString("PCODE"));
					p.setpName(rset.getString("PNAME"));
					p.setpVendor(rset.getString("PVENDOR"));
					p.setPtName(rset.getString("PT_NAME"));
					p.setTaste(rset.getString("TASTE"));
					p.setFlavor(rset.getString("FLAVOR"));
					p.setAllergy(rset.getString("ALLERGY"));
					p.setAge(rset.getString("AGE"));
					p.setPrice(rset.getInt("PPRICE"));
					p.setDelete_YN(rset.getString("DELETE_YN"));
					p.setSearch_YN(rset.getString("SEARCH_YN"));
					p.setpExp(rset.getInt("PEXP"));
					p.setPtName(rset.getString("PT_NAME"));
					productList.add(p);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
		}
		return productList;
	}
	
}
	

