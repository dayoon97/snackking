<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.awt.*, java.util.*, com.kh.snackking.board.model.vo.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
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
span.msg,
span.choose {
  color: #555;
  padding: 5px 0 10px;
  display: inherit
}
.container {
  width: 500px;
  margin: 50px auto 0;
  text-align: center
}

.footerArea{
	height:150px;
}
.orderArea{
	height:850px;
	width:1200px;
	margin:0 auto;
}
.order-table{
	width:1100px;
	height:700px;
	margin-left: 100px;
}
.order-History{
	font-size: 30px;
	text-align: center;
	margin-top: 20px;
}
.order-history-table{
	margin-top: 50px;
	padding: 1px;
	width:100%;
}
td{
	border-bottom: 1px solid #E8E8E8;
	height: 50px;
	text-align: center;
}
.order-td:hover{
	background: white;
	cursor: pointer;
}
th{
	height: 40px;
	border-bottom: 1px solid #FFC700;
	background: #F0BB00;
	color: white;
	font-weight: lighter;
}

.line{
	margin:0 auto;
	margin-top: 5px;
	width:10%;
	border: 2px solid #FFC700;
}
.searchArea{
	margin-left: 750px;
	margin-top: 30px;
}


input[type='text']{
	width:92px;
	height:28px;
	background: #F0F0F0;
	border: 0;
	outline: 0;
	color: #D8D8D8;
}
.submit-btn{
	border:0;
	outline:0;
	width: 92px;
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
.submit-btn:hover {
	cursor: pointer;
}
input[type='checkbox']{
	border: 1px solid #F0BB00;
}
.write{
	float: right;
	margin-top: 60px;
}
.delete{
	margin-left: 1000px;
	margin-top:60px;
	background: white;
	color:#F0BB00;
	border: 1px solid #F0BB00;
}
.btnArea{
	height:200px;
	width:1200px;
	margin:0 auto;
}
.pagingArea button {
	border: 0;
	outline: 0;
	font-size: 20px;
	background-color: rgba(0, 0, 0, 0);
}
.pagingArea button:hover {
	cursor: pointer;
	color: #F0BB00;
}
</style>
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">
	<%@ include file="../common/userMenu.jsp" %>
	<div class="nav">
			<div class="snack-nav">
				<div class="snack-logo" style></div>
			</div>
	</div>
	<div class="outer">
		<div class="orderArea">
			<div class="order-table">
				<p class="order-History">문의 내역</p>
				<div class="line"></div>
				<table id="boardList" class="order-history-table" align="center">
					<tr>
						<th width="40px;"><input type="checkbox"></th>
						<th width="60px;">번호</th>
						<th width="100px;">구분</th>
						<th width="400px;">제목</th>
						<th width="150px;">날짜</th>
						<th width="80px;">상태</th>
					</tr>
					<% for(Board b : list) { %>
						<tr class="order-td">
							<input id="cBid" name="cBid" type="hidden" value="<%=b.getBid()%>">
							<td><input type="checkbox"></td>
							<td><%= b.getrNum() %></td>
							<td><%= b.getBtName() %></td>
							<td><%= b.getbTitle() %></td>
							<td><%= b.getbDate() %></td>
							<td><%= b.getAnswerCheck() %></td>
						</tr>
					<% } %>
				</table>
			</div>
			<!-- pagingArea(페이징 처리 버튼) start -->
			<div class="pagingArea" align="center">
				<button onclick="location.href='<%=request.getContextPath()%>/selectBoardList.bo?currentPage=1'"><<</button>
				
				<% if(currentPage <= 1) { %>
					<button disabled><</button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectBoardList.bo?currentPage=<%=currentPage - 1%>'"><</button>
				<% } %>
				
				<% for(int p = startPage; p <= endPage; p++) {
					if(p == currentPage) { %>
						<button disabled><%= p %></button>
					<% } else { %>
						<button onclick="location.href='<%=request.getContextPath()%>/selectBoardList.bo?currentPage=<%=p%>'"><%= p %></button>
					<% }
				} %>
				
				
				<% if(currentPage >= maxPage) { %>
					<button disabled>></button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectBoardList.bo?currentPage=<%=currentPage + 1%>'">></button>
				<% } %>
				
				<button onclick="location.href='<%=request.getContextPath()%>/selectBoardList.bo?currentPage=<%=maxPage%>'">>></button>
			</div>	<!-- pagingArea end -->
			<div class="btnArea">
				<input type="button" value="글쓰기" id="write-btn" class="submit-btn write">
				<input type="button" value="삭제" class="submit-btn delete">
			</div>
		</div>
	</div>
	
	
	<div class="footerArea">
	<%@ include file="../common/footer.jsp" %>
	</div>
</div>	<!-- mainWrapper end -->

<script>
	$("#write-btn").click(function() {
		location.href='/snackking/views/common/userBoardinsertForm.jsp';
	});
	
	$(function() {
		$("#boardList td").click(function() {
			var num = $(this).parent().children("input").val();
			location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
		});
	});
	
</script>
	
</body>
</html>