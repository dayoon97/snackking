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
	
	/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 2; /* Sit on top */
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
  margin: 15% auto; /* 15% from the top and centered */
  padding: 40px;
  border: 1px solid #888;
  width: 40%; /* Could be more or less, depending on screen size */
  z-index:1;
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

/*조회 결과 리스트 제목 스타일*/
/* #subSubTitle2{
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
} */

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
/* 유효한 계약내뎍, 종료된 계약내역 버튼 스타일*/
.btn {
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
/*---------하단 listTableN 시작----------------------------------------------------------------*/

/* 열 9개짜리 테이블 */
#listTable9 th:nth-of-type(1), #listTable9 td:nth-of-type(1){width:60px; important!}
#listTable9 th:nth-of-type(2), #listTable9 td:nth-of-type(2){width:100px; important!}
#listTable9 th:nth-of-type(3), #listTable9 td:nth-of-type(3){width:100px; important!}
#listTable9 th:nth-of-type(4), #listTable9 td:nth-of-type(4){width:100px; important!}
#listTable9 th:nth-of-type(5), #listTable9 td:nth-of-type(5){width:120px; important!}
#listTable9 th:nth-of-type(6), #listTable9 td:nth-of-type(6){width:100px; important!}
#listTable9 th:nth-of-type(7), #listTable9 td:nth-of-type(7){width:100px; important!}
#listTable9 th:nth-of-type(8), #listTable9 td:nth-of-type(8){width:100px; important!}
#listTable9 th:nth-of-type(9), #listTable9 td:nth-of-type(9){width:200px; important!}
#listTable9 th:nth-of-type(10){width:140px; important!}
#listTable9 td:nth-of-type(10){width:120px; important!}


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
#listTable9 tbody tr, #listTable10 tbody tr, #listTable11 tbody tr, #listTable12 tbody tr{
	border-bottom:3px solid #EBEAEA;
	height: 36px;
}

/*리스트 컬럼 10,11, 12개 짜리  테이블  헤더 기본 높이 및 폰트 스타일*/
#listTable9 thead tr, #listTable10 thead tr, #listTable11 thead tr, #listTable12 thead tr{
	width: 900px;
	height: 32px;
	padding-left:20px;
	background: #FBFAFA;
	box-sizing:border-box;
	border-radius: 300px 0 0 300px;
	font-size:15px;
	line-height:17px;
}

