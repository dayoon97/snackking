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

	<%@ include file="../common/cmMain.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
		
			<!-- title-area start ---------------------------------------------------------------------------->
			<div id="titleArea">
				<div id="mainTitle">상품 관리</div>
				<div id="line1"></div>
				<div id="subTitle">상품 정보 확인</div>
			</div>	<!--title-area end ---------------------------------------------------------------------------->
			
			<!-- search-area start ---------------------------------------------------------------------------->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">상품 검색</div>
					<!-- searchBox start -->
						<div id="searchBox" style="height: 90px !important; display: table;">
							<form id="searchForm" style="display:table-cell; vertical-align:middle">
								<div >
								<table id="searchProduct">
									<tr style="height:34px !important;">
										<!-- 검색 내용 타이핑하는 부분 -->	
										<td style="width:170px">상품코드  :
										<input type="text" class="searchTextBox" size="7"></td>                        					
										<td style="width:220px">상품종류  :
										<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="productKinds">
										        <ul class="dropdown-menu">
							                           <li id="선택">선택</li>
							                           <li id="과자">과자</li>
							                           <li id="캔디">캔디</li>
							                           <li id="껌">껌</li>
							                           <li id="초콜릿">초콜릿</li>
							                           <li id="커피">커피</li>					                         
							                           <li id="차">차</li>
							                           <li id="음료">음료</li>
							                           <li id="컵라면">컵라면</li>
							                           <li id="컵밥">컵밥</li>
							                           <li id="케이크">케이크</li>  
										        </ul>
										      </div>
                        				</td>
                        				
                        				<td style="width:140px">향  :
                        				<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="productKinds">
										        <ul class="dropdown-menu">
							                           <li id="선택">선택</li>
							                           <li id="초코">초코</li>
							                           <li id="딸기">딸기</li>
							                           <li id="바나나">바나나</li>
							                           <li id="포도">포도</li>
							                           <li id="바닐라">바닐라</li>					                         
							                           <li id="커피">커피</li>
							                           <li id="민트">민트</li>
							                           <li id="소다">소다</li>
							                           <li id="시나몬">시나몬</li>
							                           <li id="땅콩">땅콩</li>  
										        </ul>
										      </div>
                        				</td>
                        				<td style="width:140px">맛  :
                        					<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="productKinds">
										        <ul class="dropdown-menu">
							                           <li id="달콤">달콤</li>
							                           <li id="짭짤">짭짤</li>
							                           <li id="고소">고소</li>
							                           <li id="담백">담백</li>
							                           <li id="새콤">새콤</li>
							                           <li id="매콤">매콤</li>					                         
										        </ul>
										      </div>
										</td>
											
											<td style="width:210px">기본 유통기한  :
												<input type="text" class="searchTextBox" size="2"> 개월
											</td>	
									</tr>
									<tr>	
										<td>상품명  :
											<input type="text" class="searchTextBox" size="9">
										</td>
									
								
                       					<td>알레르기 성분 :
											<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="stockKinds">
										        <ul class="dropdown-menu">
							                           <li id="선택">선택</li>
							                           <li id="밀">밀</li>
							                           <li id="대두">대두</li>
							                           <li id="계란">계란</li>
							                           <li id="땅콩">땅콩</li>
							                           <li id="갑각류">갑각류</li>					                         
							                           <li id="메밀">메밀</li>					                         
							                           <li id="유제품">유제품</li>					                         
							                           <li id="해당없음">해당없음</li>					                         
										    	    </ul>
										      </div>
                        				</td>
										
										<td colspan="2">가격  :
											<input type="text" class="searchTextBox" size="10"> ~
											<input type="text" class="searchTextBox" size="10"> 원
										</td>
										<td>
											<input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="margin-left:85px;">
										</td>
																	
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div><!-- search-area end ---------------------------------------------------------------------------->


			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					
					<div id="subSubTitle2" style="top:310px !important;">상품 리스트</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<span id="apply" style="top:310px !important;">조회 결과 수 :</span>
						<!-- 테이블 시작 -->
						<!-- 조회 리스트 테이블 -->
					<table id="listTable10" class="productSearchListTable">
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th>선택</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>사진 </th>
								<th>상품종류</th>
								<th>가격</th>
								<th>향</th>
								<th>맛</th>
								<th>알레르기</th>
								<th>기본 유통기한</th>
							</tr>
						</thead>
						<tbody style="height: 230px !important;">
						<!-- 리스트 바디  -->
							<tr>
								<td><input type="radio" name="ok"></td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
							</tr>
							<tr>
								<td><input type="radio" name="ok"></td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
							</tr>
						</tbody>
							<tfoot style="float: right;">
								<tr>
									<td>
										<button onclick="" class="searchBtn" id="btnAddProduct"><a href="productAdd.jsp">추가</a></button>
									</td>
									<td>
										<button onclick="" class="searchBtn" id="btnUpdateProduct">수정</button>
									</td>
									<td>
										<button onclick="" class="searchBtn" id="btnDeleteProduct">삭제</button>
									</td>
								</tr>
							</tfoot>
					</table>
					<!-- 테이블 끝 -->
				</div>
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

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