<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.user.model.vo.User"%>
<% User loginUser = (User) session.getAttribute("loginUser"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
.inner {
  max-width:1400px;
  height:50px;
  margin-left: 250px;
  padding:0 20px;
  display: inline-block;
  width: 1400px;
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
  z-index: 1;
  
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
.loginName{
	outline:0;
	border: 0;
	background: #F0BB00;
	border-radius: 999px;
	height:35px;
	width:110px;
}

.logout{
	outline:0;
	border: 0;
	background: #F0BB00;
	border-radius: 999px;
	height:35px;
	width:80px;
}


.loginArea{
	width:300px;
	margin-left: 800px;
	margin-top: 8px;
}
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover {text-decoration: none;}
 
.userNameBox{
position: absolute;
left: 0px;
right: 0px;
top: 0px;
bottom: 0px;
text-align: right;
letter-spacing: 2.5px;
text-transform: uppercase;

color: #FFFFFF;
background: #F0BB00;
border-radius: 999px;
}


</style>
</head>
<body>
<header>
  <div class="inner">
      	<ul>
      		<li id="goMain"><div class="menu-logo"><img src="/snackking/resources/image/logo5.png" style="width:100px;"></div></li>
      		<li><a href="./views/comInfo/comInfo.jsp">회사소개</a></li>
      		<li class="loginArea">
			<% if(loginUser == null) { %>
      			<button class="login" id="login" onclick="location.href='/snackking/views/common/login.jsp'">로그인</button>
      		<% } else {
      			if(loginUser.gettCode() == "T1" || loginUser.gettCode() == "T2") {%>
      		    <button class="loginName" id="login" onclick="location.href='<%= request.getContextPath()%>/selectPre.pre?num=<%=loginUser.getUserNo()%>'"><%=loginUser.getUserName() %>님</button>
      		    <%}else { %>
      		    <button class="loginName" id="login" onclick="location.href='/snackking/views/common/userMenu.jsp'"><%=loginUser.getUserName() %>님</button>
      		    <%} %>
      		    <button class="logout" id="logout" onclick="logout();">로그아웃</button>
			<%} %>      		
      		
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
	
	$("#goMain").click(function() {
		location.href = "<%=request.getContextPath()%>";
	});
	
	
	
	function logout() {
			location.href="<%=request.getContextPath()%>/logout";
		}
</script>
</body>
</html>