package com.kh.snackking.contract.model.service;

//JDBCTemplate 에 만들었던 getConnection메소드 쓰기 위해서 임포트 구문 직접 작성함.
//static 으로 만들어서 프로그램 시작~종료 내내 사용. 
//JDBCTemplate에 있는 특정 메소드만 사용할거면 그렇게 적고 전체 다 사용할거면 * 쓴다.
//다음 Dao클래스에서도 JDBCTemplate에 있는 메소드를 써야하므로 Dao 클래스에서도 적어줘야함.
import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.commit;
import static com.kh.snackking.common.JDBCTemplate.getConnection;
import static com.kh.snackking.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.snackking.contract.model.dao.ContractDao;
import com.kh.snackking.contract.model.vo.Contract;

public class ContractService {

	//계약 insert
	public int insertContract(Contract contract) {

		Connection con = getConnection();
		
		int result = new ContractDao().insertContract(con,contract);
		
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		};
		
		close(con);
		
		//dao까지 작성 아직 안 했으면 dao에 있는 return 0 값이 돌아와서 0으로 결과 나온다.
//		System.out.println("insert service result : " + result);
		
		return result;
	}

	//전체 목록 갯수 조회 (페이징)
	public int getListCount() {

		Connection con = getConnection();
		
		int listCount = new ContractDao().getListCount(con);
		
		close(con);
		
		
		return listCount;
	}

	//페이징 처리 전 게시물 목록 조회용 메소드
	//계약 select 전체 목록 조회
	public ArrayList<Contract> selectList() {
		
		Connection con = getConnection();
		
		ArrayList<Contract> list = new ContractDao().selectList(con);
		
		close(con);
		
//		System.out.println("select service list : " + list);
		
		return list;
	}

	
	//계약 select 상세 목록 조회
	public ArrayList<Contract> selectDetail() {
		
		return null;
	}

	
	//계약내역 조회(select)에서 종료된 계약내역 확인 버튼 클릭시 리스트  
	public ArrayList<Contract> endContractList() {

		Connection con = getConnection();
		
		ArrayList<Contract> list = new ContractDao().endContractList(con);
		
		close(con);
		
		
		return list;
	}

	//계약내역 조회(select) 상세검색 
	public ArrayList<Contract> selectContractUserList(HashMap<String, String> hmap) {

		Connection con = getConnection();
		
		ArrayList<Contract> list = new ContractDao().selectContractUserList(con, hmap);
		
		close(con);
		
		
		return list;
	}

	


	
}
