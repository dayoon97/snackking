<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.user.model.vo.User"%>
<% User loginUser = (User) session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>사용자 메뉴</title>
<style type="text/css">
	body {
		background-color:#F9F9F9;
		font-family: 'NanumSquare', sans-serif;
		font-weight: lighter;
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
		height: 85%;
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
		margin-top: 80px;
	}
	.list {
		padding: 0;
		list-style: none; 
		text-align:center;
	}
	p.title {
		width: 100%;
		box-sizing: border-box;
		font-weight: lighter;
		font-size: 20px;
		margin-top: 10px;
		margin-bottom: 15px;
		padding: 10px;
	}
	.con {
		padding-left: 0;
		padding-right: 55px;
		display: none;
		text-align: right;
		list-style: none;
	}
	.con>li {
		margin-top: 15px;
		margin-bottom: 10px;
	}
	#logout-box {
		background: #E1AB43;
		color: white;
		font-size: 20px;
		width: 180px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		margin: -60px auto;
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
	
	#line{
		border: 1px solid #BABABA; 
		width:80%; 
		height: 0px;
	}
	.user-menu-box{
		background: #DAAB52;
		border-radius: 10px;
		font-size:20px;
		color:white;
		width: 180px;
		height: 40px;
		margin: 0 auto;
		text-align: center;
		font-weight: lighter;
	}
	#outer {
		margin-left: 265px;
		margin-right: 35px;
		/* width: auto; */
		height: 100vh;
		position: relative;
	}
	#background-box {
		position: relative;
		width: 1092px;
		/* width: auto; */
		height: 700px;
		top: 15px;
		/* background: green; */
		border-radius: 12px;
		margin-left: auto;
		margin-right: auto;
	}

#mainWrapper {
	margin-left: auto;
	margin-right: auto;
	display: table;
}
	#info-table {
		width:1092px;
		height:700px;
	}
	.name-tr {
		height:50px;
	}
	.name-tr td {
		font-size: 20px;
		font-weight: 600;
	}
	.content-tr .conWrap {
		display: inline-block;
		height: 300px;
		width: 500px;
		background: white;
		border-radius: 10px;
	}
	.content1 {
		/* display:inline-block; */
		width: 200px;
		height: 30px;
		margin-top: 25px;
		margin-left: 20px;
		font-size: 18px;
		font-weight: 600;
	}
	.alert-circle {
		margin-top: 45px;
		display: inline-block;
		margin-left: 25px;
	}
	.alert-number {
		display: inline-block;
		float: right;
		margin-top: 45px;
		margin-right: 15px;
		font-weight: 800;
		font-size: 30px;
		font-family: 'Inter', sans-serif;
	}
	.conWrap .line {
		height: 0px;
		border: 1px solid #ECECEC;
	}
	.list-wrap {
		margin-top: 5px;
		/* margin-right: 15px; */
		width: 492px;
		height: 110px;
		overflow: auto;
		overflow-x: hidden;
	}
	.list-wrap::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	.list-wrap::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.list-wrap .list {
		width: 470px;
		margin: 0 10px;
		font-family: 'Inter', sans-serif;
		font-weight: bold;
		color: #26DE81;
	}
	.list-log {
		text-align: left;
		color: #868C90;
		padding-left: 18px;
	}
	.list-alert {
		padding-top: 3px;
		width: 70px;
	}
	.list-reqNum {
		width: 100px;
	}
	.list-name {
		width: 100px;
	}
	.list-date {
		width: 200px;
	}
	#con-stock .list {
		color: #FC5C65;
	}
	
	
