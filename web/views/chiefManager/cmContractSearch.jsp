<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/misoCSS.css">
<style>

body{
	  margin: 0;
      padding: 0;
      box-sizing: border-box;
      width:1440px;
      height: 735px;
      background: #EFEEEE !important;
}

/*본문 영역 내용 들어가는 흰색 큰 박스*/
#background-box{
position: absolute;
width: 1092px;
height: 650px;
right: 0;
background: #FFFFFF;
border-radius: 12px;
}

#titleArea{
	position: relative;
	height: 20%;

}



.btn{
border:0;
outline:0;
width: 70px;
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


#listTable5 tbody tr,#listTable10 tbody tr, #listTable11 tbody tr, #listTable12 tbody tr, #listTable13 tbody tr{
border-bottom:3px solid #EBEAEA;
height: 36px;
}

#listTable5 thead tr, #listTable10 thead tr, #listTable11 thead tr, #listTable12 thead tr, #listTable13 thead tr{
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
#listTable5, #listTable10, #listTable11, #listTable12, #listTable13{
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
#listTable5 tbody, #listTable10 tbody, #listTable11 tbody, #listTable12 tbody, #listTable13 tbody{
display: block;
height: 280px;
overflow-y: auto !important;
}


#background-box {
	height:700px;
}	
	

	

	


</style>
</head>
<body>

	<!-- 메뉴바 가져오기 -->
	

	
		<!-- 본문 영역 내용 들어가는 흰색 큰 박스 -->
		<div id="background-box">
		
			<!-- 본문영역 상단부 -->
			<div id="titleArea">
				<!-- 본문 영역 제목 -->
				<div id="mainTitle">계약 관리</div>
				<!-- 본문 영역 제목 밑에있는 선 -->
				<div id="line1"></div>
				<!-- 본문 영역 소제목 -->
				<div id="subTitle">계약내역 조회</div>
			</div>
			<!-- 본문영역 상단부 끝 -->
			
			<!-- 본문영역 중앙부 -->
			<div id="contentArea">
				<!-- 조회 정보 입력 부분 -->
				<div id="searchArea">
						<!-- 조회 제목 -->
						<div id="subSubTitle1">계약 조회</div>
						<!-- 조회 상자 테두리-->
						<div id="searchBox" style="height:130px;">
							<form id="searchForm">
								<table style=width:950px;>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
										
										<td style="width:200px; padding-left: 15px" colspan="2" >거래처명 :
											<input type="text" class="searchTextBox" size="20" name="">
											<!--  <select>
											   <option>선택</option>
					                           <option>정량</option>
					                           <option>정기</option>                        
                        					</select> -->
										</td>
										<td></td>
										<td style="width:200px"></td>
										<td style="width:200px"></td>			
										<td rowspan="3" align="center"><input type="submit" class="btn" value="검색" id="submit"></td>
										
									</tr>
									<tr>
										<td style="padding-left: 15px;">계약번호 : 
										<input type="text" class="searchTextBox" size="20" name=""></td>
										<td></td>
										<td colspan="3" align="center">계약일 : 
										<input type="date" class="searchTextBox" size="10" name=""></td>
									</tr>
									<tr>
										<td colspan="2" style="padding-left: 15px;">계약기간 :
											<button onclick="">오늘</button>
											<button onclick="">1주일</button>
											<button onclick="">1개월</button>
											<button onclick="">3개월</button>
											<button onclick="">6개월</button>
										</td>
										<td colspan="3" style="width:400px;" align="center">
										<input type="date" class="searchTextBox" name="">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
										<input type="date" class="searchTextBox" name="">
										</td>
									</tr>
								</table>
							</form>
						</div>
				</div>
				<!-- 적용 버튼 -->
				
					<button onclick="" class="btn" id="btnOk" style="width:150px; top:310px; left:40px;">유효한 계약내역</button>
					<button onclick="" class="btn" id="btnNo" style="width:150px; top:310px; left:200px;">종료된 계약내역</button>
				
					
				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
				
					<!-- 조회 결과 리스트 제목 -->
					<!-- <div id="subSubTitle2">발주 리스트</div> -->
					
					<!-- 조회 리스트 테이블 -->
					<table id="listTable13">
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th>순번</th>
								<th>계약번호</th>
								<th>거래처명</th>
								<th>계약일자</th>
								<th>계약 시작일</th>
								<th>계약 종료일</th>
								<th>배송횟수(월)</th>
								<th>회차당 금액</th>
								<th>월 계약금액</th>
								<th>배송 주</th>
								<th>요일</th>
								<th>배송지 보기</th>
								<th>수정</th>
								
								
							</tr>
						</thead>
						<tbody>
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
								<td>내용</td>
								<td>내용</td>
								<td>내용</td>
								
							</tr>
						</tbody>
					</table>
					</div>
				</div>
				
			
			</div>
			<!-- 본문영역 중앙부 끝 -->
			
	</div>
	
	
	


</body>
</html>