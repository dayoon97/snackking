<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.contract.model.vo.*, java.util.*"%>
<%-- <%
	ArrayList<Contract> list = (ArrayList<Contract>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
%> --%>
    
    
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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
/*열 10개짜리 테이블*/

#listTable10 th:nth-of-type(1), #listTable10 td:nth-of-type(1){width:100px; important!}
#listTable10 th:nth-of-type(2), #listTable10 td:nth-of-type(2){width:140px; important!}
#listTable10 th:nth-of-type(3), #listTable10 td:nth-of-type(3){width:140px; important!}
#listTable10 th:nth-of-type(4), #listTable10 td:nth-of-type(4){width:140px; important!}
#listTable10 th:nth-of-type(5), #listTable10 td:nth-of-type(5){width:140px; important!}
#listTable10 th:nth-of-type(6), #listTable10 td:nth-of-type(6){width:140px; important!}
#listTable10 th:nth-of-type(7), #listTable10 td:nth-of-type(7){width:140px; important!}
#listTable10 th:nth-of-type(8), #listTable10 td:nth-of-type(8){width:140px; important!}
#listTable10 th:nth-of-type(9), #listTable10 td:nth-of-type(9){width:140px; important!}
#listTable10 th:nth-of-type(10){width:130px; important!}
#listTable10 td:nth-of-type(10){width:130px; important!}

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
#listTable10 tbody tr, #listTable11 tbody tr, #listTable12 tbody tr{
border-bottom:3px solid #EBEAEA;
height: 36px;
}

/*리스트 컬럼 10,11, 12개 짜리  테이블  헤더 기본 높이 및 폰트 스타일*/
#listTable10 thead tr, #listTable11 thead tr, #listTable12 thead tr{
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
#listTable10, #listTable11, #listTable12{
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
#listTable10 tbody, #listTable11 tbody, #listTable12 tbody{
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

	<%@ include file="../common/userMenu.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
		
			<!-- title-area start ---------------------------------------------------------------------------->
			<div id="titleArea">
				<div id="mainTitle">계약 관리</div>
				<div id="line1"></div>
				<div id="subTitle">계약 내역 조회</div>	
			</div>	<!--title-area end ---------------------------------------------------------------------------->
			
			<!-- search-area start ---------------------------------------------------------------------------->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">계약 조회</div>
					<!-- searchBox start -->
						<div id="searchBox" style="height: 120px !important; display: table !important;">
							<form id="searchForm" style="display:table-cell !important; vertical-align:middle !important; ">
								<table id="searchContract"  style="margin-left: auto !important; margin-right: auto !important; border-spacing: 20px 10px" >
									<tr style="height:34px !important;">
									
										<td style="width:200px; padding-left: 15px" colspan="2" >거래처명 :
											<input type="text" class="searchTextBox" size="20" name="">
										</td>
										<td></td>
										<td style="width:200px"></td>
										<td style="width:200px"></td>			
										<td rowspan="3" align="center">
										<button class="searchBtn" id="submit" style="width:85px;" 
										onclick="location.href='<%=request.getContextPath()%>/selectContract.co'">검색</button>
										
										<!-- <input type="submit" class="searchBtn" value="검색" id="submit" style="width:85px;"></td> -->
										
									</tr>
									<tr>
										<td style="padding-left: 15px;">계약코드 : 
										<input type="text" class="searchTextBox" size="20" name=""></td>
										<td></td>
										<td colspan="3" align="center">계약일 : 
										<input type="date" class="searchTextBox" size="10" name=""></td>
									</tr>
									<tr>
										<td colspan="3" style="padding-left: 15px;">계약기간 :
											<button onclick="">오늘</button>
											<button onclick="">1주일</button>
											<button onclick="">1개월</button>
											<button onclick="">3개월</button>
											<button onclick="">6개월</button>
										</td>
										<td colspan="2" style="width:400px;" align="center">
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
						<button onclick="" class="btn" id="btnValidContract" style="width:130px; top:310px; left:40px;">유효한 계약내역</button>
 						<button onclick="" class="btn" id="btnFinishContract" style="width:130px; top:310px; left:200px">종료된 계약내역</button>
					</div>
					
					
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<span id="apply" style="top:330px !important;">조회 결과 수 :</span>
					<!-- 테이블 시작 -->
						<!-- 조회 리스트 테이블 -->
					<table id="listTable10" style="top:365px !important;">
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th>계약번호</th>
								<th>계약코드</th>
								<th>거래처명</th>
								<th>계약일자</th>
								<th>계약시작일</th>
								<th>계약종료일</th>
								<th>배송횟수(월)</th>
								<th>회차당 금액</th>
								<th>월 계약금액</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
						<!-- 리스트 바디  -->
  						<%-- <% for(Contract c : list) { %> --%>
							<tr class="hover">
							<%-- <input type="hidden" value="<%= c.getConNo()%>"> --%>
								<td><%-- <%= c.getConCode() %> --%></td>
								<td><%-- <%= c.getCorpName() %> --%></td>
								<td><%-- <%= c.getConDate() %> --%></td>
								<td><%-- <%= c.getStartDate() %> --%></td>
								<td><%-- <%= c.getEndDate() %> --%></td>
								<td><%-- <%= c.getDelivCount() %> --%></td>
								<td><%-- <%= c.getAmountPDeliv() %> --%></td>
								<td><%-- <%= c.getTtlAmount() %> --%></td>
								<td>수정</td>
							</tr>
						<%-- <% } %> --%>
							 <!-- <tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
							<tr class="hover">
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td></td>
							</tr>
						 -->
						</tbody>
					</table>
					<!-- 테이블 끝 -->
			</div>
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

	<!-- 페이징 처리 버튼 -->
	<div class="pageingArea" align="center">
		<button onclick="lacation.href='<%=request.getContextPath()%>/selectContract.co?currentPage=1'"><<</button>
	
		<%-- <%if(currentPage <= 1) { %> --%>
		<button disabled><</button>
		<%-- <% } else { %> --%>
		<button onclick="loaction.href='<%=request.getContextPath()%>/selectContract.co?currentPage=<%-- <%=currentPage -1%> --%>'"><</button>
		<%-- <% } %>	 --%>
	<%-- 
		<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage) { 
		%> --%>
				<button disabled><%-- <%= p %> --%></button>
		<%-- <%      } else { %> --%>
				<button  onclick="location.href='<%-- <%=request.getContextPath()%> --%>/selectContract.co?currentPage=<%-- <%= p%> --%>'"></button>
		<%-- <%
				}
			}
		%>
		
		<%if(currentPage >= maxPage) { %> --%>
	         <button disabled>></button>
	        <%--  <% } else { %> --%>
	         <button onclick="location.href='<%-- <%=request.getContextPath()%> --%>/selectContract.co?currentPage=<%-- <%=currentPage +1%> --%>'">></button>
	         <%-- <% } %> --%>
	         <button onclick="location.href='<%-- <%=request.getContextPath()%> --%>/selectContract.co?currentPage=<%-- <%=maxPage%> --%>'">>></button>
	</div>






<div id="ex1" class="modal" style="width:800px; height:700px;">

<a href="#" rel="modal:close">닫기</a>
</div>
 
<p><a href="#ex1" rel="modal:open" >모달창 띄우기</a></p>



</body>


<script>
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