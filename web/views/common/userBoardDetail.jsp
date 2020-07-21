<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.snackking.board.model.vo.*" %>
<%
	Map<String, Object> boardMap = (HashMap<String, Object>) request.getAttribute("boardMap");
	Board board = (Board) boardMap.get("Board");
	ArrayList<Attachment> atlist = (ArrayList<Attachment>) boardMap.get("Attachment");
	
	Attachment[] atArr = new Attachment[4];
	/* for(int i = 0; i < atlist.size(); i++) {
		atArr[i] = atlist.get(i);
	} */
	
	Reply reply = (Reply) boardMap.get("Reply");
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
	overflow-x: hidden;
}
#outer {
	margin-left: 265px;
	margin-right: 35px;
	/* height: 100vh; */
	width: 1220px;
	position: relative;
}
.board-detail-header {
	font-size: 30px;
	text-align: center;
	padding-top: 15px;
}
.line{
	margin:0 auto;
	margin-top: 5px;
	width:19%;
	border: 2px solid #FFC700;
}
.Article .article_wrap {
	position: relative;
	width: 1100px;
	margin: 0 auto;
	font-size: 12px;
}
.topBtnWrap {
	height: 36px;
}
.listBtn-top {
	background: silver;
	float: right;
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
	min-width: 46px;
    height: 36px;
    margin-left: 10px;
    margin-top: 10px;
    padding: 0 12px;
    font-size: 13px;
    line-height: 36px;
}
.articleContentBox {
	display: block;
	margin-top: 15px;
	border: 1px solid gray;
	border-radius: 6px;
}
.article_header{
	border-bottom: 1px solid black;
	margin: 10px 10px;
	padding: 10px;
}
.article_container{
	margin: 10px 10px;
	padding: 10px;
}
.ArticleTitle {
	font-size: 25px;
	padding-bottom: 10px;
}
#categoryArea {
	display: inline-block;
}
#boardTitleArea {
	display: inline-block;
}
.WriterInfo {
	font-size: 15px;
}
#writerName {
	padding-bottom: 5px;
}
#boardCount {
	padding-left: 10px;
}
#replyCount {
	float: right;
}
.article_container {
	padding-top: 30px;
}
.content-img-box{
	text-align: -webkit-center;
	border-bottom: 1px solid black;
	padding: 15px;
}
.imgBox {
	margin: 10px auto;
}
.content-text-box {
	border-bottom: 1px solid black;
	font-size: 20px;
	padding: 10px;
}
.content-img-box div{
	margin: 10px 10px;
}
.reply-box {
	margin-top: 10px;
}
.reply-box-title {
	font-size: 20px;
	font-weight: 600;
	margin-top: 10px;
	margin-bottom: 10px;
	padding-left: 10px;
}
.writeReply {
	margin-top: 10px;
	margin-bottom: 20px;
	padding: 15px;
	border: 2px solid lightgray;
	border-radius: 5px;
	background: white;
}
.replyWriter{
	font-size: 15px;
}
#replyTname{
	font-weight: 400;
}
.reply-box-writer {
	font-size: 15px;
	font-weight: 600;
	padding-top: 10px;
	padding-right: 10px;
	padding-left: 10px;
}
.reply-box-content{
	padding-top: 10px;
	padding-right: 10px;
	padding-left: 10px;
}
.reply-box-date{
	padding-top: 10px;
	padding-right: 10px;
	padding-left: 10px;
}
#reply-btn {
	background-color: #FFC700;
	border: 0;
	outline: 0;
	font-weight: 400;
	border-radius: 5px;
}
#reply-btn:hover {
	cursor: pointer;
	color: white;
}
</style>
</head>
<body style="overflow-x: hidden;">
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../common/userMenu.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
		
		<div class="board-detail-header">
			게시글 상세보기
		</div>
		<div class="line"></div>
		
		<div class="Article">
			<div class="article_wrap">
				<div class="topBtnWrap">
					<div class="listBtn-top">목록</div>
				</div>
				
				<div class="articleContentBox">
				
					<div class="article_header">
						<div class="ArticleTitle">
							<div id="categoryArea">[<%= board.getBtName() %>]</div>
							<div id="boardTitleArea"><%= board.getbTitle() %></div>
						</div>	<!-- ArticleTitle -->
						<div class="WriterInfo">
							<div id="writerName"><%= board.getUserName() %></div>
							<span id="writeDate"><%= board.getbDate() %></span>
							<span id="boardCount">조회수 : <%= board.getbCount() %></span>
							<span id="replyCount"><%= board.getAnswerCheck() %></span>
						</div>
					</div>	<!-- article_header -->
					
					<div class="article_container">
						<div class="article_content">
							<!-- 사진 올라가는 공간 -->
							<% if(atlist.size() > 0) { %>
							<div class="content-img-box">
								<% for(int i = 0; i < atlist.size(); i++) {
										atArr[i] = atlist.get(i);
								%>
										<img class="imgBox" style="max-width: 80%" alt="picture" src="<%=request.getContextPath()%>/board_uploadImages/<%=atArr[i].getChangeName()%>">
								<% } %>
							</div>
							<% } %>
							
							<!-- 텍스트 올라가는 공간 -->
							<div class="content-text-box">
								<!-- <p>얄라리 얄라리 얄라리</p> -->
								<%= board.getbContent() %>
							</div>
							
						</div>	<!-- article_content -->
						
						<div class="reply-box">
							<div class="reply-box-title">댓글</div>
							<% if(reply != null) { %>
							<table>
								<tr>
									<td class="reply-box-writer"><%= reply.getUserName() %></td>
								</tr>
								<tr>
									<td class="reply-box-content"><%= reply.getrContent() %></td>
								</tr>
								<tr>
									<td class="reply-box-date"><%= reply.getrDate() %></td>
								</tr>
							</table>
							<% } else { %>
							<div style="padding-left: 10px; font-size: 15px;">댓글이 없습니다.</div>
							<% } %>
							<% if(loginUser.gettCode().equals("T3") || loginUser.gettCode().equals("T4")) { %>
							<div class="writeReply">
								<div class="replyWriter">
									<span id="replyTname"><%= loginUser.gettName() %></span>&nbsp;&nbsp;
									<span id="replyName"><%= loginUser.getUserName() %></span>
								</div>
								<div style="margin-top: 5px;">
									<textarea onkeydown="resize(this)" onkeyup="resize(this)" class="reply-area" rows="2" cols="140" placeholder="댓글을 입력해주세요." style="overflow: hidden; resize: none; border: 0;"></textarea>
								</div>
								<div style="height:25px; margin-top: 5px;">
									<div style="display: inline-block; float: right;"><input type="button" id="reply-btn" value="등록"></div>
								</div>
							</div>
							<% } %>
						</div>	<!-- reply-box -->
					</div>	<!-- article_container -->
					
				</div>	<!-- articleContentBox end -->
			
			</div>	<!-- article_wrap end -->
		</div>	<!-- Article end -->
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

<script>
	/* $(".listBtn-top").onclick(function() {
		
	}); */
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12+obj.scrollHeight)+"px";
	}
	$("#reply-btn").click(function() {
		var bid = <%= board.getBid()%>;
		var rContent = $(".reply-area").val();
		var rWriter = <%= loginUser.getUserNo() %>;
		
		$.ajax({
			url: "<%= request.getContextPath() %>/insertReply.bo",
			type: "post",
			data: {
				bid: bid,
				rContent: rContent,
				rWriter: rWriter
			},
			success: function(data) {
				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + bid;
			},
			error: function() {
				alert("Error!");
			}
		});
	});
</script>
	
</body>
</html>