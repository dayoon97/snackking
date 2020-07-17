package com.kh.snackking.board.model.service;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.snackking.board.model.dao.BoardDao;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.board.model.vo.PageInfo;

public class BoardService {

	public int getListCount() {
		
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}

}
