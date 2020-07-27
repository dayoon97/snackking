<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 8% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

</style>
</head>
<body>
	<div class="wrapper">
		<div class="nav">
			<div class="snack-nav">
				<div class="snack-logo"><a href="/snackking/index.jsp"><img src="../../resources/image/logo5.png"></a></div>
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
										<td><input type="text" id="findIdEmail" name="findIdEmail" size="50"></td>
									</tr>
								</tbody>
							</table>
							<br>
							<div class="btn-div" align="center">
							<!-- 	<div id="findId-btn">아이디 찾기</div> -->
								<input type="submit" id="findId-btn" value="아이디 찾기">
							</div>
						<br><br>
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
										<td><input type="text" id="findPwdEmail" size="50"></td>
									</tr>
								</tbody>
							</table>
							<br>
							<div class="btn-div" align="center">
								<input type="submit" id="findPwd-btn" value="비밀번호 찾기">
							</div>
					</div>	<!-- loginForm end -->
				</div>	<!-- loginForm-box -->
			</div>	<!-- loginFormArea end -->
		</div>	<!-- loginArea end -->
	</div>	<!-- wrapper end -->
	
	<!-- ***************************아이디 조회 모달******************************* -->
	<!-- Modal -->
	<div class="modal" id="find-Modal">
		
			<!-- modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<div class="modal-header">
					<h2 class="modal-title" id="modal-title"></h2>
				</div>	<!-- modal-header end -->
				<div class="modal-body">
					<p id="modal-body"></p>
				</div>	<!-- modal-body end -->
				<div class="modal-footer">
				</div>	<!-- modal-footer end -->
			</div>	<!-- modal-content end -->
		
	</div>	<!-- Modal end -->
	
<script type="text/javascript">
	var modal = document.getElementById("find-Modal");
	var btn1 = document.getElementById("findId-btn");
	var btn2 = document.getElementById("findPwd-btn");
	var span = document.getElementsByClassName("close")[0];
	
	btn1.onclick = function() {
		var name = $("#findIdName").val();
		var email = $("#findIdEmail").val();

		$.ajax({
			url: "<%= request.getContextPath() %>/findId.us",
			type: "post",
			data: {
				name: name,
				email: email
			},
			success: function(data) {
				//console.log(data);
				modal.style.display = "block";
				
				if(data != null){
					$("#modal-title").html("아이디 찾기 결과");
					$("#modal-body").html("아이디 찾기 결과  : " + data);
				} else {
					$("#modal-body").html("일치하는 결과가 없습니다.");
				}
				
			},
			error: function() {
				alert("Error!");
			}
		});
	}
	
	btn2.onclick = function() {
		var userId = $("#findPwdUserId").val();
		var name = $("#findPwdName").val();
		var email = $("#findPwdEmail").val();
		
		$.ajax({
			url: "<%= request.getContextPath() %>/findPwd.us",
			type: "post",
			data: {
				userId: userId,
				name: name,
				email: email
			},
			success: function(data) {
				//console.log(data);
				modal.style.display = "block";
				
				if(data != null){
					$("#modal-title").html("임시 비밀번호 전송");
					$("#modal-body").html(data);
				} else {
					$("#modal-body").html("일치하는 결과가 없습니다.");
				}
				
			},
			error: function() {
				alert("Error!");
			}
		});
	};
	
	span.onclick = function() {
		modal.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	
</script>

</body>
</html>