</style>
</head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<!-- 일반 회원이거나 계약 회원일 경우 -->
	<% if(loginUser.gettCode().equals("T1") || loginUser.gettCode().equals("T2")) { %>
	<div id="wrap" style="display: block;">
		<!-- aside div start -->
		<div id="aside" class="aside">
			<div class="aside-header" align="center">
				<a href="../../index.jsp">
					<img alt="logoImage" src="../../resources/image/logo3.png" width="150px;">
				</a>
			</div>	<!-- aisde-header end -->
			<div class="aside-body">
				<div class="aside-body-header">
					<div class="login-info" align="center">
						<div class="login-name"><%=loginUser.getUserName() %> 님</div>
						<div id="line"></div>
					</div>	<!-- login-info end -->
				</div>	<!-- aisde-body-header end -->
				<div class="aside-body-body" id="accodion-box">
					<ul class="list">
						<li><div class="user-menu-box">
								<p class="title">내 정보</p>
							</div>
								<ul class="con">
									<li><a href="../common/userBoard.jsp">나의 문의내역</a></li>
									<li><a href="">회원정보 수정</a></li>
								</ul>
						</li>
						<li><div class="user-menu-box">
								<p class="title">주문관리</p>
							</div>
								<ul class="con">
									<li><a href="../common/userOrderHistory.jsp">주문내역 관리</a></li>
								</ul>
						</li>
						<li><div class="user-menu-box">
								<p class="title">선호도조사</p>
							</div>
								<ul class="con">
									<li><a href="../curator/preference.jsp">선호도 조사</a></li>
									<li><a href="../">선호도 조사 내역</a></li>
								</ul>
						</li>
					</ul>
				</div>	<!-- accodion-box end -->
			</div>	<!-- aside-body end -->
			<div id="logout-box" name="logout" class="logout">
				로그아웃
			</div>	<!-- logout-box end -->
		</div>	<!-- div aside end -->
		
	</div>
	<!-- T3 최고관리자 -->
	<%}else if((loginUser.gettCode().equals("T3"))){ %>
		<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../common/cmMain.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
			
			<table id="info-table">
				<tr class="name-tr">
					<td>게시글 관리</td>
					<td>재고 상태</td>
				</tr>
				<tr class="content-tr">
					<td>
						<div id="con-board" class="conWrap">
							<div class="content1">새로운 게시글</div>
							<div class="alert-circle"><img alt="alert-circle" src="../../resources/image/icon-alert-circle.png"></div>
							<div class="alert-number">3</div>
							<div class="line"></div>
							<div class="list-wrap">
								<table class="list">
									<tr>
										<td class="list-log" colspan="4">LOG</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
					<td>
						<div id="con-stock" class="conWrap">
							<div class="content1">부족한 재고 알림</div>
							<div class="alert-circle"><img alt="alert-circle" src="../../resources/image/icon-alert-circle.png"></div>
							<div class="alert-number">13</div>
							<div class="line"></div>
							<div class="list-wrap">
								<table class="list">
									<tr>
										<td class="list-log" colspan="4">LOG</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/down-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/down-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/down-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/down-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/down-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/down-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									
								</table>
							</div>
						</div>
					</td>
				</tr>
				<tr class="name-tr">
					<td>회원관리</td>
					<td>승인 요청 내역</td>
				</tr>
				<tr class="content-tr">
					<td>
						<div id="con-member" class="conWrap">
							<div class="content1">새로운 회원 알림</div>
							<div class="alert-circle"><img alt="alert-circle" src="../../resources/image/icon-alert-circle.png"></div>
							<div class="alert-number">3</div>
							<div class="line"></div>
							<div class="list-wrap">
								<table class="list">
									<tr>
										<td class="list-log" colspan="4">LOG</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
					<td>
						<div id="con-approval" class="conWrap">
							<div class="content1">승인 대기 요청</div>
							<div class="alert-circle"><img alt="alert-circle" src="../../resources/image/icon-alert-circle.png"></div>
							<div class="alert-number">3</div>
							<div class="line"></div>
							<div class="list-wrap">
								<table class="list">
									<tr>
										<td class="list-log" colspan="4">LOG</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td class="list-reqNum">1</td>
										<td class="list-name">이재형</td>
										<td class="list-date">2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="../../resources/image/up-alert.png"></td>
										<td>1</td>
										<td>이재형</td>
										<td>2020.07.06</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->
	
	
	<!-- T4 큐레이터 -->	
	<%}else if((loginUser.gettCode().equals("T4"))){ %>
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
						<div class="login-name"><%=loginUser.getUserName() %> 님</div>
						<div id="line" style="border:1px solid #AA8400; width:60%; background-color: #AA8400"></div>
						<div class="login-jobname">큐레이터</div>
					</div>	<!-- login-info end -->
				</div>	<!-- aisde-body-header end -->
				<div class="aside-body-body" id="accodion-box">
					<ul class="list">
						<li>
							<p class="title">회원 관리</p>
								<ul class="con">
									<li><a href="<%=request.getContextPath()%>/selectUserList.us">담당회원 리스트</a></li>
									<li><a href="">회원 문의 내역</a></li>
								</ul>
						</li>
						<li>
							<p class="title">스케줄관리</p>
								<ul class="con">
									<li><a href="">개인 스케줄 관리</a></li>
								</ul>
						</li>
						<li>
							<p class="title">상품 관리</p>
								<ul class="con">
									<li><a href="">상품 정보</a></li>
									<li><a href="">상품 재고</a></li>
								</ul>
						</li>
						<li>
							<p class="title">주문 관리</p>
								<ul class="con">
									<li><a href="">선호도 조사 내역</a></li>
									<li><a href="">큐레이팅 관리</a></li>
									<li><a href="">교환 관리</a></li>
									<li><a href="">회수 관리</a></li>
									<li><a href="">설비 관리</a></li>
									<li><a href="">거래명세서 관리</a></li>
									<li><a href="">정산 관리</a></li>
								</ul>
						</li>
						<li>
							<p class="title">계약 관리</p>
								<ul class="con">
									<li><a href="">계약 내역 조회</a></li>
								</ul>
						</li>
					</ul>
				</div>	<!-- accodion-box end -->
			</div>	<!-- aside-body end -->
			<div id="logout-box" name="logout" class="logout">
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
	
	<!-- T5 물류관리자 -->
	<%}else { %>
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
						<div class="login-name">독고미소</div>
						<div id="line" style="border:1px solid #AA8400; width:60%; background-color: #AA8400"></div>
						<div class="login-jobname">물류관리</div>
					</div>	<!-- login-info end -->
				</div>	<!-- aisde-body-header end -->
				<div class="aside-body-body" id="accodion-box">
					<ul class="list">
						<li>
							<p class="title">재고 관리</p>
								<ul class="con">
									<li><a href="">재고 리스트</a></li>
								</ul>
						</li>
						<li>
							<p class="title">스케줄 관리</p>
								<ul class="con">
									<li><a href="">전체 스케줄 관리</a></li>
								</ul>
						</li>
						<li>
							<p class="title">출고 관리</p>
								<ul class="con">
									<li><a href="">날짜별 피킹 리스트</a></li>
								</ul>
						</li>
						<li>
							<p class="title">입고 관리</p>
								<ul class="con">
									<li><a href="">입고 리스트</a></li>
								</ul>
						</li>
						<li>
							<p class="title">발주 관리</p>
								<ul class="con">
									<li>발주 품목 리스트</li>
								</ul>
						</li>
						<li>
							<p class="title">교환 관리</p>
								<ul class="con">
									<li>교환 품목 리스트</li>
								</ul>
						</li>
					</ul>
				</div>	<!-- accodion-box end -->
			</div>	<!-- aside-body end -->
			<div id="logout-box" name="logout" class="logout">
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
	
	
	<%} %>
	
	<script>
	$(".user-menu-box").click(function(){
		$(this).next(".con").slideToggle(200);
		$(this).css({"background":"#CD8700"});
	});
		
	$(".user-menu-box").mouseout(function(){
		$(this).css({"background":"#DAAB52"});
	});
		
	
	$(".logout").click(function() {
		location.href="<%=request.getContextPath()%>/logout";
	});
	
	
	</script>
</body>
</html>