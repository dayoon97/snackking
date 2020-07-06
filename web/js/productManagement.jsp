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
<link rel="stylesheet" type="text/css" href="../css/misoCSS.css"/>
</head>
<body>
	<div>
	<!-- 메뉴바 가져오기 -->
	<%@ include file="../views/commom/menubar.jsp" %>

	
	

	
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
						<div id="subSubTitle1">상품 검색</div>
						<!-- 조회 상자 테두리-->
						<div id="searchBox">
							<form id="searchForm">
								<table>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
										<td style="width:180px">상품코드  :
										<input type="text" class="searchTextBox" size="7"></td>
																			
										<td style="width:220px">상품종류  :
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
										
										<td style="width:140px">향  :
											<select>
					                           <option>선택</option>
					                           <option>초코</option>
					                           <option>딸기</option>
					                           <option>바나나</option>
					                           <option>포도</option>
					                           <option>바닐라</option>
					                           <option>커피</option>
					                           <option>민트</option>
					                           <option>소다</option>
					                           <option>시나몬</option>
					                           <option>땅콩</option>
                        					</select>
										</td>
										
										<td style="width:140px">맛  :
											<select>
											   <option>선택</option>
					                           <option>달콤</option>
					                           <option>짭짤</option>
					                           <option>고소</option>
					                           <option>담백</option>
					                           <option>새콤</option>
					                           <option>매콤</option>
                        					</select>
										</td>
										<td><input type="submit" class="btn" value="검색" id="submit" style="margin-left:85px;"></td>
										
									</tr>
									<tr>
										<td>상품명  :
										<input type="text" class="searchTextBox" size="9	"></td>
										
										
										
										<td>알레르기 성분  :
											<select>
											   <option>선택</option>
					                           <option>밀</option>
					                           <option>대두</option>
					                           <option>계란</option>
					                           <option>땅콩</option>
					                           <option>갑각류</option>
					                           <option>메밀</option>
					                           <option>유제품</option>
					                           <option>해당없음</option>
                        					</select>
										</td>
										
										<td colspan="2">가격  :
										<input type="text" class="searchTextBox" size="7"> ~
										<input type="text" class="searchTextBox" size="7"> 원
										</td>
										
										<td>기본 유통기한  :
										<input type="text" class="searchTextBox" size="4"> 개월
										</td>
					
									</tr>
								</table>
							</form>
						</div>
				</div>
				
					
				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">상품 리스트</div>
					<!-- 적용 버튼 -->
					<button onclick="" class="btn" id="btnAdd">추가</button>
					<button onclick="" class="btn" id="btnUpdate">수정</button>
					<button onclick="" class="btn" id="btnDelete">삭제</button>
					
				
					
					<!-- 조회 리스트 테이블 -->
					<table id="listTable10">
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
								<td>내용</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 본문영역 중앙부 끝 -->
		</div>
	</div>
	
	
	
	
	
	<!---- 상품 추가 모달 내용 --------------------------------------------------->
     <div id="myModal" class="modal">
       <!-- Modal content -->
       <div class="modal-content">
         <span class="close">&times;</span>
         
         
         
         
         
         
         
	  </div>
	</div>
	
	
	
      <!---- 모달 내용 끝--------------------------------------------------------->	
	
	
	
	
</body>


<!-- 모달 스크립트 -->
<script>
//Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("btnAdd");

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