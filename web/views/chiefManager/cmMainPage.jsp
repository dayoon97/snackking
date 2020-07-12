<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
<style type="text/css">
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
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../common/menu/cmMain.jsp" %>
	
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
	
</body>
</html>