/*리스트 테이블 컬럼 10,11,12개 짜리  위치 및 설정*/
#listTable9, #listTable10, #listTable11, #listTable12{
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
#listTable9 tbody, #listTable10 tbody, #listTable11 tbody, #listTable12 tbody{
	display: block;
	height: 280px;
	overflow-y: auto !important;
}
#chCodeBtn{
	margin-top: 20px;
}
/*--------하단 listTableN 끝----------------------------------------------------------------*/

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
		
			<!-- title-area start ---------------------------------------------------------------------------->
			<div id="titleArea">
				<div id="mainTitle">주문 관리</div>
				<div id="line1"></div>
				<div id="subTitle">거래 내역 조회</div>	
			</div>	<!--title-area end ---------------------------------------------------------------------------->
			
			<!-- search-area start ---------------------------------------------------------------------------->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">거래명세서 조회 및 출력</div>
					<!-- searchBox start --> 
						<div id="searchBox" style="height: 120px !important; display: table !important;">
							<form id="searchForm" style="display:table-cell !important; vertical-align:middle !important; ">
								<table   id="searchContract"  style="margin-left: auto !important; margin-right: auto !important; border-spacing: 20px 10px" >
									<tr style="height:34px !important;">
									
										<td style="width:200px; padding-left:15px" colspan="2" >거래처명 :
											<input type="text" class="searchTextBox" size="20" name="">
										</td>
										<td></td>
										<td style="width:200px"></td>
										<td style="width:200px"></td>			
										<td rowspan="3" align="center">
										<input type="submit" class="searchBtn" value="검색" id="submit" style="width:85px;"></td>
										
									</tr>
									
									<tr>
										<td colspan="3" style="padding-left: 15px; width:">계약기간 :
											<button onclick="">오늘</button>
											<button onclick="">1주일</button>
											<button onclick="">1개월</button>
											<button onclick="">3개월</button>
											<button onclick="">6개월</button>
										</td>
										<td colspan="2" style="width:300px;" align="center">
										<input type="date" class="searchTextBox" name="">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
										<input type="date" class="searchTextBox" name="">
										</td>
									</tr>
										
								</table>
								
							</form>
						</div>
				</div><!-- search-area end ---------------------------------------------------------------------------->


			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<!-- <div id="subSubTitle2" style="top:325px !important;">조회 리스트</div> -->
					
					<div style="margin-top:185px; padding-left:40px;">
						<button onclick="" class="btn" id="btnTransaction" style="width:130px; top:310px; left:40px;">거래 건별 내역</button>
 						<button onclick="" class="btn" id="btnTransactionCompany" style="width:130px; top:310px; left:200px">거래처별 집계</button>
					</div>
					
					
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<span id="apply" style="top:330px !important;">조회 결과 수 :</span>
						<!-- 테이블 시작 -->
						<!-- 조회 리스트 테이블 -->
					<table id="listTable9" style="top:365px !important;">
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th>순번</th>
								<th>거래 번호</th>
								<th>거래처명</th>
								<th>거래일자</th>
								<th>거래내용</th>
								<th>공급가액</th>
								<th>부가세</th>
								<th>매출 계</th>
								<th>상세 품목 및 거래명세서</th>
							</tr>
						</thead>
						<tbody>
						<!-- 리스트 바디  -->
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td><input type="button" value="거래명세서 보기" id="checkRecipt">
									<!-- Trigger/Open The Modal -->
										<!-- The Modal -->
										<div id="myModal" class="modal">
										  <!-- Modal content -->
										  <div class="modal-content">
										    <span class="close">&times;</span>
										    <p align="center" class ="modaltitle" style="font-size:30px;">거래명세서</p>
										    <div class="titleLine"></div>
										    	<!-- 거래명세서 모달창 -->
												  <table border="1" style="width:460px; height:400px; background:pink; border:2px solid black;" >
													<thead>
														<tr>
															<th colspan="10" style="text-align:center"> 거        래        명        세        표  <br>
																 (공    급    자    보    관    용)
															</th>
															
														</tr>
														<tr>
															<td colspan="5" >
																 공 급 가 액 : \500,0000 ~ 
															</td>
															<td colspan="5">
																 일   자 : 2020.07.13 (월) 
															</td>
														</tr>
														<tr>
															<td rowspan="5">공  급  자</td>
															<td>등록번호</td>
															<td colspan="3">220-81-77777</td>
															<td rowspan="5">공급받는자</td>
															<td>등록번호</td>
															<td colspan="3">881-87-55555</td>
														</tr>
														<tr>
															<td>상호</td>
															<td>스낵킹</td>
															<td>대표</td>
															<td>김미소</td>
															
															<td>상호</td>
															<td>그루모아</td>
															<td>대표</td>
															<td>김정수</td>
														</tr>
														<tr>
															<td>주소</td>
															<td colspan="4">서울시 강남구 테헤란로 14길 6 남도빌딩 2층</td>
															<td>주소</td>
															<td colspan="4">서울시 강남구 테헤란로 14길 6 남도빌딩 5층 </td>
														</tr>
														<tr>
															<td>업태</td>
															<td>도소매업</td>
															<td>종목</td>
															<td>전자상거래</td>
															
															<td>업태</td>
															<td>중개업</td>
															<td>종목</td>
															<td>전자상거래</td>
														</tr>
														<tr>
															<td>TEL</td>
															<td>02-1234-7777</td>
															<td>FAX</td>
															<td>02-1234-8888</td>
															<td>TEL</td>
															<td>02-1234-5555</td>
															<td>FAX</td>
															<td>02-1234-6666</td>
														</tr>
														<tr>
															<td colspan="10"></td>
														</tr>
													</thead>
													<tbody class="receiptTable">
														<tr>
															<td>No</td>
															<td colspan="2">종목</td>
															<td>규격</td>
															<td>수량</td>
															<td colspan="2">단가</td>
															<td>금액</td>
															<td colspan="2">비고</td>
														</tr>
														<tr>
															<td>1</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>2</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>3</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>4</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>5</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>6</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>7</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>8</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>9</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>10</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>11</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>12</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>13</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>14</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td>15</td>
															<td colspan="2">오예스</td>
															<td>곽</td>
															<td>20</td>
															<td colspan="2">3,000</td>
															<td>60,000</td>
															<td colspan="2"></td>
														</tr>
														
													</tbody>
												  	<tfoot>
												  		<tr>
															<td colspan="4">합계</td>
															<td>320 - </td>
															<td colspan="2"></td>
															<td>500,000</td>
															<td colspan="2"></td>
														</tr>
												  	
												  	</tfoot>
												  
												  
												  </table>
										    <button class="searchBtn" id="chCodeBtn">닫기</button>
										  </div>
										</div>
								</td>
							</tr>
						
						
						</tbody>
					</table>
					<!-- 테이블 끝 -->
			</div>
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->



 


</body>





<script>
//모달 스크립트
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("checkRecipt");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal

$(document).on('click','btn',function(e){
	modal.style.display = "block";
});
//ajax 실행후 엘리먼트 함수 안돼서 바꿈
btn.onclick = function() {
	modal.style.display = "block";
}


//
$(document).on('click','span',function(e){
	modal.style.display = "none";
});

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}



// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};

/* 옵션 선택 드롭 다운 */
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


</script>


</html>