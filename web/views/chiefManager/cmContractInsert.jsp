<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>  
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

.btn{
border:0;
outline:0;
width: 70px;
height: 32px;
background: #F0BB00;
display:inline-block;
font-family: NanumSquare_ac;
font-style: normal;
font-weight: 300;
font-size: 17px;
line-height: 19px;
text-align: center;
color: #FFFFFF;
}


#apply {
	border: 0;
	outline: 0;
	width: 90px;
	height: 32px;
	background: #F0BB00;
	display: inline-block;
	font-family: NanumSquare_ac;
	font-style: normal;
	font-weight: 300;
	font-size: 17px;
	line-height: 19px;
	text-align: center;
	color: #FFFFFF;
	top: 800px;
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
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	 /* Could be more or less, depending on screen size */
	height: 30%;
}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/misoCSS.css">
</head>
<body>
	<!-- 메뉴바 가져오기 -->

	<!-- 본문 영역 내용 들어가는 흰색 큰 박스 -->
	<div id="background-box">

		<!-- 본문영역 상단부 -->
		<div id="titleArea">
			<!-- 본문 영역 제목 -->
			<div id="mainTitle">계약 관리</div>
			<!-- 본문 영역 제목 밑에있는 선 -->
			<div id="line1"></div>
			<!-- 본문 영역 소제목 -->
			<div id="subTitle">계약내역 등록</div>
		</div>
		<!-- 본문영역 상단부 끝 -->

		<!-- 본문영역 중앙부 -->
		<div id="contentArea">
			<!-- 조회 정보 입력 부분 -->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">계약 등록</div>
				<!-- 조회 상자 테두리-->
				<div id="searchBox" style="height: 420px;">
					<form id="searchForm">
						<table border="1" style="width: 900px; height: 400px; margin-left: 30px;">
							<tr>
								<td>거래처명 :</td>
								<td><input type="text" class="" size="15" name="conCompany">
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>계약번호 :</td>
								<td><input type="text" class="" size="15" name="conNumber">
								</td>
								<td>계약일 :</td>
								<td><input type="date" class="" size="10" name="conDate"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>계약기간 :</td>
								<td colspan="2"><input type="date" class="" size=""
									name="calendar1">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; <input
									type="date" name="calendar2"></td>
								<td><input type="text" class="" size="7" name="conMonth">
									개월</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>배송횟수 :</td>
								<td>월 <input type="text" class="" size="7"
									name="deliverCount"> 회
								</td>
								<td>회차당 금액 :</td>
								<td><input type="text" class="" size="7" name="Pay">
									원</td>
								<td>월 계약금액 :</td>
								<td><input type="text" class="" size="7" name="monthPay">
									원</td>
							</tr>
							<tr>
								<td>배송주기 :</td>
								<td><input type="radio" name="delivery" value="everyday">
									매일 &nbsp;&nbsp;&nbsp; <input type="radio" name="delivery"
									value="everyweek"> 매주&nbsp;&nbsp;&nbsp; <input
									type="radio" name="delivery" value="everymonth"> 매월</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<!-- 클릭했을 때 보여지는 세부선택 부분-->
							<tr style="display: none">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>배송지 :</td>
								<td><input type="text" class="" size="30" name="address1"
									style="padding-left: 30px;"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>상세주소 :</td>
								<td><input type="text" class="" size="15" name="address2"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>


					</form>

					<button class="btn" id="apply" onclick="button_click();"
						style="margin-left: 860px; top: 500px;">등록</button>

					<div id="myModal" class="modal">
						<div class="modal-content" style="width: 30%;">
							<span class="close">&times;</span>
							<div style="text-align:center; margin-top:50px;"> 등록이 완료되었습니다.</div>
							<div style="text-align:center; margin-top:50px;">
								<button onclick="" class="btn" id="chCodeBtn" style="width:70px; ">확인</button>
							</div>
						</div>

					</div>



				</div>
				<script>
               			   
							//Get the modal
               			   var modal = document.getElementById("myModal");

               			   // Get the button that opens the modal
               			   var btn = document.getElementById("apply");

               			   // Get the <span> element that closes the modal
               			   var span = document.getElementsByClassName("close")[0];

               			   // When the user clicks on the button, open the modal
               			   btn.onclick = function() {
               			     modal.style.display = "block";
               			   }

               			   // When the user clicks on <span> (x), close the modal
               			   span.onclick = function() {
               			     modal.style.display = "none";
               			   }

               			   // When the user clicks anywhere outside of the modal, close it
               			   window.onclick = function(event) {
               			     if (event.target == modal) {
               			       modal.style.display = "none";
               			     }
               			   }
				               
				            </script>

			</div>
		</div>
</body>
</html>