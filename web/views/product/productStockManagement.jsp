<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<style>


/*버튼*/
#btnMore{
position:absolute;
top:280px;
right:90px;
width:70px;		
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/misoCSS.css"/>
</head>
<body>
	<!-- 메뉴바 가져오기 -->


	
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
				<div id="subTitle">상품 재고 확인</div>
			</div>
			<!-- 본문영역 상단부 끝 -->
			
			<!-- 본문영역 중앙부 -->
			<div id="contentArea">
				<!-- 조회 정보 입력 부분 -->
				<div id="searchArea">
						<!-- 조회 제목 -->
						<div id="subSubTitle1">재고 조회</div>
						<!-- 조회 상자 테두리-->
						<div id="searchBox" style="height:60px !important;">
							<form id="searchForm">
								<table>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
			
										<td style="width:130px">매입처  :
										<input type="text" class="searchTextBox" size="6" name=""></td>
								
										
										<td style="width:150px">상품종류  :
											<select>
					                           <option>선택</option>
					                           <option>과자</option>
					                           <option>캔디</option>
					                           <option>껌</option>
					                           <option>초콜릿</option>
					                           <option>커피</option>					                         
					                           <option>차</option>
					                           <option>음료</option>
					                           <option>컵라면</option>
					                           <option>컵밥</option>
					                           <option>케이크</option>                           
                        					</select>
										</td>
										<td style="width:150px">상품명  :
											<input type="text" class="searchTextBox" size="6" name=""></td>
										
										<td style="width:170px">상품코드  :
											<input type="text" class="searchTextBox" size="7" name=""></td>
										
										<td style="width:250px">
											<select>
											   <option>재고기준 조회</option>
					                           <option>총수량</option>
					                           <option>출고가능수량</option>
					                           <option>입고진행수량</option>
					                           <option>출고진행수량</option>
					                           <option>교환예정수량</option>                         
                        					</select>&nbsp;&nbsp;
                        					<input type="text" class="searchTextBox" size="2" name="">&nbsp;&nbsp;~&nbsp;&nbsp;
                        					<input type="text" class="searchTextBox" size="2" name="">
										</td>
										<td><input type="submit" class="btn" value="검색" id="submit"></td>
									
									
									</tr>
								</table>
							</form>
						</div>
				</div>


				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">재고 리스트</div>
					<!-- 적용 버튼 -->
					<button onclick="" class="btn" id="btnMore">상세</button>
					<!-- 조회 리스트 테이블 -->
					<table id="listTable12" align="center">
						<thead>
							<!-- 테이블 헤드 -->
							<tr id="listHead" >
								<th>선택</th>
								<th>상품코드</th>
								<th>상품종류</th>
								<th>상품명</th>
								<th>매입처</th>
								<th>최근입고</th>
								<th>최근출고</th>
								<th>총수량</th>
								<th>출고가능</th>
								<th>입고진행</th>
								<th>출고진행</th>
								<th>교환예정</th>
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
							</tr>
						</tbody>
					</table>
				</div>
				
			
			</div>
			<!-- 본문영역 중앙부 끝 -->
			
		</div>
	</div>
	
	
	


</body>
</html>