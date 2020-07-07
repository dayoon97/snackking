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
	
			
			<!-- 폼시작 -->
			<form id="addForm">
				<table id="addTable">		<!--  border="1px"  -->		
					<tr>
						<td rowspan="5" colspan="2" style="width:10%;" class="picture">
						<img id="productImg" width="" height="">
						
						</td>
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
						<td colspan="3" style="width:10%;">&nbsp;&nbsp;상품명: &nbsp;&nbsp;<input type="text" class="searchTextBox" size="15"></td>
						<td colspan="3" style="width:10%;">카테고리 선택</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					<tr>
						<td colspan="3" style="width:10%;">&nbsp;&nbsp;&nbsp;&nbsp;가격: &nbsp;&nbsp;<input type="text" class="searchTextBox" size="16.5"></td>
						<td colspan="3" style="width:10%;">기본 유통기한: &nbsp;&nbsp;<input type="text" class="searchTextBox"></td>
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
						<td colspan="2" style="width:10%;">
							<div id="fileArea">
								<input type="file" id="productImgFile" name="productImgFile" onchange="loadImg(this);">
							</div>
						</td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
					</tr>
					
					<tr>
						<td colspan="2" style="width:10%; text-align:center;">맛 선택<br>(중복 가능)</td>
						<td style="width:10%;"><input type="checkbox" class="a">달콤</td>
						<td style="width:10%;"><input type="checkbox" class="a">짭짤</td>
						<td style="width:10%;"><input type="checkbox" class="a">고소</td>
						<td style="width:10%;"><input type="checkbox" class="a">담백</td>
						<td style="width:10%;"><input type="checkbox" class="a">새콤</td>
						<td style="width:10%;"><input type="checkbox" class="a">매콤</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>

					<tr>
						<td colspan="2" rowspan="2" style="width:10%; text-align:center;">향 선택<br>(중복 가능)</td>
						<td style="width:10%;"><input type="checkbox" class="a">초코</td>
						<td style="width:10%;"><input type="checkbox" class="a">딸기</td>
						<td style="width:10%;"><input type="checkbox" class="a">바닐라</td>
						<td style="width:10%;"><input type="checkbox" class="a">민트</td>
						<td style="width:10%;"><input type="checkbox" class="a">청포도</td>
						<td style="width:10%;"><input type="checkbox" class="a">바나나</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					
					<tr>
						<td style="width:10%;"><input type="checkbox" class="a">땅콩</td>
						<td style="width:10%;"><input type="checkbox" class="a">커피</td>
						<td style="width:10%;"><input type="checkbox" class="a">소다</td>
						<td style="width:10%;"><input type="checkbox" class="a">시나몬</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>	
					<tr>
						<td colspan="2" rowspan="2" style="width:10%; text-align:center;">알레르기 성분 선택<br>(중복 가능)</td>
						<td colspan="2" style="width:10%;"><input type="checkbox" class="a">밀</td>
						<td colspan="2" style="width:10%;"><input type="checkbox" class="a">계란</td>
						<td colspan="2" style="width:10%;"><input type="checkbox" class="a">대두</td>
						<td colspan="2" style="width:10%;"><input type="checkbox" class="a">갑각류</td>
					</tr>	
					<tr>
						<td colspan="2" style="width:10%;"><input type="checkbox" class="a">메밀</td>
						<td colspan="2" style="width:10%;"><input type="checkbox" class="a">유제품</td>
						<td colspan="2" style="width:10%;"><input type="checkbox" class="a">땅콩</td>
						<td colspan="2" style="width:10%;"><input type="checkbox" class="a">해당없음</td>
					</tr>	
					<tr>
						<td colspan="2" style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td colspan="2" style="width:10%;"><input type="submit" class="btn-wide" value="등록"></td>
						<td colspan="2" style="width:10%;"><input type="reset" class="btn-wide" value="취소"></td>
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
						<td style="width:10%;">k</td>
					</tr>
					
					
														
				</table>
			</form>
			<script>
			$(function() {
				
				$("#fileArea").hide();
				
				$("#productImg").click(function(){
					$("#productImgFile").click();
				});
			});
				
				function loadImg(value) {
					if(value.files) {
						var reader = new FileReader();
						reader.onload = function(e) {
						$("#productImg").attr("src", e.target.result);
						reader.readAsDataURL(value);
						}
					}
				}
					
			</script>
		</div>	
	</div>	
		
		
</body>
</html>