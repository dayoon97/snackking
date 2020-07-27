<%@page import="com.kh.snackking.board.model.vo.Attachment"%>
<%@page import="com.kh.snackking.product.model.vo.Product, com.kh.snackking.product.model.vo.ProductAttachment, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% Product product = (Product) request.getAttribute("product"); %>
	<% ProductAttachment productAttachment = (ProductAttachment) request.getAttribute("productAttachment"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<style>
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mine.css">
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../common/userMenu.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
			<!-- title-area start -->
				<div id="titleArea">
					<div id="mainTitle">상품 관리</div>
					<div id="line1"></div>
					<div id="subTitle">상품 정보 수정</div>
					<button type ="submit" class="searchBtn center right top5" id="add" form="addProductForm">수정완료</button>
					<div class="searchBtn center right top4" id="back">뒤로가기</div>
				</div>	<!--title-area end -->
		
			<!-- 폼시작 -->
			<form id="addProductForm" action="<%=request.getContextPath()%>/updateProduct.pr" method="post" encType="multipart/form-data">
				<table id="addProductTable">	
					<tr style="height: 80px;">
						<td rowspan="5" colspan="2" class="pictureTd" ><div id="picture" style="background: white;"><img id="productImg" src="<%=request.getContextPath()%>/product_uploadImages/<%=productAttachment.getChangeName() %>" width="60px" height="auto"></div></td>
						<td colspan="8" style="width:10%;"><div id="fileArea" ><input type="file" id="pictureHidden" name="pictureHidden" onchange="loadImg(this);" style="width:250px !important; height: 30px !important;"></div></td>
						
					</tr>
					<tr>
						<td colspan="4" style="width:10%;"></td>
						<td colspan="4" style="width:10%; height: 35px;"></td>
						
					</tr>
					<tr>
						<td colspan="4" style="width:10%; height: 45px;">상품명 : <input type="text" value="<%= product.getpName() %>" name="pName" class="searchTextBox" style="font-weight: bold;" size="18" readonly="readonly"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					<tr>
						<td colspan="4" style="width:10%; height: 45px;">상품업체명 : <input type="text" value="<%=product.getpVendor() %>" class="searchTextBox" style="font-weight: bold;" size="14" name="pVendor"></td>
						<td colspan="3" style="width:10%;">상품종류 :
							<div class="dropdown" style="width:170px; text-align:center;">
     							<div class="select">
       								<span id=ptNameSpan><%=product.getPtName()%></span>
							          <i class="fa fa-chevron-left"></i>
							        </div>
							        <input type="hidden" name="ptName" value="<%=product.getPtName()%>">
							        <ul class="dropdown-menu">
				                           <li id="선택">선택</li>
				                           <li id="과자">과자</li>
				                           <li id="캔디/껌/초콜릿">캔디/껌/초콜릿</li>
				                           <li id="커피/차">커피/차</li>					                         
				                           <li id="음료">음료</li>
				                           <li id="컵라면/컵밥">컵라면/컵밥</li>
				                           <li id="케이크">케이크</li>  
							        </ul>
							      </div>
						</td>
						
						
						
						
						<td style="width:10%;"></td>

					</tr>
					<tr>
						
						<td colspan="4" style="width:10%; height: 45px;">가격 : <input type="text" class="searchTextBox" value="<%=product.getPrice() %>" style="font-weight: bold;" size="18" name="price">&nbsp;원</td>
						<td colspan="3" style="width:10%;">기본 유통기한 : <input type="text" value="<%=product.getpExp()%>" class="searchTextBox" style="font-weight: bold;" size="12" name="pExp">&nbsp;개월</td>
						<td style="width:10%;"></td>
					</tr>

					
					

					<tr>
						<td colspan="2" style="width:10%; height: 35px;"><각 선택사항 중복가능></td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
					</tr>
					
					<tr>
						<td colspan="2" style="width:10%; height:35px;">나이 선택</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="age" value="20">20대</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="age" value="30">30대</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="age" value="40">40대</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="age" value="50">50대</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="age" value="60">60대</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					
					<tr>
						<td colspan="2" style="width:10%; height:35px;">맛 선택</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="taste" value="달콤">달콤</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="taste" value="짭짤">짭짤</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="taste" value="고소">고소</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="taste" value="담백">담백</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="taste" value="새콤">새콤</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="taste" value="매콤">매콤</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>

					<tr>
						<td colspan="2" rowspan="2" style="width:10%; height:60px;">향 선택</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="초코">초코</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="딸기">딸기</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="바닐라">바닐라</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="민트">민트</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="청포도">청포도</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="바나나">바나나</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>
					
					<tr>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="땅콩">땅콩</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="커피">커피</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="소다">소다</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="시나몬">시나몬</td>
						<td style="width:10%;"><input type="checkbox" class="a" name="flavor" value="기타">기타</td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
					</tr>	
					<tr>
						<td colspan="2" style="width:10%;  height:35px;">알레르기 성분</td>
						<td colspan="1" style="width:10%;"><input type="checkbox" class="a" name="allergy" value="밀">밀</td>
						<td colspan="1" style="width:10%;"><input type="checkbox" class="a" name="allergy" value="계란">계란</td>
						<td colspan="1" style="width:10%;"><input type="checkbox" class="a" name="allergy" value="대두">대두</td>
						<td colspan="1" style="width:10%;"><input type="checkbox" class="a" name="allergy" value="갑각류">갑각류</td>
						<td colspan="1" style="width:10%;"><input type="checkbox" class="a" name="allergy" value="메밀">메밀</td>
						<td colspan="1" style="width:10%;"><input type="checkbox" class="a" name="allergy" value="유제품">유제품</td>
						<td colspan="1" style="width:10%;"><input type="checkbox" class="a" name="allergy" value="땅콩">땅콩</td>
						<td colspan="1" style="width:10%;"><input type="checkbox" class="a" name="allergy" value="해당없음">해당없음</td>
					</tr>	
					<tr>
						<td colspan="2" style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
						<td colspan="2" style="width:10%;"></td>
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


//취소 버튼 클릭시 상품 조회 메뉴로 돌아가시

	$("#back").click(function() {
		location.href="<%=request.getContextPath()%>/views/product/productManagement.jsp"
	}); 




	//file type input 박스에 이미지 파일 로드시 실행될 함수 
	function loadImg(value) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				//상단 회색 div 안에 있는 img 태그 productImg
				$("#productImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
			//사진 가로길이 180으로 하고 세로는 auto로 해서 비율 맞춤.
			//사진 틀은 182로 하고 틀 테두리 2로 함
			//사진 넣고 하단에 남는 여백은 사진 등록하자마자 흰색으로 바꿈
			$("#picture").css({"background":"white"});
		}
	}
	
	
	
		
		
	
	//ready 이벤트는 여러개 작성되어 있으면 위에서부터 순서대로 모두 실행, onload 함수는 한번만 실행
	$(document).ready(function() {
		//사진 클릭시 파일을 등록 가능하게 하기
		//input 박스 있는 td 요소 안보이게하기
		$("#picture").click(function(){
			$("#pictureHidden").click();
		});
		//하단 input type =file 은 숨겨준다
		$("#fileArea").hide();
	});
	
	
	$(document).ready(function() {
		
		//","로 구분된 String 을 쪼개서 배열에 담는다.
		var age = "<%=product.getAge()%>".split(",");
		console.log(age);
		//name이 age인 요소들을 모두 가져와서 age 배열에 있는 값들인지 확인한 후 있으면 check 처리한다. 
		$("input:checkbox[name=age]").each(function() {
			for(var i = 0; i < age.length; i++){
				if($(this).val() == age[i]){
					$(this).attr("checked", true);
				}
			}
		});
		
		
		//taste :  ","로 구분된 String 을 쪼개서 배열에 담는다.
		var taste = "<%=product.getTaste()%>".split(",");
		console.log(taste);
		$("input:checkbox[name=taste]").each(function() {
			for(var i = 0; i < taste.length; i++){
				if($(this).val() == taste[i]){
					$(this).attr("checked", true);
				}
			}
		});
		
	

		
		//allergy :  ","로 구분된 String 을 쪼개서 배열에 담는다.
		var allergy = "<%=product.getAllergy()%>".split(',');
		console.log(allergy);
		$("input:checkbox[name=allergy]").each(function() {
			for(var i = 0; i < allergy.length; i++){
				if($(this).val() == allergy[i]){
					$(this).attr("checked", true);
				}
			}
		});
		 
		
		//flavor :  ","로 구분된 String 을 쪼개서 배열에 담는다.
		var flavor = "<%=product.getFlavor()%>".split(",");
		console.log(flavor);
		$("input:checkbox[name=flavor]").each(function() {
			for(var i = 0; i < flavor.length; i++){
				if($(this).val() == flavor[i]){
					$(this).attr("checked", true);
				}
			}
		});

	});

	
	
	

</script>

</html>