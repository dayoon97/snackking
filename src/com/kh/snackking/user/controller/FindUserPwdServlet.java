package com.kh.snackking.user.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.snackking.common.TempPwdGmailSend;
import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class FindUserPwdServlet
 */
@WebServlet("/findPwd.us")
public class FindUserPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindUserPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
//		System.out.println("findPwd userId servlet : " + userId);
//		System.out.println("findPwd name servlet : " + name);
//		System.out.println("findPwd email servlet : " + email);
		
		String tempPwd = new TempPwdGmailSend().TempPwd();
		
		// 임시 비밀번호 암호화
		String encPwd = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			
			byte[] bytes = tempPwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
					
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		User reqUser = new User();
		reqUser.setUserId(userId);
		reqUser.setUserName(name);
		reqUser.setEmail(email);
		reqUser.setUserPwd(encPwd);
		
		int result = new UserService().findUserPwd(reqUser);
		
		String msg = null;
		if(result > 0) {
			new TempPwdGmailSend().gmailSend(email, tempPwd);
			msg = "입력해주신 이메일로 임시 비밀번호를 발송했습니다. \n 바뀐 비밀번호로 로그인 후 비밀번호를 변경해주세요.";
		}
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(msg, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
