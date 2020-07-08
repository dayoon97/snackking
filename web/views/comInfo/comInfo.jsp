<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> 
<style>
body {
	background: white;
	font-family: 'NanumSquare', sans-serif !important; 
	overflow-x: hidden;
	margin: 0 auto;
	}
.wrapper{
	width:100%;
	height:3500px;
	margin:0 auto;
	}
.main1-1{
	width:1500px;
	height: 1100px;
	}
.main1-2{
	width:1500px;
	top:0;
	left:0;
}
.main2-2{
	width:1500px;
	height:1100px;
}


.main4-1{
	width:1500px;
	height:150px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="../common/index-menu.jsp" %>
		<div class="main1-1">
			<div class="main1-2">
				<img src="../../resources/image/main2.jpeg" width=1580px; height=850px; style="border-radius:50px;">
			<div class="page-start"></div>
			</div>
		</div>
		<div class="main2-1">
			<div class="main2-2">
				<div class="">회사라면 (집보다)간식이 더 맛있어야 합니다.</div>
				<div class="">저희</div><div class="">스낵</div><div class="">킹</div><div class="">에서는</div>
				
				<div class="">SAVE TIME (시간절약) : 마트를 방문하고 선택하는 고충을 들어드립니다.</div>
				<div class="">INTERESTING (흥미로운) : 다채로운 과자는 새로운 선택의 기쁨을 드립니다.</div>
				<div class="">DELICIOUS (맛있다) : 사무실의 모든 이들이 행복해 하는 맛이 있습니다.</div>
				<div class="">HEALTHIER (더 건강하게) : 즐거움과 더불어 건강함이 함께합니다.</div>
			</div>
		</div>
		<div class="main3-1">
		
		</div>
		<div class="4-1">
		<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</body>
</html>