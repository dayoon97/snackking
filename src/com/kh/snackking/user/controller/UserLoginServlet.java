package com.kh.snackking.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.snackking.user.model.service.UserService;
import com.kh.snackking.user.model.vo.User;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/loginUser.us")
public class UserLoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      
      
      String userId = request.getParameter("userId");
      String userPwd = request.getParameter("password1");
      String url = request.getParameter("url");
      
      System.out.println("login userId  : " + userId);
      System.out.println("login userPwd : " + userPwd);
      System.out.println(url);
      
      
      User requestMember = new User();
      requestMember.setUserId(userId);;
      requestMember.setUserPwd(userPwd);
      
      
      User loginUser =  new UserService().loginCheck(requestMember);
      
      
      String page = "";
     
      if(loginUser != null) {
         request.getSession().setAttribute("loginUser", loginUser);
		response.sendRedirect(url);
         
      }else {
         page = "views/common/login.jsp";
         request.setAttribute("msg", "로그인 실패!");
         request.getRequestDispatcher(page).forward(request, response);
         
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