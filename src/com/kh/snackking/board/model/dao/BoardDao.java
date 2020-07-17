package com.kh.snackking.board.model.dao;

import static com.kh.snackking.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.board.model.vo.PageInfo;
import com.kh.snackking.user.model.vo.User;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = Board.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con, int userNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Board> selectList(Connection con, int userNo, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setrNum(rset.getInt("RNUM"));
				b.setBid(rset.getInt("BID"));
				b.setbType(rset.getString("BTYPE"));
				b.setBtName(rset.getString("BTYPE_NAME"));
				b.setBno(rset.getInt("BNO"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbContent(rset.getString("BCONTENT"));
				b.setbWriter(rset.getInt("BWRITER"));
				b.setUserName(rset.getString("USER_NAME"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setAnswerCheck(rset.getString("NVL"));
				
				list.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}





























