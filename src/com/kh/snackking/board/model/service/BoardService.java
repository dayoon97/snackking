package com.kh.snackking.board.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.board.model.dao.BoardDao;
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

}
