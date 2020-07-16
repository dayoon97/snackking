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
	width:17%;
	border: 2px solid #FFC700;
}
.Article .article_wrap {
	position: relative;
	width: 1100px;
	margin: 0 auto;
	font-size: 12px;
}

.articleContentBox {
	display: block;
	margin-top: 15px;
	border: 1px solid gray;
	border-radius: 6px;
}
.article_header, .article_container{
	/* border: 1px solid black; */
	margin: 10px 10px;
	padding: 10px;
	text-align: center;
}
.ArticleTitle {
	font-size: 25px;
}
#categoryArea {
	display: inline-block;
	vertical-align: bottom;
}
#boardTitleArea {
	display: inline-block;
}
.content-box-title {
	display: inline-block;
	width: 950px;
	text-align: left;
	font-size: 20px;
	font-weight: 500;
	/* border: 1px solid black; */
	padding: 10px;
	background: #FFC700;
	border-radius: 10px;
}
.content-img-box{
	text-align: -webkit-center;
	/* border: 1px solid black; */
}
.content-img-box div{
	margin: 10px 10px;
	display: inline-block;
	width: 21%;
	height: 150px;
	border: 1px solid black;
	border-radius: 8px;
}

.content-text-box {
	/* border: 1px solid black; */
	text-align: center;
	margin-top: 10px;
}

.content-submit-area {
	height: 40px;
	vertical-align: middle;
	margin-top: 10px;
}

.submit-btn {
	display: inline-block;
	background: #FFC700;
	width: 100px;
	height: 25px;
	float: right;
	font-size: 20px;
	font-weight: 600;
	text-align: center;
	padding: 4px;
	padding-top: 9px;
	border-radius: 10px;
}

#bTitle {
	font-size: 20px;
	font-weight: 300;
	padding: 5px;
	padding-left: 10px;
}
.footerArea{
	margin-top: 100px;
	height:150px;
}
/*Styling Selectbox*/
.dropdown {
  width: 120px;
  display: inline-block;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 0 2px rgb(204, 204, 204);
  transition: all .5s ease;
  position: relative;
  font-size: 20px;
  color: #474747;
  height: 37px;
  text-align: left;
}
.dropdown .select {
	height: 35px;
    cursor: pointer;
    display: block;
    padding: 2px 10px;
}
.dropdown .select > i {
    font-size: 20px;
    color: #888;
    cursor: pointer;
    transition: all .3s ease-in-out;
    float: right;
    line-height: 20px;
}
.dropdown:hover {
    box-shadow: 0 0 4px rgb(204, 204, 204);
}
.dropdown:active {
    background-color: #f8f8f8;
}
.dropdown.active:hover,
.dropdown.active {
    box-shadow: 0 0 4px rgb(204, 204, 204);
    border-radius: 2px 2px 0 0;
    background-color: #f8f8f8;
}
.dropdown.active .select > i {
    transform: rotate(-90deg);
}
.dropdown .dropdown-menu {
    position: absolute;
    background-color: #fff;
    width: 100%;
    left: 0;
    margin-top: 1px;
    box-shadow: 0 1px 2px rgb(204, 204, 204);
    border-radius: 0 1px 2px 2px;
    overflow: hidden;
    display: none;
    max-height: 144px;
    overflow-y: auto;
    z-index: 9;
}
.dropdown .dropdown-menu li {
    padding: 10px;
    transition: all .2s ease-in-out;
    cursor: pointer;
} 
.dropdown .dropdown-menu {
    padding: 0;
    list-style: none;
}
.dropdown .dropdown-menu li:hover {
    background-color: #f2f2f2;
}
.dropdown .dropdown-menu li:active {
    background-color: #e2e2e2;
}
/* drowBox Css end */
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
		
		<div class="board-detail-header">문의 내역 작성</div>
		<div class="line"></div>
		
		<div class="Article">
			<div class="article_wrap">
				<form action="">
				<div class="articleContentBox">
				
					<div class="article_header">
						<div class="ArticleTitle">
							<div id="categoryArea">
							
								<div class="dropdown">
									<div class="select">
										<span style="vertical-align: -webkit-baseline-middle;">선택</span>
										<i class="fa fa-chevron-left"></i>
									</div>
									<ul class="dropdown-menu">
										<li id="etcBoard">기타문의</li>
										<li id="changeBoard">교환문의</li>
										<li id="feedbackBoard">피드백문의</li>
									</ul>
								</div>
								
							</div>
							<div id="boardTitleArea"><input type="text" id="bTitle" name="btitle" placeholder="제목을 입력해주세요." size="75"></div>
						</div>	<!-- ArticleTitle -->
					</div>	<!-- article_header -->
					
					<div class="article_container">
						<div class="article_content">
							<div class="content-box-title">사진 등록</div>
							<!-- 사진 올라가는 공간 -->
							<div class="content-img-box">
								<div>사진</div>
								<div>사진</div>
								<div>사진</div>
								<div>사진</div>
							</div>
							
							<div class="content-box-title">내용 등록</div>
							<!-- 텍스트 올라가는 공간 -->
							<div class="content-text-box">
								<textarea style="resize: none;" rows="20" cols="131"></textarea>
							</div>
							
							<div class="content-submit-area">
								<div class="submit-btn">작성하기</div>
							</div>
							
						</div>	<!-- article_content -->
						
					</div>	<!-- article_container -->
					
				</div>	<!-- articleContentBox end -->
			</form>
			</div>	<!-- article_wrap end -->
		</div>	<!-- Article end -->
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
	
	<div class="footerArea">
		<%@ include file="../common/footer.jsp" %>
	</div>
	
</div>	<!-- mainWrapper end -->

<script>
$('.dropdown').click(function() {
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown-menu').slideToggle(300);
});
$('.dropdown').focusout(function() {
	$(this).removeClass('active');
	$(this).find('.dropdown-menu').slideUp(300);
});
$('.dropdown .dropdown-menu li').click(function() {
	$(this).parents('.dropdown').find('span').text($(this).text());
	$(this).parents('.dropdown').find('input').attr('value',$(this).attr('id'));
});
/*End Dropdown Menu*/

$('.dropdown-menu li').click(function() {
	var input = '<strong>'+ $(this).parents('.dropdown').find('input').val() + '</strong>',
	msg = '<span class="msg">Hidden input value: ';
	$('.msg').html(msg + input + '</span>');
});
	
</script>
	
</body>
</html>