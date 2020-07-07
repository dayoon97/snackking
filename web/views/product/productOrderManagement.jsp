<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<style>


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/misoCSS.css"/>
</head>
<body>
	<!-- 메뉴바 가져오기 -->


	
		<!-- 본문 영역 내용 들어가는 흰색 큰 박스 -->
		<div id="background-box">
		
			<!-- 본문영역 상단부 -->
			<div id="titleArea">
				<!-- 본문 영역 제목 -->
				<div id="mainTitle">상품 관리</div>
				<!-- 본문 영역 제목 밑에있는 선 -->
				<div id="line1"></div>
				<!-- 본문 영역 소제목 -->
				<div id="subTitle">발주 조회</div>
			</div>
			<!-- 본문영역 상단부 끝 -->
			
			<!-- 본문영역 중앙부 -->
			<div id="contentArea">
				<!-- 조회 정보 입력 부분 -->
				<div id="searchArea">
						<!-- 조회 제목 -->
						<div id="subSubTitle1">발주 조회</div>
						<!-- 조회 상자 테두리-->
						<div id="searchBox">
							<form id="searchForm">
								<table>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
										
										<td style="width:140px" name="">발주구분 :
											<select>
											   <option>선택</option>
					                           <option>정량</option>
					                           <option>정기</option>                        
                        					</select>
										</td>
										
										<td style="width:160px">발주코드  :
											<input type="text" class="searchTextBox" size="10" name=""></td>
										
										<td style="width:130px">상품명  :
											<input type="text" class="searchTextBox" size="7" name=""></td>
										
										<td style="width:150px">상품코드  :
											<input type="text" class="searchTextBox" size="7" name=""></td>
										
										<td style="width:150px">매입처  :
										<input type="text" class="searchTextBox" size="7" name=""></td>
																										
										<td>승인  :
										<input type="text" class="searchTextBox" size="1" name="">
										</td>			
										<td rowspan="2"><input type="submit" class="btn" value="검색" id="submit"></td>
										
									</tr>
									<tr>
										
										<td colspan="3" style="width:400px">발주일  :
										<input type="date" class="searchTextBox" name="">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
										<input type="date" class="searchTextBox" name="">
										</td>
										
										<td>신청자  :
										<input type="text" class="searchTextBox" size="4" name="">
										</td>
										
										<td colspan="2">입고예정  :
										<input type="date" class="searchTextBox" style="width:130px;" name="">
										</td>
								
										
										
										
					
									</tr>
								</table>
							</form>
						</div>
				</div>
				
				
					
				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">발주 리스트</div>
					<!-- 적용 버튼 -->
					<button onclick="" class="btn" id="btnMore">상세</button>
					<button onclick="" class="btn" id="btnOk">승인</button>
					<button onclick="" class="btn" id="btnNo">거부</button>
					<!-- 조회 리스트 테이블 -->
					<table id="listTable10">
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th>선택</th>
								<th>발주구분</th>
								<th>발주코드</th>
								<th>상품명</th>
								<th>상품코드</th>
								<th>매입처</th>
								<th>발주일</th>
								<th>신청자</th>
								<th>입고예정</th>
								<th>승인여부</th>

								
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
								<td>승인</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			
			</div>
			<!-- 본문영역 중앙부 끝 -->
			
	</div>
	
	
	


</body>
</html>