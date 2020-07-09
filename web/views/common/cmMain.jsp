<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>관리자 로그인</title>
<style type="text/css">
	body {
		background-color:#F3F3F3;
		font-family: 'NanumSquare', sans-serif;
	}
	#aside {
		height: 735px;
		/* min-height:100%; */
		background-color: #F0BB00;
		position: fixed;
		width:230px;
		z-index: 1;
		border-radius: 20px;
		overflow: hidden;
	}
	#section {
		background: white;
		margin-left: 265px;
		margin-right: 35px;
	}
	.aside-header {
		padding: 0 20px;
	}
	.aside-body {
		background-color: #F3F3F3;
		width: 88%;
		height: 80%;
		postion: relative;
		border-radius: 20px;
		margin-left: auto;
		margin-right: auto;
		overflow: hidden;
	}
	.aside-body-header{
		padding-top:10px;
	}
	.login-info {
		width: 80%;
		height: 80px;
		background-color: #F0BB00;
		color:black;
		margin-left: auto;
		margin-right: auto;
		border-radius: 10px;
	}
	.login-name {
		padding-top: 13px;
		padding-bottom: 10px;
		font-weight: 600;
		font-size: 20px;
		display: inline-block;
	}
	.bell {
		vertical-align: middle;
	}
	.login-jobname {
		padding-top: 5px;
		padding-bottom: 5px;
		font-weight: 200;
		font: 15px;
	}
	#accodion-box {
		width: 100%;
		max-width: 600px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 30px;
	}
	.list {
		padding: 0;
		list-style: none; 
		text-align:center;
	}
	p.title {
		width: 100%;
		box-sizing: border-box;
		font-weight: 600;
		font-size: 20px;
		margin-top: 15px;
		margin-bottom: 15px;
	}
	.con {
		padding-left: 0;
		padding-right: 55px;
		display: none;
		text-align: right;
		list-style: none;
	}
	.con>li {
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#logout-box {
		background: rgba(205, 135, 0, 0.66);
		color: white;
		font-size: 20px;
		width: 180px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		margin: 10px auto;
		border-radius: 10px;
		postion: relative;
	}
	p.title:hover, .con>li:hover, #logout-box:hover {
		cursor: pointer;
	}
	a:link{
		color: black;
		text-decoration: none;
	}
	a:visited {
		color: black;
		text-decoration: none;
	}
	a:hover {
		color: #F0BB00;
	}
</style>
</head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
	
	<div id="wrap" style="display: block;">
		<!-- aside div start -->
		<div id="aside" class="aside">
			<div class="aside-header" align="center">
				<a href="../chiefManager/cmMainPage.jsp">
					<img alt="logoImage" src="../../resources/image/logo3.png" width="150px;">
				</a>
			</div>	<!-- aisde-header end -->
			<div class="aside-body">
				<div class="aside-body-header">
					<div class="login-info" align="center">
					<!-- <table>
						<tr>
							<td class="login-name">김미소</td>
							<td class="bell">&nbsp;&nbsp;<img alt="bell"
								src="../../resources/image/bell.png"></td>
						</tr>
					</table> -->
						<div class="login-name">김미소</div>
						<div id="line" style="border:1px solid #AA8400; width:60%; background-color: #AA8400"></div>
						<div class="login-jobname">최고 관리자</div>
					</div>	<!-- login-info end -->
				</div>	<!-- aisde-body-header end -->
				<div class="aside-body-body" id="accodion-box">
					<ul class="list">
						<li>
							<p class="title">회원 관리</p>
								<ul class="con">
									<li><a href="../chiefManager/cmMemberSelect.jsp">회원 리스트</a></li>
									<li><a href="../question/cmquestion.jsp">문의 게시판 관리</a></li>
									<li><a href="../chiefManager/cmContractMember.jsp">계약 회원 관리</a></li>
									<li><a href="../chiefManager/cmDeleteMember.jsp">회원 탈퇴 승인</a></li>
								</ul>
						</li>
						<li>
							<p class="title">직원 관리</p>
								<ul class="con">
									<li><a href="../employee/employeeSchedule.jsp">스케줄 확인</a></li>
									<li><a href="../employee/employeeList.jsp">직원 정보 관리</a></li>
									<li><a href="../employee/employeeMatching.jsp">고객-큐레이터<br>매칭 관리</a></li>
								</ul>
						</li>
						<li>
							<p class="title">상품 관리</p>
								<ul class="con">
									<li><a href="../product/productManagement.jsp">상품 정보 확인</a></li>
									<li><a href="../product/productStockManagement.jsp">상품 재고 확인</a></li>
									<li><a href="../product/productOrderManagement.jsp">발주 관리</a></li>
								</ul>
						</li>
						<li>
							<p class="title">주문 관리</p>
								<ul class="con">
									<li><a href="../order/cmOrderfavortie.jsp">선호도 조사 내역</a></li>
									<li><a href="../order/cmOrderCurating.jsp">큐레이팅 관리</a></li>
									<li>피드백 관리</li>
									<li><a href="../order/cmOrderRelease.jsp">출고 관리</a></li>
								</ul>
						</li>
						<li>
							<p class="title">교환 관리</p>
								<ul class="con">
									<li>교환 신청 확인</li>
									<li>회수 내역 관리</li>
									<li>교환 지급 품목 관리</li>
								</ul>
						</li>
						<li>
							<p class="title">설비 관리</p>
								<ul class="con">
									<li><a href="../equipment/equipmentList.jsp">보유 설비 관리</a></li>
									<li><a href="../equipment/rentalList.jsp">설비 대여 관리</a></li>
								</ul>
						</li>
						<li>
							<p class="title">정산 관리</p>
								<ul class="con">
									<li>정산 내역 관리</li>
								</ul>
						</li>
						<li>
							<p class="title">계약 관리</p>
								<ul class="con">
									<li>계약 내역 조회</li>
								</ul>
						</li>
					</ul>
				</div>	<!-- accodion-box end -->
			</div>	<!-- aside-body end -->
			<div id="logout-box" name="logout">
				로그아웃
			</div>	<!-- logout-box end -->
		</div>	<!-- div aside end -->
		
	</div>
	<script>
		$("p.title").on('click', function(){
			/* $(this).next(".con").slideToggle(300); */
			$(".con").not($(this).next(".con").slideToggle(300)).slideUp();
		});
	</script>
</body>
</html>