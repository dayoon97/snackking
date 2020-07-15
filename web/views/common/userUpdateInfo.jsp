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
	margin-top: 450px;
	height:150px;
}
.updateArea{
	height:850px;
	width:1200px;
	margin:0 auto;
}
.updateTable{
	width:1100px;
	height:700px;
	margin-left: 100px;
	margin-top: -20px;
}
.user-update{
	font-size: 30px;
	text-align: center;
}
.line{
	margin:0 auto;
	margin-top: 5px;
	width:16%;
	border: 2px solid #FFC700;
}
#update-form {
	text-align: center;
}

#update-btn, #cancel-btn{
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
#update-btn:hover, #cancel-btn:hover{
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
strong {
	color: red;
}
#check-all {
	padding-left: 0;
	font-weight: 800;
}
#juso-btn {
	border: 0;
	height: 30px;
	width: 100px;
	background: #ff9100;
	font-weight: 600;
	margin-top: 2px;
	margin-right: 5px;
}
span {
	float: right;
	color: red;
	font-weight: 600;
}
#userId:focus{
	outline: none;
}

</style>
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">
	<%@ include file="../common/userMenu.jsp" %>
	<div class="nav">
			<div class="snack-nav">
				<div class="snack-logo"></div>
			</div>
	</div>
	<div class="outer">
		<div class="updateArea">
			<div class="updateTable">
				<p class="user-update">회원정보 수정</p>
				<div class="line"></div>
					<form id="updateForm" action="<%= request.getContextPath() %>/updateUserInfo.us" method="post">
						<input type="hidden" name="userNo" value="<%= loginUser.getUserNo()%>">
						<table align="center">
							<tr>
								<td>아이디<strong>*</strong></td>
							</tr>
							<tr>
								<td><input type="text" id="userId" name="userId" size="50" disabled></td>
							</tr>
							<tr>
								<td>비밀번호 변경<strong>*</strong><span id="result-pwd1-msg"></span></td>
							</tr>
							<tr>
								<td><input type="password" id="password1" name="password1" size="50" placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8~16자"></td>
							</tr>
							<tr>
								<td>비밀번호 변경 확인<strong>*</strong><span id="result-pwd2-msg"></span></td>
							</tr>
							<tr>
								<td><input type="password" id="password2" name="password2" size="50" placeholder="비밀번호 확인"></td>
							</tr>
							<tr>
								<td>이름<strong>*</strong></td>
							</tr>
							<tr>
								<td><input type="text" id="userName" name="userName" size="50" placeholder="이름"></td>
							</tr>
							<tr>
								<td>회사명<strong>*</strong></td>
							</tr>
							<tr>
								<td><input type="text" id="company" name="company" size="50" placeholder="회사명"></td>
							</tr>
							<tr>
								<td>전화번호<strong>*</strong></td>
							</tr>
							<tr>
								<td><input type="text" id="phone" name="phone" size="50" placeholder="ex) 01012341234"></td>
							</tr>
							<tr>
								<td>이메일<strong>*</strong></td>
							</tr>
							<tr>
								<td><input type="text" id="email" name="email" size="50" placeholder="ex) snackking@snackking.com"></td>
							</tr>
							<tr>
								<td>주소<strong>*</strong></td>
							</tr>
							<tr style="vertical-align: middle;">
								<td>
								<input type="text" id="zipNo" name="zipNo" size="20" placeholder="우편번호">
								<input id="juso-btn" style="float: right;" type="button" onClick="goPopup();" value="주소검색"/>
								<br><br>
								<input type="text" id="address" name="address" size="50" placeholder="주소 입력">
								</td>
							</tr>
						</table>
						<div class="btn-div" align="center">
							<div class="update-btn" id="update-btn" onclick="updateCheck();">수정하기</div><br>
							<div class="cancel-btn" id="cancel-btn" onclick="">취소하기</div>
						</div>
						</form>				
				
			</div>	<!-- updateTable end -->
		</div>	<!-- updateArea end -->
	</div>	<!-- outer end -->
	
	
	<div class="footerArea">
	<%@ include file="../common/footer.jsp" %>
	</div>
</div>	<!-- mainWrapper end -->

