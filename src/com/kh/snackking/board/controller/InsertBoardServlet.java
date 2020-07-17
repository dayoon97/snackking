package com.kh.snackking.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.snackking.board.model.service.BoardService;
import com.kh.snackking.board.model.vo.Attachment;
import com.kh.snackking.board.model.vo.Board;
import com.kh.snackking.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.bo")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
//			String root = request.getSession().getServletContext().getRealPath("/");
//			System.out.println(root);
			String root = "C:/KH/images/";
//			System.out.println("root : " + root);
			
			String savePath = root + "board_uploadImages/";
//			System.out.println("savePath" + savePath);
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<>();
			ArrayList<String> originFiles = new ArrayList<>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multiRequest.getFilesystemName(name) != null) {
//					System.out.println("name : " + name);
					
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				} else {
					System.out.println("empty name : " + name);
				}
				
			}
			
//			System.out.println("savefiles : " + saveFiles);
//			System.out.println("originfiles : " + originFiles);
			
			int bWriter = Integer.parseInt(multiRequest.getParameter("bWriter"));
			String bType = multiRequest.getParameter("boardType");
			String bTitle = multiRequest.getParameter("btitle");
			String bContent = multiRequest.getParameter("content");
//			System.out.println(bWriter);
//			System.out.println(bType);
//			System.out.println(bTitle);
//			System.out.println(bContent);
			
			Board board = new Board();
			board.setbWriter(bWriter);
			board.setbType(bType);
			board.setbTitle(bTitle);
			board.setbContent(bContent);
			
			ArrayList<Attachment> fileList = null;
			if(saveFiles.size() > 0) {
				fileList = new ArrayList<>();
				for(int i = saveFiles.size() - 1; i >= 0; i--) {
					Attachment at = new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(originFiles.get(i));
					at.setChangeName(saveFiles.get(i));
					
					fileList.add(at);
				}
			}
			
			int result = new BoardService().insertBoard(board, fileList);
			
//			System.out.println(result);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectBoardList.bo");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					
					failedFile.delete();
				}
				
				request.setAttribute("msg", "사진게시판 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
