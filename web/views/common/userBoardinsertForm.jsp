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
	width: 220px;
	height: 150px;
	border: 1px solid black;
	border-radius: 8px;
}
.imgArea:hover {
	cursor: pointer;
	border: 2px solid red;
}
.imgContent {
	border-radius: 8px;
	/* display: none; */
}
img {
	border: 0px;
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
.submit-btn:hover {
	cursor: pointer;
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
				<form id="articleForm" action="<%= request.getContextPath()%>/insert.bo" method="post" encType="multipart/form-data">
				<div class="articleContentBox">
				
					<div class="article_header">
						<div class="ArticleTitle">
							<div id="categoryArea">
								
								<input type="hidden" name="bWriter" value="<%=loginUser.getUserNo()%>">
								
								<div class="dropdown">
									<div class="select">
										<span style="vertical-align: -webkit-baseline-middle;">선택</span>
										<i class="fa fa-chevron-left"></i>
									</div>
									<input type="hidden" name="boardType" id="boardType" value="">
									<ul class="dropdown-menu">
										<li id="BT1">기타문의</li>
										<li id="BT2">교환문의</li>
										<li id="BT3">피드백문의</li>
									</ul>
								</div>
								
							</div>
							<div id="boardTitleArea"><input type="text" id="bTitle" name="btitle" placeholder="제목을 입력해주세요." size="75" autocomplete="off"></div>
						</div>	<!-- ArticleTitle -->
					</div>	<!-- article_header -->
					
					<div class="article_container">
						<div class="article_content">
							<div class="content-box-title">사진 등록</div>
							<!-- 사진 올라가는 공간 -->
							<div class="content-img-box">
								<div id="imgArea1" class="imgArea">
									<img id="img1" class="imgContent" width="220" height="150">
								</div>
								<div id="imgArea2" class="imgArea">
									<img id="img2" class="imgContent" width="220" height="150">
								</div>
								<div id="imgArea3" class="imgArea">
									<img id="img3" class="imgContent" width="220" height="150">
								</div>
								<div id="imgArea4" class="imgArea">
									<img id="img4" class="imgContent" width="220" height="150">
								</div>
							</div>
							<div id="fileArea">
								<input type="file" id="imgFile1" name="imgFile1" onchange="loadImg(this, 1);">
								<input type="file" id="imgFile2" name="imgFile2" onchange="loadImg(this, 2);">
								<input type="file" id="imgFile3" name="imgFile3" onchange="loadImg(this, 3);">
								<input type="file" id="imgFile4" name="imgFile4" onchange="loadImg(this, 4);">
							</div>
							<div class="content-box-title">내용 등록</div>
							<!-- 텍스트 올라가는 공간 -->
							<div class="content-text-box">
								<textarea id="content" name="content" style="resize: none;" rows="20" cols="131"></textarea>
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
	
$(function() {
	$("#fileArea").hide();
	
	$("#imgArea1").click(function() {
		$("#imgFile1").click();
	});
	$("#imgArea2").click(function() {
		$("#imgFile2").click();
	});
	$("#imgArea3").click(function() {
		$("#imgFile3").click();
	});
	$("#imgArea4").click(function() {
		$("#imgFile4").click();
	});
});

function loadImg(value, num) {
	if(value.files && value.files[0]) {
		var reader = new FileReader();
		
		reader.onload = function(e) {
			switch(num) {
			case 1 : $("#img1").attr("src", e.target.result); break;
			case 2 : $("#img2").attr("src", e.target.result); break;
			case 3 : $("#img3").attr("src", e.target.result); break;
			case 4 : $("#img4").attr("src", e.target.result); break;
			}
		}
		reader.readAsDataURL(value.files[0]);
	}	
}

$(".submit-btn").click(function() {
	
	var btype = $("#boardType").val();
	var btitle = $("#bTitle").val();
	var bcontent = $("#content").val();
	
	if(btype != "" && btitle != "" && bcontent != "") {
		$("#articleForm").submit();
	} else {
		if(btype == ""){
			alert("게시물 타입을 설정해주세요!");
		} else if (btitle == ""){
			alert("제목을 입력해주세요!");
		} else {
			alert("내용을 입력해주세요!");
		}
	}
	
});
</script>
	
</body>
</html>