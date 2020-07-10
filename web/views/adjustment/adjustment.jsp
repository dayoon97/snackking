<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		background: white;
		border-radius: 12px;
		margin-left: auto;
		margin-right: auto;
	}
			
	/*본문영역 상단부*/
	#titleArea {
		position: relative;
		height: 20%;
	
	}
	/*본문 영역 제목*/
	#mainTitle {
		position: absolute;
		width: 250px;
		height: 100px;
		left: 30px;
		font-family: NanumSquare_ac;
		font-style: normal;
		font-weight: normal;
		font-size: 35px;
		line-height: 53px;
		display: flex;
		align-items: center;
		color: #232323;	
	}
	
	/*본문 영역 제목 밑에있는 선*/
	#line1 {
		position: absolute;
		width: 170px;
		height: 0px;
		left: 30px;
		top: 80px;
		border: 1px solid #666666;
	}
	
	/*본문 영역 소제목*/
	#subTitle {
		position: absolute;
		width: 250px;
		height: 50px;
		left: 30px;
		top: 78px;
		font-family: NanumSquare_ac;
		font-style: normal;
		font-size: 25px;
		line-height: 40px;
		display: flex;
		align-items: center;
		color: #343434;
	}
	/*조회 제목 스타일*/
	#subSubTitle1{
		position: absolute;
		/* width: 69px; */
		height: 30px;
		left: 40px;
		top: 150px;
		/* font-family: NanumSquare_ac; */
		font-style: normal;
		font-weight: bold;
		font-size: 18px;
		/* line-height: 20px; */
		display: flex;
		align-items: center;
		/* color: #000000; */
	}
	/*조회 상자 테두리*/
	#searchBox{
		position: absolute;
		width: 980px;
		height: 60px;
		left: 40px;
		right: 40px;
		margin: 0 auto;
		top: 190px;
		border: 1px solid rgba(75, 75, 75, 0.23);
		box-sizing: border-box;
		border-radius: 33.5px;
	}
	/*폼 기본 서식*/
	#searchForm{
		height:100%;
		margin: 0 auto;
		padding-left:20px;
	}
	/*테이블 기본 서식*/
	.memberTable, #listTable{
		width: 950px;
		margin-top: 10px;
		margin-left: 10px;
	}

	/*td 글자 스타일 지정*/
  	.memberTable>td{
		height: 30px;
		font-family: NanumSquare_ac;
		font-style: normal;
		font-weight: normal;
		font-size: 15px;
		color: #000000;
		padding-top:5px;
		padding-left:0;	
	}
	 
	
	
	/*검색 내용 타이핑하는 부분, input 태그*/
 	.searchTextBox{
		border:0;
		outline:0;
		height: 20px;
		padding:0;
		margin:0;
		background: #F6F1F1;
	}
	
	/*노란 버튼 공통 스타일*/
 	.searchBtn{
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

/*조회 결과 리스트 제목 스타일*/
#subSubTitle2{
position: absolute;
width: 90px;
height: 30px;
left: 40px;
top: 280px;
font-family: NanumSquare_ac;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 20px;
display: flex;
align-items: center;
color: #000000;
}

/*적용 버튼*/
#apply{
position:absolute;	
top:300px;
right:90px;
}

#listTable{
border-collapse:collapse;
position: absolute;
top:330px;
left:45px;
text-align:center;
}


/*조회 리스트 테이블 listHead*/
#listHead{
width: 1400px;
height: 31px;
padding-left:20px;
background: #FBFAFA;
box-sizing:border-box;
border-radius: 300px 0 0 300px;
}

/*조회 리스트 부분 테이블 헤더 폰트 스타일*/
.listHead th{
padding:4px;
font-size:15px;
line-height:17px;
}

/* 리스트 바디 하위 td 테이블 선 스타일*/
.listBody>td{
border-bottom:3px solid #EBEAEA;
height: 25px;
}

/* .listBody:hover{
	cursor:pointer;
	background: #F0BB00;
} */

.searchBtn:hover {
	cursor: pointer;
}
.delBtn {
	font-size: 8px;
	font-weight: bold;
	width:50px;
	height: 15px;
	line-height: 15px;
	margin: 0 auto;
	border-radius: 5px;
	color: white;
}
.delBtn:hover {
	cursor: pointer;
}
.okBtn {
	margin-bottom: 1px;
	background: red;
}
.cancleBtn {
	background: green;
}

