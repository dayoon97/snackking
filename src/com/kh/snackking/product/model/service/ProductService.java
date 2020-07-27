package com.kh.snackking.product.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.commit;
import static com.kh.snackking.common.JDBCTemplate.getConnection;
import static com.kh.snackking.common.JDBCTemplate.rollback;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.snackking.board.model.vo.Attachment;
import com.kh.snackking.equipment.model.dao.EquipmentDao;
import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.product.model.dao.ProductDao;
import com.kh.snackking.product.model.vo.CuratingProduct;
import com.kh.snackking.product.model.vo.Product;
import com.kh.snackking.product.model.vo.ProductAttachment;
import com.kh.snackking.product.model.vo.ProductStorage;

public class ProductService {
	
	//미소's-----------------------------------------------------------------------------------------------------
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


	public ArrayList<Product> selectProductAllList(HashMap<String, Product> conditionList) {
		Connection con = getConnection();
		ArrayList<Product> productList = new ProductDao().selectProductAllList(con, conditionList);
		close(con);
		return productList;
	}



	public int deleteProduct(String pCode) {
		Connection con = getConnection();
		int result = new ProductDao().deleteProduct(con, pCode);
		if(result > 0) {
			commit(con);
		}else { 
			rollback(con);
		}
		close(con);
		return result;
		
	}


	//삭제 후에 전체 상품 내역 다시 조회해오기
	public ArrayList<Product> selectProductRenewList() {
		Connection con = getConnection();
		ArrayList<Product> productListRenew = new ProductDao().selectProductRenewList(con);
		close(con);
		return productListRenew;
	}

	public ArrayList<ProductAttachment> selectAttachment(String[] pCodeArray) {
		Connection con = getConnection();
		ArrayList<ProductAttachment> attachmentList = new ProductDao().selectAttachment(con, pCodeArray);
		close(con);
		return attachmentList;
	}



	public ArrayList<ProductStorage> selectProductStorage(ProductStorage productStorage) {
		Connection con = getConnection();
		//System.out.println("service : " + productStorage);
		ArrayList<ProductStorage> productStorageList = new ProductDao().selectProductStorage(con, productStorage);
		if(productStorageList != null) {
			//color 계산해서 가져온거 db에 업데이트 한다
			int result = new ProductDao().updateProductStorageColor(con, productStorageList);
			if(result == productStorageList.size()) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		close(con);
		return productStorageList;
	}
	

	public int insertProductStorage(ProductStorage productStorage) {
		Connection con = getConnection();
		int result = new ProductDao().insertProductStorage(con, productStorage);
		if(result > 0) {
			commit(con);
		}else { 
		    rollback(con);
		}
		close(con);
		return result;
	}
	
	
	
	
	
	
	
	//보훈's-----------------------------------------------------------------------------------------------------

	
	public ArrayList<CuratingProduct> insertCuraPro(CuratingProduct cp) {
		Connection con = getConnection();
		ArrayList<CuratingProduct> insertSelectPro = null;
		int result = new ProductDao().insertCuraPro(con ,cp);
		
		if(result > 0) {
			insertSelectPro = new ProductDao().CuratingSelect(con, cp);
			if(insertSelectPro != null) {
				commit(con);
			}else {
				rollback(con);
				insertSelectPro = null;
			}
		}else {
			rollback(con);
		}
		close(con);
		return insertSelectPro;
	}

	
	
	   public ArrayList<CuratingProduct> curatingdeletePro(CuratingProduct cu) {
		      Connection con = getConnection();
		      ArrayList<CuratingProduct> curatingPro = null;
		      int result = new ProductDao().curatingDeletePro(con, cu);
		      
		      if(result > 0) {
		         commit(con);
		         curatingPro = new ProductDao().CuratingSelect(con, cu);
		      }else {
		         rollback(con);
		      }
		      
		      close(con);
		      return curatingPro;
		   }



	public ArrayList<CuratingProduct> CuratingbasketProduct(int num) {
		Connection con = getConnection();
		
		ArrayList<CuratingProduct> list = new ProductDao().CuratingbasketProduct(con, num);
		
		close(con);
		return list;
	}



	public ArrayList<Product> selectTotalProduct() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectTotalProduct(con);
		
		close(con);
		
		return list;
	}


//추가한 내용---------------------------------------------------------------------------
	public Product updateProductSelect(String tCode) {
		Connection con = getConnection();
		Product product = new ProductDao().updateProductSelect(con, tCode);
		close(con);
		return product;
	}



	public ProductAttachment selectOneAttachment(String tCode) {
		Connection con = getConnection();
		ProductAttachment attachment = new ProductDao().selectOneAttachment(con, tCode);
		close(con);
		return attachment;
	}



	public int updateProduct(Product product) {
		Connection con = getConnection();
		int result = new ProductDao().updateProduct(con, product);
		close(con);
		return result;
	}



	public int updateProductAttachment(ProductAttachment pAttachment) {
		Connection con = getConnection();
		int result = new ProductDao().updateProductAttachment(con, pAttachment);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
}
