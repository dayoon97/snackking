<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../../resources/css/mine.css">
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../menu/cmMain.jsp" %> 
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
			<!-- title-area start -->
				<div id="titleArea">
					<div id="mainTitle">상품 관리</div>
					<div id="line1"></div>
					<div id="subTitle">상품 추가</div>
				</div>	<!--title-area end -->
			
			<!-- 폼시작 -->
			<form id="addForm">
				<table id="addProductTable">	
					<tr style="height: 80px;">
						<td rowspan="5" colspan="2" class="pictureTd" ><div id="picture"></div></td>
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
						<td colspan="4" style="width:10%; height: 45px;">상품명 : <input type="text" class="searchTextBox" style="font-weight: bold;" size="24"></td>
						<td colspan="3" style="width:10%;">상품종류 :
							<div class="dropdown" style="width:170px; text-align:center;">
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
						
						
						
						
						<td style="width:10%;"></td>

					</tr>
					<tr>
						
						<td colspan="4" style="width:10%; height: 45px;">가격 : <input type="text" class="searchTextBox" style="font-weight: bold;" size="22">&nbsp;원</td>
						<td colspan="3" style="width:10%;">기본 유통기한 : <input type="text" class="searchTextBox" style="font-weight: bold;" size="12">&nbsp;개월</td>
						<td style="width:10%;"></td>
					</tr>

					
					

					<tr>
						<td colspan="2" style="width:10%; height: 35px;">파일찾기</td>
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
						<td colspan="2" style="width:10%;"><input type="submit" class="searchBtn" value="등록"></td>
						<td colspan="2" style="width:10%;"><input type="reset" class="searchBtn" value="취소"></td>
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
		
		
		
			</div>	
		</div>	
	</div>	
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