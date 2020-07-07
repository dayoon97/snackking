<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
.inner {
  max-width:1200px;
  height:50px;
  margin-left: 250px;
  padding:0 20px;
  display: inline-block;
  width: 1200px;
}
header {
  position:fixed;
  width:100%;
  top:0;
  left:0;
  height:50px;
  -webkit-transition-duration:0.4s;
  -webkit-transition-timing-function:ease;
  transition-duration:0.4s;
  transition-timing-function:ease;
  
}
header .logo_top {
  padding:5px 0 10px 10px;
  font-size:1.2rem;
  line-height:1em;
  font-weight:bold;
  display: inline-block;
}



.img_wrap {
  width:100%;
}
.img_wrap img {
  display:block;
  width:100%;
  margin:0;
}
section article {
  margin:30px 0;
  font-size:1rem;
  line-height:1.7em;
}
.down {
  background-color:#F0BB00;
  -webkit-transition-duration:0.4s;
  -webkit-transition-timing-function:ease;
  transition-duration:0.4s;
  transition-timing-function:ease;
}

.menu{
	display: inline-block;
	width:100px;
	height:50px;
	margin-left: 20px;
	margin-top:10px;
	font-size: 15px;
	
}
ul li {
	list-style-type:none;
	float: left;
	display: inline;
	margin-left: 20px;
	margin-top:15px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight:bold;
}
.menu-logo{
	margin-top: -10px;
}
.login{
	outline:0;
	border: 0;
	background: #F0BB00;
	border-radius: 999px;
	height:35px;
	width:80px;
}
.loginArea{
	width:100px;
	margin-left: 800px;
	margin-top: 8px;
}
</style>
</head>
<body>
<header>
  <div class="inner">
      	<ul>
      		<li><div class="menu-logo"><img src="/resources/image/logo5.png" style="width:100px;"></div></li>
      		<li>회사소개</li>
      <li class="loginArea">
      	<button class="login" id="login">로그인</button>
      </li>
      	</ul>
  </div>
</header>


<script>
$(function(){
	  var header = $('header'); //헤더를 변수에 넣기
	  var page = $('.page-start'); //색상이 변할 부분
	  var pageOffsetTop = page.offset().top; //색상 변할 부분의 top값 구하기
	  $(window).resize(function(){ //반응형을 대비하여 리사이즈시 top값을 다시 계산
	    pageOffsetTop = page.offset().top;
	  });
	  
	  $(window).on('scroll', function(){
	    if($(window).scrollTop() >= pageOffsetTop) { // 스크롤이 page보다 밑에 내려가면
	      header.addClass('down'); //클래스 추가
	      $("#login").css({"background":"white", "color":"black"});
	    } else { // 스크롤 올릴 때
	      header.removeClass('down'); //클래스 제거
	      $("#login").css({"background":"#F0BB00", "color":"white"});
	    }
	  });
	});
	


</script>
</body>
</html>