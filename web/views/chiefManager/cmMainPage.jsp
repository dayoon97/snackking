<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.user.model.vo.*, java.util.*, com.kh.snackking.board.model.vo.*, com.kh.snackking.adjustment.model.vo.*, com.kh.snackking.curating.model.vo.CurationList"%>
 <% ArrayList<User> list = (ArrayList<User>) request.getAttribute("list"); %>
 <% ArrayList<Board> Blist = (ArrayList<Board>) request.getAttribute("Blist"); %>
 <% ArrayList<Adjustment> Alist = (ArrayList<Adjustment>) request.getAttribute("Alist"); %>
 <% ArrayList<CurationList> Clist = (ArrayList<CurationList>) request.getAttribute("Clist"); %>
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

	<%@ include file="../common/userMenu.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
			
			<table id="info-table">
				<tr class="name-tr">
					<td>게시글 관리</td>
					<td>정산 상태</td>
				</tr>
				<tr class="content-tr">
					<td>
						<div id="con-board" class="conWrap">
							<div class="content1">새로운 게시글</div>
							<div class="alert-circle"><img alt="alert-circle" src="/snackking/resources/image/icon-alert-circle.png"></div>
							<% int w = Blist.size(); %>
							<div class="alert-number"><%=w %></div>
							<div class="line"></div>
							<div class="list-wrap">
								<table class="list">
									<tr>
										<td class="list-log" colspan="4">LOG</td>
									</tr>
									<% int j = 0; %>
									<% for(Board b : Blist) {%>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="/snackking/resources/image/up-alert.png"></td>
										<td class="list-reqNum"><% j++; %><%= j %></td>
										<td class="list-name"><%=b.getUserName() %></td>
										<td class="list-date"><%=b.getbDate() %></td>
									</tr>
									<% } %>
									
								</table>
							</div>
						</div>
					</td>
					<td>
						<div id="con-stock" class="conWrap">
							<div class="content1">정산 미지급 알림</div>
							<div class="alert-circle"><img alt="alert-circle" src="/snackking/resources/image/icon-alert-circle.png"></div>
							<% int e = Alist.size(); %>
							<div class="alert-number"><%= e %></div>
							<div class="line"></div>
							<div class="list-wrap">
								<table class="list">
									<tr>
										<td class="list-log" colspan="4">LOG</td>
									</tr>
									<% int q = 0; %>
									<%for(Adjustment a : Alist) {%>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="/snackking/resources/image/down-alert.png"></td>
										<td class="list-reqNum"><% q++; %><%= q %></td>
										<td class="list-name"><%=a.getCompany() %></td>
										<td class="list-date"><% if(a.getAdJustmentComplete().equals("N")) {%>
										미지급
										</td>
									</tr>
										<% } %>
									<% } %>
									
									
								</table>
							</div>
						</div>
					</td>
				</tr>
				<tr class="name-tr">
					<td>회원관리</td>
					<td>큐레이팅 알림</td>
				</tr>
				<tr class="content-tr">
					<td>
						<div id="con-member" class="conWrap">
							<div class="content1">새로운 회원 알림</div>
							<div class="alert-circle"><img alt="alert-circle" src="/snackking/resources/image/icon-alert-circle.png"></div>
							<%int p = list.size(); %>
							<div class="alert-number"><%= p %></div>
							<div class="line"></div>
							<div class="list-wrap">
								<table class="list">
									<tr>
										<td class="list-log" colspan="4">LOG</td>
									</tr>
									<% int k = 0; %>
									<% for(User u : list) {%>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="/snackking/resources/image/up-alert.png"></td>
										<td class="list-reqNum"><% k++; %><%= k %></td>
										<td class="list-name"><%=u.getUserName() %></td>
										<td class="list-date"><%=u.getEnrollDate() %></td>
									</tr>
									<% } %>
								</table>
							</div>
						</div>
					</td>
					<td>
						<div id="con-approval" class="conWrap">
							<div class="content1">큐레이팅 완료</div>
							<div class="alert-circle"><img alt="alert-circle" src="/snackking/resources/image/icon-alert-circle.png"></div>
							<%int c = Clist.size(); %>
							<div class="alert-number"><%= c%></div>
							<div class="line"></div>
							<div class="list-wrap">
								<table class="list">
									<tr>
										<td class="list-log" colspan="4">LOG</td>
									</tr>
									<% int a = 0; %>
									<% for (CurationList cu : Clist) {%>
									<tr>
										<td class="list-alert"><img alt="up-alert" src="/snackking/resources/image/up-alert.png"></td>
										<td class="list-reqNum"><% a++; %> <%= a %></td>
										<td class="list-name"><%=cu.getCompany() %></td>
										<td class="list-date"><% if(cu.getStatus().equals("Y")) {%>
										 큐레이팅 완료
										</td>
									</tr>
									<% } %>
									<% } %>
								
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