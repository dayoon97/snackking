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
.login-titleArea {
	margin-top: 30px;
	margin-bottom: 30px;
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
.snack-logo{
	width:200px;
	height:50px;
	padding-top: 12px;
	padding-left: 10px;
}
.loginForm-box{
	width: 1045px;
	height: 600px;
	margin: 0 auto;
	margin-top: 20px;
	background: rgba(249, 249, 249, 1);
	border-radius: 40px;
}
.loginForm {
	padding-top: 50px;
	padding-bottom: 50px;
}
#findId-btn, #findPwd-btn{
      width: 339px;
      height: 40px;
      left: 38%;
      top: 30%;
      background: #ff9100;
      border: 1px solid rgba(255, 168, 0, 0.42);
      box-sizing: border-box;
      color: white;
      margin: 0 auto;
}
#findId-btn:hover, #findPwd-btn:hover{
      background: #ff9100;
      border: 1px solid rgba(255, 168, 0, 0.42);
      color: white;
      border: 0;
      outline: 0;
      cursor: pointer;
}
input[type=text]:focus {
  border: 1px solid #F0BB00;
}
input[type=text], input[type=password]{
	height:30px;
}
th {
	font-size: 20px;
}
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
					<h1 align="center">아이디  / 비밀번호 찾기</h1>
				</div>
			</div>
			<div class="middle"></div>
			<div class="loginFormArea">
				<div class="loginForm-box">
					<div class="loginForm">
						<form id="findIdForm" action="<%= request.getContextPath() %>/findId.us" method="post">
							<table align="center">
								<thead>
									<tr>
										<th>아이디 찾기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>이름</td>
									</tr>
									<tr>
										<td><input type="text" id="findIdName" name="findIdName" size="50"></td>
									</tr>
									<tr>
										<td>이메일</td>
									</tr>
									<tr>
										<td><input type="text" id="findIdEmail" name="findInEmail" size="50"></td>
									</tr>
								</tbody>
							</table>
							<br>
							<div class="btn-div" align="center">
							<!-- 	<div id="findId-btn">아이디 찾기</div> -->
								<input type="submit" id="findId-btn" value="아이디 찾기">
							</div>
						</form>
						<br><br>
						<form id="findPwdForm" action="" method="post">
							<table align="center">
								<thead>
									<tr>
										<th>비밀번호 찾기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>아이디</td>
									</tr>
									<tr>
										<td><input type="text" id="findPwdUserId" size="50"></td>
									</tr>
									<tr>
										<td>이름</td>
									</tr>
									<tr>
										<td><input type="text" id="findPwdName" size="50"></td>
									</tr>
									<tr>
										<td>이메일</td>
									</tr>
									<tr>
										<td><input type="text" id="findIdEmail" size="50"></td>
									</tr>
								</tbody>
							</table>
							<br>
							<div class="btn-div" align="center">
								<div id="findPwd-btn">비밀번호 찾기</div>
							</div>
						</form>
					</div>	<!-- loginForm end -->
				</div>	<!-- loginForm-box -->
			</div>	<!-- loginFormArea end -->
		</div>	<!-- loginArea end -->
	</div>	<!-- wrapper end -->
	<script type="text/javascript">
	
	</script>
</body>
</html>