<script>
	function goPopup(){
		var pop = window.open("/snackking/views/common/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		var addr = roadFullAddr;
		var zipNo = zipNo;
		
		$("#zipNo").val(zipNo);
		$("#address").val(addr);
	}
	
	$(function() {
		$("#userId").val("<%= loginUser.getUserId()%>");
		$("#userName").val("<%= loginUser.getUserName()%>");
		$("#company").val("<%= loginUser.getCompany()%>");
		$("#phone").val("<%= loginUser.getPhone()%>");
		$("#email").val("<%= loginUser.getEmail()%>");
		$("#zipNo").val("<%= loginUser.getZipNo()%>");
		$("#address").val("<%= loginUser.getAddress()%>");
	});
	
	var pwCheck1 = true;
	var pwCheck2 = true;
	var phoneCheck = false;
	var emailCheck = false;
	
	$(function() {
		
		$("#password1").keyup(function() {
			var password1 = $("#password1").val();
			var regExp = /^(?=.*[a-zA-Z])(?=.*[`~!@#$%^&*+-?])(?=.*[0-9])*.{8,16}$/g;
			
			if(regExp.test(password1)) {
				$("#result-pwd1-msg").html("<span style='color: green;'>사용 가능한 비밀번호입니다.</span>");
				pwCheck1 = true;
			} else {
				$("#result-pwd1-msg").html("사용 불가능한 비밀번호입니다.");
				pwCheck1 = false;
			}
			
			if(password1 === "") {
				$("#result-pwd1-msg").html("");
				pwCheck1 = true;
			}
		});	/* password1 check keyup end */
		
		$("#password2").blur(function() {
			var password1 = $("#password1").val();
			var password2 = $("#password2").val();
			
			if(password2 === password1) {
				$("#result-pwd2-msg").html("<span style='color: green;'>비밀번호와 일치합니다.</span>");
				pwCheck2 = true;
			} else {
				$("#result-pwd2-msg").html("비밀번호와 확인이 일치하지 않습니다.");
				pwCheck2 = false;
			}
			
			if(password2 === "") {
				$("#result-pwd2-msg").html("");
				pwCheck2 = true;
			}
		});	/* password2 check keyup end */
		
		$("#phone").keyup(function() {
			var phone = $("#phone").val();
			var regExp = /^[\d\d\d\d\d\d\d\d\d\d\d]{11}$/;
			
			if(regExp.test(phone)) {
				phoneCheck = true;
			} else {
				phoneCheck = false;
			}
			
			if(phone === ""){
				phoneCheck = false;
			}
			
		});	/* phone check */
		
		$("#email").keyup(function() {
			var email = $("#email").val();
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(regExp.test(email)) {
				emailCheck = true;
			} else {
				emailCheck = false;
			}
			
			
			if(email === "") {
				emailCheck = false;
			}
			
		});	/* email check */
		
	});
	
	function updateCheck() {
		
		var cpCheck = false;
		var zipNoCheck = false;
		var jusoCheck = false;
		
		var pwd1 = $("#password1").val();
		var pwd2 = $("#password2").val();
		var phone = $("#phone").val();
		var email = $("#email").val();
		
		var name = $("#userName").val();
		var cp = $("#company").val();
		var zipNo = $("#zipNo").val();
		var addr = $("#address").val();
		
		if(name === ""){
			nameCheck = false;
			alert("이름을 입력해주세요.");
		} else {
			nameCheck = true;
		}
		
		if(cp === ""){
			cpCheck = false;
			alert("회사명을 입력해주세요.");
		} else {
			cpCheck = true;
		}
		
		if(phone === ""){
			alert("전화번호를 입력해주세요.");
		} else {
			phoneCheck = true;
		}
		
		if(email === ""){
			alert("이메일을 입력해주세요.");
		} else {
			emailCheck = true;
		}
		
		if(zipNo === "") {
			zipNoCheck = false;
			alert("우편번호를 입력해주세요.");
		} else {
			zipNoCheck = true;
		}
		
		if(addr === "") {
			jusoCheck = false;
			alert("주소를 입력해주세요.");
		} else {
			jusoCheck = true;
		}
		
		
		console.log("pw1 : " + pwCheck1);
		console.log("pw2 : " + pwCheck2);
		
		if(pwCheck1 === true && pwCheck2 === true && nameCheck === true && cpCheck === true
				 && phoneCheck === true && emailCheck === true && zipNoCheck === true && jusoCheck === true) {
			  
			if(pwd1 === ""){
				$("#password1").attr("disabled");
				$("#password2").val("<%= loginUser.getUserPwd()%>");
			}
 
			$("#updateForm").submit();
			/* alert("회원가입 성공!"); */
		} else {
			/* alert("작성하지 않은 항목이 있습니다."); */
		}
		
	}
	
</script>
	
</body>
</html>