/* drowBox Css start */
span.msg,
span.choose {
  color: #555;
  padding: 5px 0 10px;
  display: inherit;
}
.container {
  width: 500px;
  margin: 50px auto 0;
  text-align: center;
}

/*Styling Selectbox*/
.dropdown {
  width: 90px;
  display: inline-block;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 0 2px rgb(204, 204, 204);
  transition: all .5s ease;
  position: relative;
  font-size: 14px;
  color: #474747;
  height: 20px;
  text-align: left;
}
.dropdown .select {
    cursor: pointer;
    display: block;
    padding: 2px 10px;
}
.dropdown .select > i {
    font-size: 13px;
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
#mainWrapper {
	margin-left: auto;
	margin-right: auto;
	display: table;
}
/*-----------------------추가한 CSS-----------------------------------------------------*/

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 8% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
  height: 130%;
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
td {
	text-align: center;
}





/*---상품등록 테이블 관련--------------------------------------------------*/
#addProductTable{
font-size:15px;
line-height:17px;
border:1px solid black;
margin-left: 40px;

/*겉에 테두리 만들어줌.. 회색 테두리*/
border: 1px solid rgba(75, 75, 75, 0.23);
border-radius: 33.5px;
height: 510px;
width: 950px;

}
/*10칸짜리 마지막행 높이 제거*/
#addProductTable :nth-child(13) td{
font-size: 0;
height: 0;
padding: 0;
border-bottom-style: none;
border-right-style: none;
border-left-style: none;
}

/*체크박스랑 테이블 안에 글자 높이 안맞음*/
input[class="a"] {
  position: relative;
  top: 2px;
}
input[class="b"] {
  position: relative;
  top: -1.5px;
}
/*사진 박스*/
.picture{
border: 1px solid rgba(75, 75, 75, 0.23);
border-radius: 33.5px;
background:lightgray;
}
.hover:hover{
	cursor:pointer;
	background: #F0BB00;
}
#searchStock{	
margin-left: auto;
margin-right: auto;
border-spacing: 70px 0;
}	
#searchProduct{
margin-left: auto;
margin-right: auto;
border-spacing: 15px 0;
}
.productSearchListTable td{
height: 80px;
}
.approval-btn, .detail-btn{
	  width: 80px;
      height: 100%;
      background: #ff9100;
      border: 1px solid rgba(255, 168, 0, 0.42);
      color:white;
}

.approval-btn:hover, .detail-btn:hover{
	  background: #FFFFFF;
      border: 1px solid rgba(255, 168, 0, 0.42);
      color: rgba(255, 168, 0, 0.42);
      outline: 0;
}
.approval-btn{
      margin-right: 10px;
}
.detail-btn{
	margin-left: 2px;
}
#listTable-adjustment{
width: 600px;
}
#listTable-adjustment th{
height: 40px;
}
#listTable-adjustment td{
height: 25px;
}
/*---------하단 listTableN 시작----------------------------------------------------------------*/
/*열 5개짜리 테이블*/

#listTable5 th:nth-of-type(1), #listTable5 td:nth-of-type(1){width:200px; important!}
#listTable5 th:nth-of-type(2), #listTable5 td:nth-of-type(2){width:200px; important!}
#listTable5 th:nth-of-type(3), #listTable5 td:nth-of-type(3){width:200px; important!}
#listTable5 th:nth-of-type(4), #listTable5 td:nth-of-type(4){width:200px; important!}
#listTable5 th:nth-of-type(5){width:200px; important!}
#listTable5 td:nth-of-type(5){width:180px; important!}

/*열 6개짜리 테이블*/

#listTable6 th:nth-of-type(1), #listTable6 td:nth-of-type(1){width:166px; important!}
#listTable6 th:nth-of-type(2), #listTable6 td:nth-of-type(2){width:166px; important!}
#listTable6 th:nth-of-type(3), #listTable6 td:nth-of-type(3){width:166px; important!}
#listTable6 th:nth-of-type(4), #listTable6 td:nth-of-type(4){width:166px; important!}
#listTable6 th:nth-of-type(5), #listTable6 td:nth-of-type(5){width:166px; important!}
#listTable6 th:nth-of-type(6){width:166px; important!}
#listTable6 td:nth-of-type(6){width:146px; important!}

