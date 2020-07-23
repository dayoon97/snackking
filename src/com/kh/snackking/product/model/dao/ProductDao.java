package com.kh.snackking.product.model.dao;

import static com.kh.snackking.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.snackking.equipment.model.vo.Equipment;
import com.kh.snackking.preference.model.vo.Preference;
import com.kh.snackking.product.model.vo.CuratingProduct;
import com.kh.snackking.product.model.vo.Product;
import com.kh.snackking.product.model.vo.ProductAttachment;
import com.kh.snackking.product.model.vo.ProductStorage;

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
			query = "SELECT P.PCODE, P.PNAME, P.PEXP, P.DELETE_YN, P.SEARCH_YN, P.PVENDOR, P.PT_CODE, PT.PT_NAME, P.PPRICE, P.FLAVOR, P.TASTE, P.ALLERGY, P.AGE FROM PRODUCT P JOIN PRODUCT_TYPE PT ON(P.PT_CODE = PT.PT_CODE) WHERE DELETE_YN = 'N' AND SEARCH_YN = 'Y' ORDER BY PCODE";
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

			query += "DELETE_YN = 'N' AND SEARCH_YN = 'Y' ORDER BY PCODE";
			//System.out.println("query " + query);
			
		}
			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				productList = new ArrayList<Product>();
				while(rset.next()) {
					Product p = new Product();
					p.setpCode(rset.getString("PCODE"));
					p.setpName(rset.getString("PNAME"));
					p.setpVendor(rset.getString("PVENDOR"));
					p.setPtCode(rset.getString("PT_CODE"));
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
					//System.out.println("DAO : + " + p );
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
		
		return productList;
	}

	//상품정보 삭제 메소드
	public int deleteProduct(Connection con, String pCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteProduct");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//업뎃
	public ArrayList<Product> selectProductRenewList(Connection con) {
		ArrayList<Product> productListRenew = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("productListRenew");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			productListRenew = new ArrayList<Product>();
			while(rset.next()) {
				Product p = new Product();
				p.setpCode(rset.getString("PCODE"));
				p.setpName(rset.getString("PNAME"));
				p.setpVendor(rset.getString("PVENDOR"));
				p.setPtCode(rset.getString("PT_CODE"));
				p.setTaste(rset.getString("TASTE"));
				p.setFlavor(rset.getString("FLAVOR"));
				p.setAllergy(rset.getString("ALLERGY"));
				p.setAge(rset.getString("AGE"));
				p.setPrice(rset.getInt("PPRICE"));
				p.setDelete_YN(rset.getString("DELETE_YN"));
				p.setSearch_YN(rset.getString("SEARCH_YN"));
				p.setpExp(rset.getInt("PEXP"));
				p.setPtName(rset.getString("PT_NAME"));
				productListRenew.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return productListRenew;
	}

	//상품 등록시 사진 등록 메소드
	public ArrayList<ProductAttachment> selectAttachment(Connection con, String[] pCodeArray) {
		ArrayList<ProductAttachment> attachmentList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectAttachment");
		
		try {
			attachmentList = new ArrayList<ProductAttachment>();
			//배열에 받아온 PCODE를 하나씩 꺼내서 PCODE에 해당하는 ATTACHMENT를 다 꺼내고 ARRAYLIST에 담기.
			for(int i = 0; i < pCodeArray.length; i++) {
				pstmt = con.prepareStatement(query);
				//System.out.println("dao" + pCodeArray[i]);
				pstmt.setString(1, pCodeArray[i]);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					//하나 꺼내서 객체 생성한 후 객체를  list에 담는다.
					ProductAttachment a = new ProductAttachment();
					a.setFid(rset.getInt("FID"));
					a.setChangeName(rset.getString("CHANGE_NAME"));
					a.setOriginName(rset.getString("ORIGIN_NAME"));
					a.setFilePath(rset.getString("FILE_PATH"));
					a.setUploadDate(rset.getDate("UPLOAD_DATE"));
					a.setpCode(rset.getString("PCODE"));
					a.setStatus(rset.getString("STATUS"));
					//System.out.println("attachment Dao : " + a);
					attachmentList.add(a);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		//System.out.println("attachmentList" + attachmentList);
		return attachmentList;
	}


	
	
	//상품 재고 등록 메소드( color 계산용 )
	public ArrayList<ProductStorage> selectProductStorage(Connection con, ProductStorage productStorage) {
		ArrayList<ProductStorage> productStorageList = null;
		Statement stmt = null;
		ResultSet rset = null;
		ResultSet urset = null;
		int num = 1;
		int count  = 0;
		String query = "";
		if(productStorage.getColor() == null || productStorage.getColor() == "") {count += 1;}
		if(productStorage.getpName() == null || productStorage.getpName() == "") {count += 1;}
		if(productStorage.getStorageCode() == null || productStorage.getStorageCode() == "") {count += 1;}
		if(productStorage.getStorageDate() == null || productStorage.getStorageDate() == "") {count += 1;}
		if(productStorage.getMfd()== null || productStorage.getMfd() == "") {count += 1;}
		
		//현재 날짜 조회해와야 해서 SYSDATE써줌
		if(count == 5) {
			query = "SELECT S.PCODE, S.COLOR, S.STORAGE_CODE, S.STORAGE_DATE, S.QUANTITY, S.SLOCATION, S.MFD, S.SECTION, S.SECTION_CODE, P.PNAME, P.PEXP, SYSDATE FROM PRODUCT_STORAGE S LEFT JOIN PRODUCT P ON(P.PCODE = S.PCODE) ORDER BY S.STORAGE_CODE";
		}else {
			query = "SELECT S.PCODE, S.COLOR, S.STORAGE_CODE, S.STORAGE_DATE, S.QUANTITY, S.SLOCATION, S.MFD, S.SECTION, S.SECTION_CODE, P.PNAME, P.PEXP, SYSDATE FROM PRODUCT_STORAGE S LEFT JOIN PRODUCT P ON(P.PCODE = S.PCODE) WHERE ";
		
			if(productStorage.getStorageDate() != "") {
				//날짜를 그냥 where 조건문에 넣었더니 계속 조회가 안됨
				//날짜 YY/MM/DD 형식으로 바꾸기
				query += "S.STORAGE_DATE = '" + productStorage.getStorageDate() + "' AND ";
			}
			
			if(productStorage.getMfd() != ""){
			query += "S.MFD = '" + productStorage.getMfd() + "' AND ";
			}

				if(productStorage.getColor() != null && productStorage.getColor() != "") { query += "S.COLOR = '" + productStorage.getColor() + "' AND ";}
				if(productStorage.getpName() != null && productStorage.getpName() != "") { query += "P.PNAME LIKE '%'||'" + productStorage.getpName() + "'||'%' AND ";}
				if(productStorage.getStorageCode() != null && productStorage.getStorageCode() != "") { query += "S.STORAGE_CODE LIKE '%'||'" + productStorage.getStorageCode() + "'||'%' AND ";}
				
				if(query.substring(query.length()-5).equals(" AND ")) {
					query = query.substring(0, query.length()-5);
					//query += ";";
				}
			query += " ORDER BY S.STORAGE_CODE";
		}
		System.out.println(query);

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			productStorageList = new ArrayList<ProductStorage>();
			while(rset.next()) {
				ProductStorage p= new ProductStorage();
				//잔여 유통기한 계산해서 컬러 넣어 조회
				String color = "";
				
				//현재 날짜 받아옴
				Date date = rset.getDate("SYSDATE");
				
				//제조일 받아와서 Date 타입으로 변환한 후 변수에 담음
				Date mfd = Date.valueOf(rset.getString("MFD"));// '2020-07-01'
				
				// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
				//시간으로 변환한뒤 빼주고, 다시 일 단위로 변경한다(나누기 해서)
				//제조일로부터 경과기간
				long pastDate = (date.getTime() - mfd.getTime())/( 24*60*60*1000);
				//System.out.println("남은 날짜 : " + remainDate);
				//남은 날짜를 월단위로 바꾼다 : 일괄적으로 나누기 30함
				//경과기간
				long pastMonth = pastDate/30;
				
				//System.out.println("지난 개월수 :  " + pastMonth);
				//System.out.println("기본 유통기한 : " + rset.getInt("PEXP"));
				//System.out.println("남은 개월수 : " + (rset.getInt("PEXP") - pastMonth) + "개월");
				
				if((rset.getInt("PEXP") - pastMonth) <= 1) {
					color="RED";
					System.out.println("상품 " + num +"번째 잔여 월 red" + (rset.getInt("PEXP") - pastMonth));
					//1개월 이하로 유통기간이 남으면 빨간색 처리
					num += 1;
				}else if((rset.getInt("PEXP") - pastMonth) <= 6) {
					//6개월 이하로 유통기한이 남으면 노란색 처리
					color="YELLOW";
					System.out.println("상품 " + num +"번째 잔여월 yellow" + (rset.getInt("PEXP") - pastMonth));
					num += 1;
				}else {
					//나머지는 회색 처리
					color="GRAY";
					System.out.println("상품 " + num +"번째 잔여월 gray : " + (rset.getInt("PEXP") - pastMonth));
					num += 1;
				}
				//System.out.println("color : " + color);
				
				//기본 유통기한 받아옴( 월 기준  )
				
				//오늘날짜 기준으로 color를 담았음. 오늘 날짜 기준으로 계산한 color update해주기!~
				p.setColor(color);				
				p.setBasicExp(rset.getInt("PEXP"));
				p.setMfd(rset.getString("MFD"));
				p.setpCode(rset.getString("PCODE"));
				p.setpName(rset.getString("PNAME"));
				p.setQuantity(rset.getInt("QUANTITY"));
				p.setSection(rset.getString("SECTION"));
				p.setSectionCode(rset.getString("SECTION_CODE"));
				p.setsLocation(rset.getString("SLOCATION"));
				p.setStorageCode(rset.getString("STORAGE_CODE"));
				p.setStorageDate(rset.getString("STORAGE_DATE"));
				productStorageList.add(p);
				System.out.println("color" + color);
				
				}	
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		close(stmt);
		close(rset);
		}
		//System.out.println("DAO " + productStorageList);
		return productStorageList;
	}
	
	//상품 재고 insert 메소드
	public int insertProductStorage(Connection con, ProductStorage productStorage) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      System.out.println("dao : " +  productStorage);
	      String query = prop.getProperty("insertProductStorage");
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, productStorage.getQuantity());
	         pstmt.setString(2, productStorage.getpName());
	         pstmt.setString(3, productStorage.getsLocation());
	         pstmt.setString(4, productStorage.getMfd());
	         pstmt.setString(5, productStorage.getSection());
	         pstmt.setString(6, productStorage.getSectionCode());
	         System.out.println(productStorage);
	         System.out.println(query);
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      return result;
	   }
	
	
	
	//실행이 안됨 ArrayList 쿼리문 반복 돌리는거 실패. 그냥 잔여 기간 날짜 계산한거 color만 보여줌
	//상품 재고 등록 업데이트용 메소드( color db 업데이트용 )
	public int updateProductStorageColor(Connection con, ArrayList<ProductStorage> productStorageList) {
		  PreparedStatement pstmt = null;
		  int result = 0;
		  String query = prop.getProperty("updateProductStorageColor");
	
		  try {
			  pstmt = con.prepareStatement(query);
			  //arraylist로 쿼리문 돌리니까 안됨
			//한바퀴 돌때마다 COLOR 값 오늘날짜 기준으로 업데이트 함.
			for(int i = 0 ; i < productStorageList.size(); i++) {
				
				pstmt.setString(1, productStorageList.get(i).getColor());
				//System.out.println(i + "번째 : " + productStorageList.get(i).getColor());
				pstmt.setString(2, productStorageList.get(i).getStorageCode());
				//System.out.println(i + "번째 : " + productStorageList.get(i).getStorageCode());
				//퀴리 실행
				//result에 실행 결과만큼 담음 (누적으로 담음)
				//나중에 result가 list size 랑 같으면 다 성공한 것.
				result = pstmt.executeUpdate();
				//System.out.println(result);
				pstmt.clearParameters();
				// 반복문으로 쓰려면 클리어 해줘야함
				
				//System.out.println("color 업데이트 성공" + i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	//보훈's-----------------------------------------------------------------------------------------------------

	   public int insertCuraPro(Connection con, CuratingProduct cp) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("insertCuraPro");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, cp.getPreNo());
	         pstmt.setString(2, cp.getProNo());
	         pstmt.setString(3, cp.getProNo());
	         pstmt.setInt(4, cp.getCount());
	         pstmt.setInt(5, cp.getCount());
	         pstmt.setString(6, cp.getProNo());
	         
	         result = pstmt.executeUpdate();
	         
	         System.out.println("result : " + result);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      
	      return result;
	   }


	   public ArrayList<CuratingProduct> CuratingSelect(Connection con, CuratingProduct cp) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      ArrayList<CuratingProduct> curatingPro = null;
	      
	      String query = prop.getProperty("curatingProSelect");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, cp.getPreNo());
	         
	         rset = pstmt.executeQuery();
	         curatingPro = new ArrayList<CuratingProduct>();
	         while(rset.next()) {
	            CuratingProduct curating = new CuratingProduct();
	            curating.setCuratingNo(rset.getInt("CUPODUCT_NO")); //큐레이팅순서번호
	            curating.setPreNo(rset.getInt("PRE_NO")); //선호도 번호
	            curating.setProNo(rset.getString("PCODE")); //상품 번호
	            curating.setpName(rset.getString("PNAME")); //상품명
	            curating.setCount(rset.getInt("PRO_COUNT")); //상품 개수
	            curating.setPrice(rset.getInt("PPRICE")); //상품 총 가격
	            curatingPro.add(curating);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	         close(rset);
	      }
	      
	      return curatingPro;
	   }


	   public int curatingDeletePro(Connection con, CuratingProduct cu) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("curatingDeletePro");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, cu.getCuratingNo());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	         
	      }
	      
	      
	      return result;
	   }


	public ArrayList<CuratingProduct> CuratingbasketProduct(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

	      ArrayList<CuratingProduct> curatingPro = null;
	      
	      String query = prop.getProperty("curatingProSelect");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, num);
	         
	         rset = pstmt.executeQuery();
	         curatingPro = new ArrayList<CuratingProduct>();
	         while(rset.next()) {
	            CuratingProduct curating = new CuratingProduct();
	            curating.setCuratingNo(rset.getInt("CUPODUCT_NO")); //큐레이팅순서번호
	            curating.setPreNo(rset.getInt("PRE_NO")); //선호도 번호
	            curating.setProNo(rset.getString("PCODE")); //상품 번호
	            curating.setpName(rset.getString("PNAME")); //상품명
	            curating.setCount(rset.getInt("PRO_COUNT")); //상품 개수
	            curating.setPrice(rset.getInt("PPRICE")); //상품 총 가격
	            curatingPro.add(curating);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	         close(rset);
	      }
	      
	      return curatingPro;
	}
	   
	
	
	public ArrayList<Product> CuratorSelectProduct(Connection con, Preference curatingProduct) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> product = null;
		String[] taste = curatingProduct.getPreTaste().split(","); //맛
		String[] flavor = curatingProduct.getPreFlavor().split(",");//향
		String[] protypes = curatingProduct.getPreProductTypes().split(",");//종류
		String[] alname = curatingProduct.getPreAlName().split(",");//알레르기
		
		String query = "SELECT "
			              	+ "P.PCODE, P.PNAME, P.PVENDOR, PT.PT_NAME, P.TASTE"
			              + ", P.FLAVOR, P.ALLERGY, P.PPRICE , P.SEARCH_YN "
			            + "FROM PRODUCT P JOIN PRODUCT_TYPE PT ON(P.PT_CODE = PT.PT_CODE) "
			           + "WHERE SEARCH_YN = 'Y' ";
		
		if(protypes != null) {
			for(int i = 0; i < protypes.length; i++) {//상품종류
				if(i == 0) {
					query += "OR PT.PT_NAME LIKE '%" + protypes[i] +"%' " ;
				}else {
					query += "OR PT.PT_NAME LIKE '%" + protypes[i] +"%' " ;
				}
			}
		}
		
		
		if(taste != null) {
			for(int i = 0; i < taste.length; i++) {//맛
					query += "OR P.TASTE LIKE '%"+ taste[i] +"%' ";
			}
		}
		
		if(flavor != null) {
			for(int i = 0; i < flavor.length; i++) {//향
				query += "OR P.FLAVOR LIKE '%"+ flavor[i] +"%' ";
			
			}
		}
		
		
		if(alname != null) {
			for(int i = 0; i < alname.length; i++) {
					query += "OR P.ALLERGY NOT LIKE '%"+ alname[i] +"%' ";
				
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
				p.setPrice(rset.getInt("PPRICE"));
				
				
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
	

