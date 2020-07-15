<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
#mainWrapper {
	margin-left: auto;
	margin-right: auto;
	display: table;
}
#outer {
	margin-left: 265px;
	margin-right: 35px;
	height: 100vh;
	position: relative;
}
body {
	overflow-x: hidden;
}

.footerArea{
	margin-top: 265px;
	height:150px;
}
.pwd-check-area{
	width:1200px;
	margin:0 auto;
}
.pwd-check-table{
	width:1100px;
	margin-left: 100px;
	margin-top: 50px;
	text-align: center;
}
.user-update{
	font-size: 30px;
	text-align: center;
}
.line{
	margin:0 auto;
	margin-top: 5px;
	width:19%;
	border: 2px solid #FFC700;
}
#update-form {
	text-align: center;
	display: inline-block;
	margin-top: 20px;
	margin-bottom: 20px;
}
#update-btn{
	  width: 360px;
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
#update-btn:hover{
	  background: #FFFFFF;
      border: 1px solid rgba(255, 168, 0, 0.42);
      color: rgba(255, 168, 0, 0.42);
      outline: 0;
      cursor: pointer;
}
input[type=password]{
	height:30px;
	padding-left: 5px;
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
#notice-box{
	display: inline-block;
	margin: 20px auto;
	text-align: left;
	width: 500px;
	padding-left: 10px;
}
#updateForm {
	display: inline-block;
	border: 1px solid gray;
}
.btn-div{
	margin-bottom: 50px;
}
</style>
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">
	<%@ include file="../common/userMenu.jsp" %>
	<div class="nav">
			<div class="snack-nav">
				<div class="snack-logo"><img src="../../resources/image/logo5.png"></div>
			</div>
	</div>
	<div class="outer">
		<div class="pwd-check-area">
			<div class="pwd-check-table">
			
				<p class="user-update">비밀번호 재확인</p>
				<div class="line"></div>
				<div id="notice-box">
					<p style="margin: 10px auto;">본인확인을 위해 한번 더 비밀번호를 입력해주세요.</p>
					<p style="margin: 10px auto;">비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</p>
				</div><br>
					<form id="updateForm" action="<%= request.getContextPath() %>/updateUserCheck.us" method="post">
						<input type="hidden" id="userNo" name="userNo" value="<%= loginUser.getUserNo()%>">
						<table align="center">
							<tr>
								<td style="text-align: left;">비밀번호 입력</td>
							</tr>
							<tr>
								<td><input type="password" id="password" name="password1" size="50"></td>
							</tr>
						</table>
						<div class="btn-div" align="center">
							<div class="update-btn" id="update-btn" onclick="updateUserCheck();">확인</div><br>
						</div>
					</form>				
				
			</div>	<!-- pwd-check-table end -->
		</div>	<!-- pwd-check-area end -->
	</div>	<!-- outer end -->
	
	
	<div class="footerArea">
	<%@ include file="../common/footer.jsp" %>
	</div>
</div>	<!-- mainWrapper end -->

<script>
	
	function updateUserCheck() {
		$("#updateForm").submit();
	}
	
</script>
	
</body>
</html>