/*열 8개짜리 정산서 테이블*/
#listTable-adjustment th:nth-of-type(1), #listTable-adjustment td:nth-of-type(1){width:75px; important!}
#listTable-adjustment th:nth-of-type(2), #listTable-adjustment td:nth-of-type(2){width:75px; important!}
#listTable-adjustment th:nth-of-type(3), #listTable-adjustment td:nth-of-type(3){width:75px; important!}
#listTable-adjustment th:nth-of-type(4), #listTable-adjustment td:nth-of-type(4){width:75px; important!}
#listTable-adjustment th:nth-of-type(5), #listTable-adjustment td:nth-of-type(5){width:75px; important!}
#listTable-adjustment th:nth-of-type(6), #listTable-adjustment td:nth-of-type(6){width:75px; important!}
#listTable-adjustment th:nth-of-type(7), #listTable-adjustment td:nth-of-type(7){width:75px; important!}
#listTable-adjustment th:nth-of-type(8), #listTable-adjustment td:nth-of-type(8){width:75px; important!}

/*열 13개짜리 테이블*/
#listTable13 th:nth-of-type(1), #listTable13 td:nth-of-type(1){width:40px; important!}
#listTable13 th:nth-of-type(2), #listTable13 td:nth-of-type(2){width:80px; important!}
#listTable13 th:nth-of-type(3), #listTable13 td:nth-of-type(3){width:80px; important!}
#listTable13 th:nth-of-type(4), #listTable13 td:nth-of-type(4){width:80px; important!}
#listTable13 th:nth-of-type(5), #listTable13 td:nth-of-type(5){width:80px; important!}
#listTable13 th:nth-of-type(6), #listTable13 td:nth-of-type(6){width:80px; important!}
#listTable13 th:nth-of-type(7), #listTable13 td:nth-of-type(7){width:80px; important!}
#listTable13 th:nth-of-type(8), #listTable13 td:nth-of-type(8){width:80px; important!}
#listTable13 th:nth-of-type(9), #listTable13 td:nth-of-type(9){width:80px; important!}
#listTable13 th:nth-of-type(10), #listTable13 td:nth-of-type(10){width:80px; important!}
#listTable13 th:nth-of-type(11), #listTable13 td:nth-of-type(11){width:80px; important!}
#listTable13 th:nth-of-type(12), #listTable13 td:nth-of-type(12){width:80px; important!}
#listTable13 th:nth-of-type(13){width:80px; important!}
#listTable13 td:nth-of-type(13){width:60px; important!}

/*열 10개짜리 테이블*/

#listTable10 th:nth-of-type(1), #listTable10 td:nth-of-type(1){width:60px; important!}
#listTable10 th:nth-of-type(2), #listTable10 td:nth-of-type(2){width:100px; important!}
#listTable10 th:nth-of-type(3), #listTable10 td:nth-of-type(3){width:100px; important!}
#listTable10 th:nth-of-type(4), #listTable10 td:nth-of-type(4){width:100px; important!}
#listTable10 th:nth-of-type(5), #listTable10 td:nth-of-type(5){width:100px; important!}
#listTable10 th:nth-of-type(6), #listTable10 td:nth-of-type(6){width:100px; important!}
#listTable10 th:nth-of-type(7), #listTable10 td:nth-of-type(7){width:100px; important!}
#listTable10 th:nth-of-type(8), #listTable10 td:nth-of-type(8){width:100px; important!}
#listTable10 th:nth-of-type(9), #listTable10 td:nth-of-type(9){width:100px; important!}
#listTable10 th:nth-of-type(10){width:140px; important!}
#listTable10 td:nth-of-type(10){width:120px; important!}

