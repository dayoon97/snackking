<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@charset "UTF-8";
/*body 기본 세팅*/
body{
	  margin: 0;
      padding: 0;
      box-sizing: border-box;
      width:1440px;
      height: 735px;
      background: #EFEEEE !important;
}

/* 메뉴바 부분 찌그러지지 않게 공간만 잡아두기 */
#wrapper1{
width: 250px;
display: inline-block;
float: left;
}
/*본문 영역 부분 찌그러지지 않게 공간만 잡아두기 */
#wrapper2{
width:auto;
position: relative;
float: right;
}

/*본문 영역 내용 들어가는 흰색 큰 박스*/
#background-box{
position: absolute;
width: 1092px;
height: 650px;
right: 0;
top: 50px;
background: #FFFFFF;
border-radius: 12px;
}
/*본문영역 상단부*/
#titleArea{
	position: relative;
	height: 20%;

}
/*본문 영역 제목*/
#mainTitle{
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
#line1{
position: absolute;
width: 170px;
height: 0px;
left: 30px;
top: 80px;
border: 1px solid #666666;
}

/*본문 영역 소제목*/
#subTitle{
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
width: 69px;
height: 30px;
left: 40px;
top: 150px;
font-family: NanumSquare_ac;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 20px;
display: flex;
align-items: center;
color: #000000;
}

/*조회 상자 테두리*/
#searchBox{
position: absolute;
width: 980px;
height: 60px;
left: 40px;
top: 190px;
background: #FFFFFF;
border: 1px solid rgba(75, 75, 75, 0.23);
box-sizing: border-box;
border-radius: 33.5px;
}

/*폼 기본 서식*/
#searchForm{
height:100%;
margin-left:auto;
margin-right:auto;
margin-top:5px;
padding-left:20px;
}


/*테이블 기본 서식*/
table{
margin-top: 5px;
width: 950px;
margin-left:10px;
}

/*td 글자 스타일 지정*/
td{
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
.btn{
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
top: 300px;
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
top:350px;
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
th{
padding:4px;
font-size:15px;
line-height:17px;
}

/* 리스트 바디 하위 td 테이블 선 스타일*/
.listBody>td{
border-bottom:3px solid #EBEAEA;
height: 25px;
}
</style>
</head>
<body>
	<!-- 메뉴바 가져오기 -->
	<%-- <%@ include file="../cheif" %> --%>
	
	<!-- 메뉴바 부분 찌그러지지 않게 공간만 잡아두기 -->
	<div id="wrapper1"></div>
	
	<!-- 본문 영역 부분 찌그러지지 않게 공간만 잡아두기 -->
	<div id="wrapper2">
		<!-- 본문 영역 내용 들어가는 흰색 큰 박스 -->
		<div id="background-box">
		
			<!-- 본문영역 상단부 -->
			<div id="titleArea">
				<!-- 본문 영역 제목 -->
				<div id="mainTitle">상품 관리</div>
				<!-- 본문 영역 제목 밑에있는 선 -->
				<div id="line1"></div>
				<!-- 본문 영역 소제목 -->
				<div id="subTitle">상품 정보 확인</div>
			</div>
			<!-- 본문영역 상단부 끝 -->
			
			<!-- 본문영역 중앙부 -->
			<div id="contentArea">
				<!-- 조회 정보 입력 부분 -->
				<div id="searchArea">
						<!-- 조회 제목 -->
						<div id="subSubTitle1">직원 검색</div>
						<!-- 조회 상자 테두리-->
						<div id="searchBox">
							<form id="searchForm">
								<table>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
										<td>이름  :</td>
										<td><input type="text" class="searchTextBox" size="7"></td>
																			
										<td>직급코드  :</td>
										<td><input type="text" class="searchTextBox" size="7"></td>
										
										<td>사원코드  :</td>
										<td><input type="text" class="searchTextBox" size="7"></td>
										
										<td>전화번호  :</td>
										<td><input type="text" class="searchTextBox" size="10"></td>
										
										<td><input type="submit" class="btn" value="검색하기" id="submit"></td>
									
									</tr>
								</table>
							</form>
						</div>
				</div>
				
				
					
				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">직원 리스트</div>
					<!-- 적용 버튼 -->
					<button onclick="" class="btn" id="apply">적용</button>
					
					
					<!-- 조회 리스트 테이블 -->
					<table id="listTable">
						<!-- 테이블 헤드 -->
						<tr id="listHead">
							<th><input type="checkbox">선택</th>
							<th width="100px">사원</th>
							<th width="140px">직급코드
								<select>
		                           <option>전체</option>
		                           <option>J1</option>
		                           <option>J2</option>
		                           <option>J3</option>
                        		</select>
							</th>
							<th width="80px">이름 </th>
							<th width="250px">주소</th>
							<th width="80px">연락처</th>
							<th width="80px">입사일</th>
							<th width="80px">근무상태</th>
						</tr>
						
						<!-- 리스트 바디  -->
						<tr class="listBody">
							<td><input type="checkbox"></td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						<tr class="listBody">
							<td><input type="checkbox"></td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						<tr class="listBody">
							<td><input type="checkbox"></td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						<tr class="listBody">
							<td><input type="checkbox"></td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						<tr class="listBody">
							<td><input type="checkbox"></td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						
					</table>
				</div>
				
			
			
			</div>
			<!-- 본문영역 중앙부 끝 -->
			
		</div>
	</div>
	
	
	
	
	


</body>
</html>