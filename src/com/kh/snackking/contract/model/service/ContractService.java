package com.kh.snackking.contract.model.service;

import java.sql.Connection;

import com.kh.snackking.contract.model.dao.ContractDao;
import com.kh.snackking.contract.model.vo.Contract;
//JDBCTemplate 에 만들었던 getConnection메소드 쓰기 위해서 임포트 구문 직접 작성함.
//static 으로 만들어서 프로그램 시작~종료 내내 사용. 
//JDBCTemplate에 있는 특정 메소드만 사용할거면 그렇게 적고 전체 다 사용할거면 * 쓴다.
//다음 Dao클래스에서도 JDBCTemplate에 있는 메소드를 써야하므로 Dao 클래스에서도 적어줘야함.
import static com.kh.snackking.common.JDBCTemplate.*;

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

}