/*열 11개짜리 테이블*/
#listTable11 th:nth-of-type(1), #listTable11 td:nth-of-type(1){width:60px; important!}
#listTable11 th:nth-of-type(2), #listTable11 td:nth-of-type(2){width:90px; important!}
#listTable11 th:nth-of-type(3), #listTable11 td:nth-of-type(3){width:90px; important!}
#listTable11 th:nth-of-type(4), #listTable11 td:nth-of-type(4){width:90px; important!}
#listTable11 th:nth-of-type(5), #listTable11 td:nth-of-type(5){width:90px; important!}
#listTable11 th:nth-of-type(6), #listTable11 td:nth-of-type(6){width:90px; important!}
#listTable11 th:nth-of-type(7), #listTable11 td:nth-of-type(7){width:90px; important!}
#listTable11 th:nth-of-type(8), #listTable11 td:nth-of-type(8){width:90px; important!}
#listTable11 th:nth-of-type(9), #listTable11 td:nth-of-type(9){width:90px; important!}
#listTable11 th:nth-of-type(10), #listTable11 td:nth-of-type(10){width:90px; important!}
#listTable11 th:nth-of-type(11){width:130px; important!}
#listTable11 td:nth-of-type(11){width:110px; important!}

/*열 12개짜리 테이블*/
#listTable12 th:nth-of-type(1), #listTable12 td:nth-of-type(1){width:60px; important!}
#listTable12 th:nth-of-type(2), #listTable12 td:nth-of-type(2){width:80px; important!}
#listTable12 th:nth-of-type(3), #listTable12 td:nth-of-type(3){width:80px; important!}
#listTable12 th:nth-of-type(4), #listTable12 td:nth-of-type(4){width:85px; important!}
#listTable12 th:nth-of-type(5), #listTable12 td:nth-of-type(5){width:85px; important!}
#listTable12 th:nth-of-type(6), #listTable12 td:nth-of-type(6){width:85px; important!}
#listTable12 th:nth-of-type(7), #listTable12 td:nth-of-type(7){width:85px; important!}
#listTable12 th:nth-of-type(8), #listTable12 td:nth-of-type(8){width:85px; important!}
#listTable12 th:nth-of-type(9), #listTable12 td:nth-of-type(9){width:85px; important!}
#listTable12 th:nth-of-type(10), #listTable12 td:nth-of-type(10){width:85px; important!}
#listTable12 th:nth-of-type(11), #listTable12 td:nth-of-type(11){width:85px; important!}
#listTable12 th:nth-of-type(12){width:100px; important!}
#listTable12 td:nth-of-type(12){width:80px; important!}

/*리스트 컬럼 10,11,12개 짜리  테이블 바디 선 스타일*/
#listTable5 tbody tr, #listTable6 tbody tr, #listTable10 tbody tr, #listTable11 tbody tr, #listTable12 tbody tr, #listTable13 tbody tr{
border-bottom:3px solid #EBEAEA;
height: 36px;
}

/*리스트 컬럼 10,11, 12개 짜리  테이블  헤더 기본 높이 및 폰트 스타일*/
#listTable5 thead tr, #listTable6 thead tr, #listTable10 thead tr, #listTable11 thead tr, #listTable12 thead tr, #listTable13 thead tr{
width: 1000px;
height: 32px;
padding-left:20px;
background: #FBFAFA;
box-sizing:border-box;
border-radius: 300px 0 0 300px;
font-size:15px;
line-height:17px;
}

/*리스트 테이블 컬럼 10,11,12개 짜리  위치 및 설정*/
#listTable5, #listTable6, #listTable10, #listTable11, #listTable12, #listTable13{
width: 1000px;
border-collapse:collapse;
position: absolute;
top:350px;
left:40px;
text-align:center;
overflow-x: hidden !important;
display: block;
}

/*리스트 테이블 컬럼 10,11, 12개 짜리  바디 기본 높이*/
#listTable5 tbody,#listTable6 tbody, #listTable10 tbody, #listTable11 tbody, #listTable12 tbody, #listTable13 tbody{
display: block;
height: 280px;
overflow-y: auto !important;
}

/*--------하단 listTableN 끝----------------------------------------------------------------*/


</style>

