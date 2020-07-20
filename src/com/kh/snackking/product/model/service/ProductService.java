package com.kh.snackking.product.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.commit;
import static com.kh.snackking.common.JDBCTemplate.getConnection;
import static com.kh.snackking.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.equipment.model.dao.EquipmentDao;
import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.product.model.dao.ProductDao;
import com.kh.snackking.product.model.vo.Product;
import com.kh.snackking.product.model.vo.ProductAttachment;

public class ProductService {

	public int insertProduct(Product product) {
		Connection con = getConnection();
		// Dao에서  등록 하고 오기
		int result = new ProductDao().insertProduct(con, product);
		//상품명 기존에 있는지 중복 확인
		if(result > 0) {
			commit(con);
		}else { 
				rollback(con); //result = 0 상품 등록 실패 (상품명은 중복되지 않음)
		}
		close(con);
		return result;
	}
	
	
	
	public ArrayList<Product> CuratorSelectProduct(Preference curatingProduct) {
		Connection con = getConnection();
		
		ArrayList<Product> product = new ProductDao().CuratorSelectProduct(con, curatingProduct);
		
		if(product != null) {
			commit(con);
		}else {
			rollback(con);
		}
		return product;
	}

	
	//첨부파일(사진등록) insert 메소드
	public int insertProductAttachment(ProductAttachment pAttachment) {
		Connection con = getConnection();
		// Dao에서  등록 하고 오기
		int attachmentResult = new ProductDao().insertProductAttachment(con, pAttachment);
		if(attachmentResult > 0) {
			commit(con);
		}else { 
			rollback(con); 
		}
		close(con);
		return attachmentResult;
	}
	
	public int checkProductName(Product product) {
		Connection con = getConnection();
		int num = new ProductDao().checkProductName(con, product);
		//num =1 돌아오면 상품명이 중복이 아니고, num = -1 이 돌아오면 상품명 중복임
		close(con);
		return num;  //servlet으로 다시 num을 보낸다
	}



	public String selectProductCode(Product product) {
		Connection con = getConnection();
		String pCode = new ProductDao().selectProductCode(con, product);
		close(con);
		return pCode;
	}



	public ArrayList<Product> selectProductAllList(ArrayList<Product> conditionList) {
		Connection con = getConnection();
		ArrayList<Product> productList = new ProductDao().selectProductAllList(con, conditionList);
		close(con);
		return productList;
	}
	
	
	
	
}
