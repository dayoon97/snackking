<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/misoCSS.css">
</head>
<body>
	<div>
	<!-- 메뉴바 가져오기 -->
			<%@ include file="../common/menubar.jsp" %>
	

	
		<!-- 본문 영역 내용 들어가는 흰색 큰 박스 -->
		<div id="background-box">
		
			<!-- 본문영역 상단부 -->
			<div id="titleArea">
				<!-- 본문 영역 제목 -->
				<div id="mainTitle">상품 관리</div>
				<!-- 본문 영역 제목 밑에있는 선 -->
				<div id="line1"></div>
				<!-- 본문 영역 소제목 -->
				<div id="subTitle">상품 추가</div>
			</div>
			<!-- 본문영역 상단부 끝 -->
			
			<div id="subSubTitle1">정보 입력</div>
			
			
			
			<!-- 폼시작 -->
			<form id="addForm">
				<table border="1px" id="addTable">				
					<tr>
						<td rowspan="5" colspan="2" style="width:10%;"></td>
						<td style="width:10%;">테스트</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					<tr>
						<td colspan="3" style="width:10%;">상품명: <input type="text"></td>
						<td colspan="3" style="width:10%;">카테고리 선택</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					<tr>
						<td colspan="3" style="width:10%;">가격: <input type="text"></td>
						<td colspan="3" style="width:10%;">기본 유통기한: <input type="text"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>

					<tr>
						<td colspan="3" style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					<tr>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>

					<tr>
						<td colspan="2" style="width:10%;">파일찾기</td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
					</tr>
					
					<tr>
						<td colspan="2" style="width:10%;">맛 선택<br>(중복 가능)</td>
						<td style="width:10%;">달콤</td>
						<td style="width:10%;">짭짤</td>
						<td style="width:10%;">고소</td>
						<td style="width:10%;">담백</td>
						<td style="width:10%;">새콤</td>
						<td style="width:10%;">매콤</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>

					<tr>
						<td colspan="2" rowspan="2" style="width:10%;">향 선택<br>(중복 가능)</td>
						<td style="width:10%;">초코</td>
						<td style="width:10%;">딸기</td>
						<td style="width:10%;">바닐라</td>
						<td style="width:10%;">민트</td>
						<td style="width:10%;">청포도</td>
						<td style="width:10%;">바나나</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					
					<tr>
						<td style="width:10%;">땅콩</td>
						<td style="width:10%;">커피</td>
						<td style="width:10%;">소다</td>
						<td style="width:10%;">시나몬</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>	
					<tr>
						<td colspan="2" rowspan="2" style="width:10%;">알레르기 성분 선택<br>(중복 가능)</td>
						<td colspan="2" style="width:10%;">밀</td>
						<td colspan="2" style="width:10%;">계란</td>
						<td colspan="2" style="width:10%;">대두</td>
						<td colspan="2" style="width:10%;">갑각류</td>
					</tr>	
					<tr>
						<td colspan="2" style="width:10%;">메밀</td>
						<td colspan="2" style="width:10%;">유제품</td>
						<td colspan="2" style="width:10%;">땅콩</td>
						<td colspan="2" style="width:10%;">해당없음</td>
					</tr>	
					<tr>
						<td colspan="2" style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td colspan="2" style="width:10%;">등록버튼 넣기</td>
						<td colspan="2" style="width:10%;">취소버튼 넣기</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>

					</tr>	
					<tr>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					
					
														
				</table>
			</form>
			
			
			
			
			
		</div>	
	</div>	
		
		
</body>
</html>