</head>
<body>
<!-- mainWrapper start -->
	<div id="mainWrapper">
	
		<%@ include file="../common/cmMain.jsp" %>
		
		<!-- outer start -->
		<div id="outer">
			<!-- background-box start -->
			<div id="background-box">
			
				<!-- title-area start ---------------------------------------------------------------------------->
				<div id="titleArea">
					<div id="mainTitle">정산 관리</div>
					<div id="line1"></div>
					<div id="subTitle">정산내역 관리</div>
				</div>	<!--title-area end ---------------------------------------------------------------------------->
				
				<!-- search-area start ---------------------------------------------------------------------------->
				<div id="searchArea">
					<!-- 조회 제목 -->
					<div id="subSubTitle1">정산내역 조회</div>
						<!-- searchBox start -->
							<div id="searchBox" style="display: table;">
								<form id="searchForm" style="display:table-cell; vertical-align:middle">
									<div >
									<table id="searchStock" style="align:center;">
										<tr>
											<!-- 검색 내용 타이핑하는 부분 -->	
											<td style="width:200px !important;">회사명  :
											<input type="text" class="searchTextBox" size="6" name=""></td>
									
		
											<td style="width:240px">정산월  :
												<input type="month" class="searchTextBox" size="6" name=""></td>
											
	                       					
											<td style="width:220px">결제여부  :
											<div class="dropdown">
	        										<div class="select">
	          											<span>선택</span>
											          <i class="fa fa-chevron-left"></i>
											        </div>
											        <input type="hidden" name="">
											        <ul class="dropdown-menu">
								                           <li id="선택">선택</li>
								                           <li id="미지급">미지급</li>
								                           <li id="지급">지급</li>
											        </ul>
											      </div>
	                        				</td>
	
											<td><input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="float: right;"></td>
										</tr>
									</table>
									</div>
								</form>
							</div>
					</div><!-- search-area end ---------------------------------------------------------------------------->
	
	
	
				
				<!-- 조회 결과 리스트 부분 -->
					<div id="listArea">
						<!-- 조회 결과 리스트 제목 -->
						
						<div id="subSubTitle2" style="top:310px !important; width: 120px;">정산내역 리스트</div>
						<!-- 적용 버튼 -->
						<!-- <button onclick="" class="btn" id="apply">적용</button> -->
						<span id="apply" style="top:310px !important;">조회 결과 수 :</span>
							<!-- 테이블 시작 -->
							<!-- 조회 리스트 테이블 -->
						<table id="listTable6" align="center">
							<thead>
								<!-- 테이블 헤드 -->
								<tr id="listHead" >
									<th>회사명</th>
									<th>날짜</th>
									<th>입금일</th>
									<th>결제여부</th>
									<th>지급완료처리</th>
									<th>상세내역확인</th>
								</tr>
							</thead>
							<tbody>
							<!-- 리스트 바디  -->
								<tr>
									<td>내용</td>
									<td>내용</td>
									<td>내용</td>
									<td>내용</td>
									<td><button onclick="" class="approval-btn">변경</button></td>
									<td><button onclick="" class="btn detail-btn" id="detail">상세</button></td>
								</tr>
								<tr>
									<td>내용</td>
									<td>내용</td>
									<td>내용</td>
									<td>내용</td>
									<td><button onclick="text();" class="approval-btn">변경</button></td>
									<td><button onclick="" class="btn detail-btn" id="detail">상세</button></td>
							</tr>							
						</tbody>
					</table><!-- 테이블 끝 -->
				</div>
			</div>	<!-- background-box end -->
		</div>	<!-- outer end -->
	</div>	<!-- mainWrapper end -->

	<!-- Trigger/Open The Modal -->
	<!-- The Modal -->
	<div id="myModal" class="modal">
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
		    <h1 align="center">물품대금 정산서</h1><br>
	   
	   			<div id="wrapper" style="width:600px; margin-left: auto; margin-right: auto;">
	    <!-- 상단 정보 테이블 시작 -->
	  	 		 <table align="center" border="1" style="width: 600px; height: 180px;">
					<tr>
						<td rowspan="3" style="width: 30%;">
							<h7>2020년 8월 1일</h7>
							<h2>(주)그루모아</h2><h5>貴中</h5>
				
						</td>
						<td>사업자번호</td>
						<td colspan="3">123-45-67899</td>
					</tr>
					<tr>
						<td>상호</td>
						<td>스낵킹</td>
						<td>대표자 성명</td>
						<td>이재형</td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="3">서울시 강남구 테헤란로 14길 6 남도빌딩 2F</td>
					</tr>								
					<tr>
						<td rowspan="2">아래와 같이 계산합니다.</td>
						<td>업태</td>
						<td>도소매</td>
						<td>종목</td>
						<td>전자상거래</td>
					</tr>
					<tr>
						<td>전화</td>
						<td>02-1234-5678</td>
						<td>팩스</td>
						<td>02-2020-8888</td>
					</tr>
			    </table><!-- 상단 정보 테이블 끝 -->
				<table border="1" align="center"><!-- 중간 테이블 시작 -->
					<tr style="width: 100%; height: 45px;"><td></td><td></td><td></td></tr>
					
					<tr>
						<td style="width: 170px; height: 15px;">&nbsp;청구내역</div>
					</tr>
					<tr>	
						<td colspan="3" style="height: 15px;"></td>
					</tr>
					<tr>
						<td style="width: 170px;; height: 30px;"><h3>합계금액</h3></td>
						<td style="width: 50px; height: 30px;"><h3>일금</h3></td>
						<td style="width: 200px; height: 30px;"><h3>백육십오만 원정</h3></td>
						<!-- &#8361; 이거 원화기호임 -->
						<td style="width: 120px; height: 30px; text-align: left;">&nbsp;&nbsp;&nbsp;&#8361;</td>
						<td style="width: 160px; height: 30px; text-align: right;">1,650,000&nbsp;&nbsp;</td>
					</tr>	
					<tr style="width: 600px; height: 20px;">
						<td colspan="4"></td>
						<td style="text-align: right;">(단위 : 원)</td>
					</tr>
				</table><!-- 중간 테이블 끝 -->
				<table id="listTable-adjustment" border="1">
					<tr>
						<th>회차</th>
						<th>배송일</th>
						<th>거래품목</th>
						<th>총수량</th>
						<th>공급가액</th>
						<th>세액</th>
						<th>합계금액</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>1회차</td>
						<td>2020.07.01</td>
						<td>칸쵸 외</td>
						<td>80개</td>
						<td>500,000</td>
						<td>50,000</td>
						<td>550,000</td>
						<td></td>
					</tr>
					<tr>
						<td>2회차</td>
						<td>2020.07.11</td>
						<td>칸쵸 외</td>
						<td>80개</td>
						<td>500,000</td>
						<td>50,000</td>
						<td>550,000</td>
						<td></td>
					</tr>
					<tr>
						<td>3회차</td>
						<td>2020.07.21</td>
						<td>칸쵸 외</td>
						<td>80개</td>
						<td>500,000</td>
						<td>50,000</td>
						<td>550,000</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>-</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>-</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>-</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>-</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>-</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>-</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>-</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>-</td>
						<td></td>
					</tr>
					<tr><td style="width: 600px; height: 20px;"></td></tr>
					<tr>
						<td></td>
						<td colspan="2"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				
			</div><!-- wrapper 끝 -->
		</div>
	</div>




