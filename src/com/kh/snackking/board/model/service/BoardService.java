package com.kh.snackking.board.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.board.model.dao.BoardDao;
import com.kh.snackking.board.model.vo.Attachment;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.board.model.vo.PageInfo;

public class BoardService {

	public int getListCount(int userNo) {
		
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con, userNo);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectList(int userNo, PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con, userNo,pi);
		
		close(con);
		
		return list;
	}

	public int insertBoard(Board board, ArrayList<Attachment> fileList) {
		
//		System.out.println("service board : " + board);
//		System.out.println("service fileList : " + fileList);
		
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = 0;
		int result2 = 0;
		
		result1 = new BoardDao().insertBoard(con, board);
		
		if(result1 > 0) {
			if(fileList != null) {
				int bid = new BoardDao().selectCurrval(con);
				
				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setBid(bid);
					
					result2 += new BoardDao().insertAttachment(con, fileList.get(i)); 
				}
				
				if(result2 == fileList.size()) {
					commit(con);
					result = 1;
				} else {
					rollback(con);
				}
				
			} else {
				commit(con);
				result = 1;
			}
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
