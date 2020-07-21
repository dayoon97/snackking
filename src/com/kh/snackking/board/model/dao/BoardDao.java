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
import java.util.HashMap;
import java.util.Properties;

import com.kh.snackking.board.model.vo.Attachment;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.board.model.vo.PageInfo;
import com.kh.snackking.board.model.vo.Reply;
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
				b.setUserId(rset.getString("USER_ID"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setRid(rset.getInt("RID"));
				if(rset.getString("ANSWER").equals("Y")) {
					b.setAnswerCheck("답변완료");
				} else {
					b.setAnswerCheck("미답변");
				}
				
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

	public int insertBoard(Connection con, Board board) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getbType());
			pstmt.setString(2, board.getbTitle());
			pstmt.setString(3, board.getbContent());
			pstmt.setInt(4, board.getbWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 최근 발생한 시퀀스 확인 메소드
	public int selectCurrval(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				bid = rset.getInt("CURRVAL");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return bid;
	}

	public int insertAttachment(Connection con, Attachment attachment) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, attachment.getBid());
			pstmt.setString(2, attachment.getOriginName());
			pstmt.setString(3, attachment.getChangeName());
			pstmt.setString(4, attachment.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateCount(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board selectOneBoard(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;
		
		String query = prop.getProperty("selectOneBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Board();
				board.setBid(rset.getInt("BID"));
				board.setbType(rset.getString("BTYPE"));
				board.setBtName(rset.getString("BTYPE_NAME"));
				board.setBno(rset.getInt("BNO"));
				board.setbTitle(rset.getString("BTITLE"));
				board.setbContent(rset.getString("BCONTENT"));
				board.setbWriter(rset.getInt("BWRITER"));
				board.setUserName(rset.getString("USER_NAME"));
				board.setUserId(rset.getString("USER_ID"));
				board.setbCount(rset.getInt("BCOUNT"));
				board.setbDate(rset.getDate("BDATE"));
				board.setStatus(rset.getString("STATUS"));
				if(rset.getString("ANSWER").equals("Y")) {
					board.setAnswerCheck("답변완료");
				} else {
					board.setAnswerCheck("미답변");
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return board;
	}

	public HashMap<String, Object> selectBoardAttachment(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> atMap = null;
		Attachment at = null;
		ArrayList<Attachment> atList = null;
		String query = prop.getProperty("selectBoardAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			atList = new ArrayList<>();
			
			while(rset.next()) {
				at = new Attachment();
				at.setFid(rset.getInt("FID"));
				at.setBid(rset.getInt("BID"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setUploadDate(rset.getDate("UPLOAD_DATE"));
				at.setStatus(rset.getString("STATUS"));
				
				atList.add(at);
			}
			
			atMap = new HashMap<>();
			atMap.put("Attachment", atList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return atMap;
	}

	public Reply selectBoardReply(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reply reply = null;
		
		String query = prop.getProperty("selectBoardReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reply = new Reply();
				reply.setRid(rset.getInt("RID"));
				reply.setRno(rset.getInt("RNO"));
				reply.setBid(rset.getInt("BID"));
				reply.setrContent(rset.getString("RCONTENT"));
				reply.setrWriter(rset.getInt("RWRITER"));
				reply.setUserName(rset.getString("USER_NAME"));
				reply.setrDate(rset.getDate("RDATE"));
				reply.setStatus(rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reply;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getAllListCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Board> selectList(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
				b.setUserId(rset.getString("USER_ID"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setRid(rset.getInt("RID"));
				if(rset.getString("ANSWER").equals("Y")) {
					b.setAnswerCheck("답변완료");
				} else {
					b.setAnswerCheck("미답변");
				}
				
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

	public int insertReply(Connection con, Reply reqReply) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqReply.getBid());
			pstmt.setString(2, reqReply.getrContent());
			pstmt.setInt(3, reqReply.getrWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection con, HashMap<String, String> hmap) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String userId = hmap.get("userId");
		String boardType = hmap.get("boardType");
		String checkType = hmap.get("checkType");
		String searchDate = hmap.get("searchDate");
		
		System.out.println("dao userId : " + userId);
		System.out.println("dao btype : " + boardType);
		System.out.println("dao check : " + checkType);
		System.out.println("dao date : " + searchDate);
		
		String query = "SELECT COUNT(*) FROM (SELECT B.BID , B.BTYPE , UI.USER_ID , B.BDATE , B.STATUS , NVL2(R.RID, 'Y', 'N') "
				+ "AS CHECKED FROM BOARD B JOIN BOARD_TYPE BT ON(B.BTYPE = BT.BTYPE) JOIN USER_INFO UI ON(B.BWRITER = UI.USER_NO) "
				+ "LEFT JOIN REPLY R ON(B.BID = R.BID) ORDER BY BID DESC) WHERE STATUS = 'Y'";
		if(!userId.equals("")) {
			query += " AND USER_ID  = '" +  userId + "'";
		} else {
			query += "";
		}
		if(!boardType.equals("")) {
			query += " AND BTYPE  = '" +  boardType + "'";
		} else {
			query += "";
		}
		if(!checkType.equals("")) {
			query += " AND CHECKED  = '" +  checkType + "'";
		} else {
			query += "";
		}
		if(!searchDate.equals("")) {
			query += " AND TO_CHAR(BDATE) = TO_DATE('" +  searchDate + "')";
		} else {
			query += "";
		}
		
		System.out.println("dao query : " + query);
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Board> selectSearchList(Connection con, PageInfo pi, HashMap<String, String> hmap) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		String userId = hmap.get("userId");
		String boardType = hmap.get("boardType");
		String checkType = hmap.get("checkType");
		String searchDate = hmap.get("searchDate");
		
		String query = "SELECT HNUM, RNUM, BID, BTYPE, BTYPE_NAME , BNO , BTITLE, BCONTENT, BWRITER, USER_NAME , "
				+ "USER_ID , BCOUNT, BDATE, STATUS, RID, ANSWER FROM ( SELECT ROWNUM HNUM, RNUM, BID, BTYPE, BTYPE_NAME , "
				+ "BNO , BTITLE, BCONTENT, BWRITER, USER_NAME , USER_ID , BCOUNT, BDATE, STATUS, RID, "
				+ "ANSWER FROM (SELECT RNUM, BID, BTYPE, BTYPE_NAME, BNO , BTITLE, BCONTENT, BWRITER, "
				+ "USER_NAME , USER_ID , BCOUNT, BDATE, STATUS, RID, ANSWER FROM (SELECT ROWNUM RNUM, BID, BTYPE, BTYPE_NAME, "
				+ "BNO , BTITLE, BCONTENT, BWRITER, USER_NAME , USER_ID , BCOUNT, BDATE, STATUS, RID, ANSWER "
				+ "FROM (SELECT B.BID , B.BTYPE , BT.BTYPE_NAME , B.BNO , B.BTITLE , B.BCONTENT , B.BWRITER , UI.USER_NAME ,"
				+ " UI.USER_ID , B.BCOUNT , B.BDATE , B.STATUS , R.RID , NVL2(R.RID, 'Y', 'N') AS ANSWER "
				+ "FROM BOARD B JOIN BOARD_TYPE BT ON(B.BTYPE = BT.BTYPE) JOIN USER_INFO UI ON(B.BWRITER = UI.USER_NO) "
				+ "LEFT JOIN REPLY R ON(B.BID = R.BID) ORDER BY BID ASC) WHERE STATUS = 'Y' ";
		
		if(!userId.equals("")) {
			query += " AND USER_ID  = '" +  userId + "'";
		} else {
			query += "";
		}
		if(!boardType.equals("")) {
			query += " AND BTYPE  = '" +  boardType + "'";
		} else {
			query += "";
		}
		if(!checkType.equals("")) {
			query += " AND ANSWER  = '" +  checkType + "'";
		} else {
			query += "";
		}
		if(!searchDate.equals("")) {
			query += " AND TO_CHAR(BDATE) = TO_DATE('" +  searchDate + "')";
		} else {
			query += "";
		}
		
		query += ") ORDER BY RNUM DESC) ORDER BY HNUM ASC) WHERE HNUM BETWEEN ";
		query += startRow;
		query += " AND ";
		query += endRow;
		System.out.println("select query : " + query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
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
				b.setUserId(rset.getString("USER_ID"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setRid(rset.getInt("RID"));
				if(rset.getString("ANSWER").equals("Y")) {
					b.setAnswerCheck("답변완료");
				} else {
					b.setAnswerCheck("미답변");
				}
				
				list.add(b);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int getCuListCount(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		System.out.println("curator num : " + userNo);
		String query = prop.getProperty("getCuListCount");
		
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

	public ArrayList<Board> selectCuList(Connection con, int userNo, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectCuList");
		
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
				b.setUserId(rset.getString("USER_ID"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setRid(rset.getInt("RID"));
				if(rset.getString("ANSWER").equals("Y")) {
					b.setAnswerCheck("답변완료");
				} else {
					b.setAnswerCheck("미답변");
				}
				
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

	public int getListCount(Connection con, HashMap<String, String> hmap, int cuNum) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String userId = hmap.get("userId");
		String boardType = hmap.get("boardType");
		String checkType = hmap.get("checkType");
		String searchDate = hmap.get("searchDate");
		
		System.out.println("dao userId : " + userId);
		System.out.println("dao btype : " + boardType);
		System.out.println("dao check : " + checkType);
		System.out.println("dao date : " + searchDate);
		
		String query = "SELECT COUNT(*) FROM (SELECT B.BID , B.BTYPE , UI.USER_ID , B.BDATE , B.STATUS , NVL2(R.RID, 'Y', 'N') "
				+ "AS CHECKED FROM BOARD B JOIN BOARD_TYPE BT ON(B.BTYPE = BT.BTYPE) JOIN USER_INFO UI ON(B.BWRITER = UI.USER_NO) "
				+ "LEFT JOIN REPLY R ON(B.BID = R.BID) WHERE UI.MANAGER = " + cuNum + " ORDER BY BID DESC) WHERE STATUS = 'Y'";
		if(!userId.equals("")) {
			query += " AND USER_ID  = '" +  userId + "'";
		} else {
			query += "";
		}
		if(!boardType.equals("")) {
			query += " AND BTYPE  = '" +  boardType + "'";
		} else {
			query += "";
		}
		if(!checkType.equals("")) {
			query += " AND CHECKED  = '" +  checkType + "'";
		} else {
			query += "";
		}
		if(!searchDate.equals("")) {
			query += " AND TO_CHAR(BDATE) = TO_DATE('" +  searchDate + "')";
		} else {
			query += "";
		}
		
		System.out.println("dao query : " + query);
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Board> selectSearchList(Connection con, PageInfo pi, HashMap<String, String> hmap, int cuNum) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		String userId = hmap.get("userId");
		String boardType = hmap.get("boardType");
		String checkType = hmap.get("checkType");
		String searchDate = hmap.get("searchDate");
		
		String query = "SELECT HNUM, RNUM, BID, BTYPE, BTYPE_NAME , BNO , BTITLE, BCONTENT, BWRITER, USER_NAME , "
				+ "USER_ID , BCOUNT, BDATE, STATUS, RID, ANSWER FROM ( SELECT ROWNUM HNUM, RNUM, BID, BTYPE, BTYPE_NAME , "
				+ "BNO , BTITLE, BCONTENT, BWRITER, USER_NAME , USER_ID , BCOUNT, BDATE, STATUS, RID, "
				+ "ANSWER FROM (SELECT RNUM, BID, BTYPE, BTYPE_NAME, BNO , BTITLE, BCONTENT, BWRITER, "
				+ "USER_NAME , USER_ID , BCOUNT, BDATE, STATUS, RID, ANSWER FROM (SELECT ROWNUM RNUM, BID, BTYPE, BTYPE_NAME, "
				+ "BNO , BTITLE, BCONTENT, BWRITER, USER_NAME , USER_ID , BCOUNT, BDATE, STATUS, RID, ANSWER "
				+ "FROM (SELECT B.BID , B.BTYPE , BT.BTYPE_NAME , B.BNO , B.BTITLE , B.BCONTENT , B.BWRITER , UI.USER_NAME ,"
				+ " UI.USER_ID , B.BCOUNT , B.BDATE , B.STATUS , R.RID , NVL2(R.RID, 'Y', 'N') AS ANSWER "
				+ "FROM BOARD B JOIN BOARD_TYPE BT ON(B.BTYPE = BT.BTYPE) JOIN USER_INFO UI ON(B.BWRITER = UI.USER_NO) "
				+ "LEFT JOIN REPLY R ON(B.BID = R.BID) AND UI.MANAGER = " + cuNum +  "ORDER BY BID ASC) WHERE STATUS = 'Y' ";
		
		if(!userId.equals("")) {
			query += " AND USER_ID  = '" +  userId + "'";
		} else {
			query += "";
		}
		if(!boardType.equals("")) {
			query += " AND BTYPE  = '" +  boardType + "'";
		} else {
			query += "";
		}
		if(!checkType.equals("")) {
			query += " AND ANSWER  = '" +  checkType + "'";
		} else {
			query += "";
		}
		if(!searchDate.equals("")) {
			query += " AND TO_CHAR(BDATE) = TO_DATE('" +  searchDate + "')";
		} else {
			query += "";
		}
		
		query += ") ORDER BY RNUM DESC) ORDER BY HNUM ASC) WHERE HNUM BETWEEN ";
		query += startRow;
		query += " AND ";
		query += endRow;
		System.out.println("select query : " + query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
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
				b.setUserId(rset.getString("USER_ID"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setRid(rset.getInt("RID"));
				if(rset.getString("ANSWER").equals("Y")) {
					b.setAnswerCheck("답변완료");
				} else {
					b.setAnswerCheck("미답변");
				}
				
				list.add(b);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}



}





