</body>



<script>
/* 옵션 선택 드롭 다운--------------------------------------------- */
$('.dropdown').click(function () {
    $(this).attr('tabindex', 1).focus();
    $(this).toggleClass('active');
    $(this).find('.dropdown-menu').slideToggle(300);
});
$('.dropdown').focusout(function () {
    $(this).removeClass('active');
    $(this).find('.dropdown-menu').slideUp(300);
});
$('.dropdown .dropdown-menu li').click(function () {
    $(this).parents('.dropdown').find('span').text($(this).text());
    $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
});
/*End Dropdown Menu*/


$('.dropdown-menu li').click(function () {
  var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>',
      msg = '<span class="msg">Hidden input value: ';
  $('.msg').html(msg + input + '</span>');
}); 


//모달 시작
// Get the modal
   var modal = document.getElementById("myModal");

   // Get the button that opens the modal
   var btn = document.getElementById("detail");

   // Get the <span> element that closes the modal
   var span = document.getElementsByClassName("close")[0];

   // When the user clicks on the button, open the modal
   btn.onclick = function() {
     modal.style.display = "block";
   }

   // When the user clicks on <span> (x), close the modal
   span.onclick = function() {
     modal.style.display = "none";
   }

   // When the user clicks anywhere outside of the modal, close it
   window.onclick = function(event) {
     if (event.target == modal) {
       modal.style.display = "none";
     }
   }





</script>
</html>