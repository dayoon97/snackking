<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	font-family: NanumSquare_ac;
}
.wrapper{
	height:auto;
}
.nav{
	width:100%;
	height:80px;
	
}
.snack-nav{
	width:100%;
	height:80px;
	background:#F0BB00;
	border-radius: 10px;
}
.middle{
	width: 999.01px;
	height: 0px;
	margin: 0 auto;
	border: 1px solid rgba(0, 0, 0, 0.21);
}
.loginFormArea{
	width:100%;
	height:auto;
}
.loginForm-box{
	width: 1045px;
	height: 508px;
	margin: 0 auto;
	margin-top: 20px;
	background: rgba(249, 249, 249, 0.66);
	border-radius: 40px;
}
#login-btn{

      width: 332px;
      height: 40px;
      left: 38%;
      top: 30%;
      background: #FFFFFF;
      border: 1px solid rgba(255, 168, 0, 0.42);
      box-sizing: border-box;
      color: rgba(255, 168, 0, 0.42);
      margin: 0 auto;
       
}
#login-btn:hover{
      background: #ff9100;
      border: 1px solid rgba(255, 168, 0, 0.42);
      color: white;
      border: 0;
      outline: 0;
      cursor: pointer;
}
#find-btn, #insert-btn{
	  width: 332px;
      height: 40px;
      padding-top: 10px;
      font-size: 15px;
      background: #ff9100;
      border: 1px solid rgba(255, 168, 0, 0.42);
      box-sizing: border-box;
      color:white;
      outline: 0;
      margin: 0 auto;
}
#find-btn:hover, #insert-btn:hover{
	  background: #FFFFFF;
      border: 1px solid rgba(255, 168, 0, 0.42);
      color: rgba(255, 168, 0, 0.42);
      outline: 0;
      cursor: pointer;
}
input[type=text]:focus {
  border: 1px solid #F0BB00;
}
input[type=text], input[type=password]{
	height:30px;
}
td {
	padding:15px;
}
table{
	padding: 50px;
}
.snack-logo{
	width:200px;
	height:50px;
	padding-top: 12px;
	padding-left: 10px;
}

/* .login-btn, .find-btn, .insert-btn{
	margin: 0 auto;
} */

</style>
</head>
<body>
	<div class="wrapper">
		<div class="nav">
			<div class="snack-nav">
				<div class="snack-logo"><img src="../../resources/image/logo5.png"></div>
			</div>
		</div>
		<div class="loginArea">
			<div class="login-titleArea">
				<div class="login-title">
					<h1 align="center">로그인</h1>
				</div>
			</div>
			<div class="middle"></div>
			<div class="loginFormArea">
				<div class="loginForm-box">
					<div class="loginForm">
						<form action="<%=request.getContextPath()%>/loginUser.us" method="post">
							<table align="center">
								<tr>
									<td id="admin-id">아이디</td>
								</tr>
								<tr>
									<td><input type="text" id="admin-id" name="userId" size="50" placeholder="아이디를 입력해주세요">
										<%-- <input type="hidden" name="url" value="<%=url%>"> --%>
									</td>
								</tr>
								<tr>
									<td id="admin-pwd">비밀번호</td>
								</tr>
								<tr>
									<td><input type="password" id="admin-password" name="password1" size="50" placeholder="비밀번호를 입력해주세요"></td>
								</tr>
								
								
							</table>
							<div class="btn-div" align="center">
								<div class="login-btn"><input type="submit" value="로그인" id="login-btn"></div><br>
								<!-- <div class="find-btn"><input type="button" value="아이디/비밀번호 찾기" id="find-btn"></div><br> -->
								<div class="find-btn" id="find-btn" onclick="location.href='findUserInfo.jsp';">아이디/비밀번호 찾기</div><br>
								<!-- <div class="insert-btn"><input type="button" value="회원가입" id="insert-btn"></div> -->
								<div class="insert-btn" id="insert-btn" onclick="location.href='join.jsp';">회원가입</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>