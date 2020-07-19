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

public class ProductService {

	public int insertProduct(Product product) {
		Connection con = getConnection();
		int result = 0;
		//상품명 기존에 있는지 중복 확인
		int num = new ProductDao().checkProductName(con, product);
		//num이 -1이면 이미 이름이 있다는 거라서 롤백 (중복임)
		if(num == -1) {
			result = -1; //상품명 중복
			rollback(con);
		}else { 
			//num이 -1이 아니면 이름이 있는게 아니라서 Dao에서  등록 하고 오기
			result = new ProductDao().insertProduct(con, product);
			if(result > 0) {
				commit(con); //result = 1 상품 등록 성공
			} else {
				rollback(con); //result = 0 상품 등록 실패 (상품명은 중복되지 않음)
			}
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
}
