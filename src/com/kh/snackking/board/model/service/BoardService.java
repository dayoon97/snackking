package com.kh.snackking.board.model.service;

import static com.kh.snackking.common.JDBCTemplate.close;
import static com.kh.snackking.common.JDBCTemplate.commit;
import static com.kh.snackking.common.JDBCTemplate.getConnection;
import static com.kh.snackking.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.snackking.board.model.dao.BoardDao;
import com.kh.snackking.board.model.vo.Attachment;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.board.model.vo.PageInfo;
import com.kh.snackking.board.model.vo.Reply;

public class BoardService {

	public int getListCount(int userNo) {
		
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con, userNo);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectList(int userNo, PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con, userNo, pi);
		
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

	public Map<String, Object> selectOneBoard(int num) {
		
		Connection con = getConnection();
		Map<String, Object> boardMap = null;
		
		int result = new BoardDao().updateCount(con, num);
		Board board = new BoardDao().selectOneBoard(con, num);
		HashMap<String, Object> atMap = new BoardDao().selectBoardAttachment(con, num);
		Reply reply = new BoardDao().selectBoardReply(con, num);
		
		if(result > 0 && board != null) {
			boardMap = new HashMap<String, Object>();
			boardMap.put("Board", board);
			commit(con);
			
			if(atMap != null) {
//				System.out.println("service attachment atMap : " + atMap);
				ArrayList<Attachment> atList = (ArrayList<Attachment>) atMap.get("Attachment");
				boardMap.put("Attachment", atList);
			}
			
			if(reply != null) {
				boardMap.put("Reply", reply);
			}
			
		} else {
			rollback(con);
			board = null;
		}
		
		close(con);
		
		return boardMap;
	}

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

	public Reply insertReply(Reply reqReply) {
		
		Connection con = getConnection();
		Reply reply = null;
		
		int result = new BoardDao().insertReply(con, reqReply);
		
		if(result > 0) {
			reply = new BoardDao().selectBoardReply(con, reqReply.getBid());
			commit(con);
		} else {
			rollback(con);
		}
		
		return reply;
	}

	public int getListCount(HashMap<String, String> hmap) {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con, hmap);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectSearchList(PageInfo pi, HashMap<String,String> hmap) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectSearchList(con, pi, hmap);
		
		close(con);
		
		return list;
	}

	public int getCuListCount(int userNo) {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getCuListCount(con, userNo);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectCuList(int userNo, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectCuList(con, userNo, pi);
		
		close(con);
		
		return list;
	}

	public int getListCount(HashMap<String, String> hmap, int cuNum) {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con, hmap, cuNum);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectSearchList(PageInfo pi, HashMap<String, String> hmap, int cuNum) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectSearchList(con, pi, hmap, cuNum);
		
		close(con);
		
		return list;
	}

	public ArrayList<Board> newBoardSelect() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().newBoardSelect(con);
		
		close(con);
		
		return list;
	}

}
