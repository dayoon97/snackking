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
.article_header, .article_container{
	border: 1px solid black;
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
}
.content-text-box {
	border-bottom: 1px solid black;
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
							<div id="categoryArea">[기타문의]</div>
							<div id="boardTitleArea">글 제목 입니다.</div>
						</div>	<!-- ArticleTitle -->
						<div class="WriterInfo">
							<div id="writerName">이재형</div>
							<span id="writeDate">2020.07.16. 12:00</span>
							<span id="boardCount">조회수 : 0</span>
							<span id="replyCount">댓글 : 0</span>
						</div>
					</div>	<!-- article_header -->
					
					<div class="article_container">
						<div class="article_content">
							<!-- 사진 올라가는 공간 -->
							<div class="content-img-box">
								<div style="width: 600px; height: 400px; background: lightgray;">사진</div>
								<div style="width: 300px; height: 150px; background: lightgray;">사진</div>
								<div style="width: 200px; height: 300px; background: lightgray;">사진</div>
							</div>
							
							<!-- 텍스트 올라가는 공간 -->
							<div class="content-text-box">
								<p>얄라리 얄라리 얄라리</p>
							</div>
							
						</div>	<!-- article_content -->
						
						<div class="reply-box">
							<div class="reply-box-title">댓글</div>
							<table border="1">
								<tr>
									<td style="font-size: 15px; font-weight: 600; padding-top: 10px; padding-right: 10px; padding-left: 10px;">최고미소</td>
								</tr>
								<tr>
									<td style="padding-top: 10px; padding-right: 10px; padding-left: 10px;">시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~시러용~</td>
								</tr>
								<tr>
									<td style="padding-top: 10px; padding-right: 10px; padding-left: 10px;">2020.07.16. 14:52</td>
								</tr>
							</table>
							<div style="border: 1px solid black;">
								
							</div>
						</div>	<!-- reply-box -->
					</div>	<!-- article_container -->
					
				</div>	<!-- articleContentBox end -->
			
			</div>	<!-- article_wrap end -->
		</div>	<!-- Article end -->
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

<script>
	
</script>
	
</body>
</html>