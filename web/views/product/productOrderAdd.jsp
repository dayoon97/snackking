<%@page import="com.kh.snackking.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%-- <% String msg = (String) request.getAttribute("msg"); %>
	<% Product product = (Product) request.getAttribute("product"); %> --%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/mine.css">
<style type="text/css">
	#addProductTable2{
		/*겉에 테두리 만들어줌.. 회색 테두리*/
		border: 1px solid rgba(75, 75, 75, 0.23);
		border-radius: 33.5px;
		height: 510px;
		width: 1000px;
	
		margin-left: 40px;
	}
</style>
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
					<div id="subTitle">발주 추가</div>
					<button type ="submit" class="searchBtn center right top5" id="add" form="addProductForm">등록</button>
					<div class="searchBtn center right top4" id="back">뒤로가기</div>
				</div>	<!--title-area end -->
		
			<!-- 폼시작 -->
			<form id="addProductForm" action="" method="post" encType="multipart/form-data">
				<table id="addProductTable2" style=" border: 1px solid black;">	
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>　</td>
						<td>　</td>
						<td width="100px" height="10px">상품명 : </td>
						<td width="100px"><input type="text" name="proName" placeholder="칸쵸" size="10"></td>
						<td>　</td>
						<td width="100px">업체명 : </td>
						<td width="100px"><input type="text" name="proCom" placeholder="오리온" size="10"></td>
						<td>　</td>
						<td>　</td>	
						<td>　</td>
						<td>　</td>	
						<td>　</td>
						<td>　</td>					
					</tr>
					
					<tr>
						<td>개수 : <input type="text" name="proCount" placeholder="5" size="5">EA</td>
						
					</tr>
					
					<tr>
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
		location.href="<%=request.getContextPath()%>/views/product/productOrderManagement.jsp"
	}); 

//하단 input type =file 은 숨겨준다
	$("#fileArea").hide();
	




	<%-- 	$(function() {
		$("#add").click(function() {
			$("form").submit();

			
			var pName = $("input[name=pName]").val();
			var pExp = $("input[name=pExp]").val();
			var pVendor = $("input[name=pVendor]").val();
			var ptName = $("input[name=ptName]").val();
			var price = $("input[name=price]").val();
			//var flavor = $("input[name=flavor]:checked").val(); //배열
			//var taste = $("input[name=taste]:checked").val(); //배열
			//var allergy = $("input[name=allergy]:checked").val(); //배열
			//var age = $("input[name=age]:checked").val(); //배열
			
			//flavor 배열-------------------------------------
			var flavor = '';
			//배열에다 name이 age 인 애들 val 값 담기
			//index만큼 반복문 돌림
			$("input[name=flavor]:checked").each(function(index, item) { 
				if(index != 0)	{
					//첫번째가 아니면 앞에 , 찍음
					flavor += ',';					
				}
				flavor += $(this).val();
			});
			//----------------------------------------------
			
			//taste 배열-------------------------------------
			var taste = '';
			//배열에다 name이 taste 인 애들 val 값 담기
			//index만큼 반복문 돌림
			$("input[name=taste]:checked").each(function(index, item) { 
				if(index != 0)	{
					//첫번째가 아니면 앞에 , 찍음
					taste += ',';					
				}
				taste += $(this).val();
			});
			//----------------------------------------------

			//allergy 배열-------------------------------------
			var allergy = '';
			//배열에다 name이 allergy 인 애들 val 값 담기
			//index만큼 반복문 돌림
			$("input[name=allergy]:checked").each(function(index, item) { 
				if(index != 0)	{
					//첫번째가 아니면 앞에 , 찍음
					allergy += ',';					
				}
				allergy += $(this).val();
			});
			//----------------------------------------------
			
			//age 배열-------------------------------------
			var age = '';
			//배열에다 name이 age 인 애들 val 값 담기
			//index만큼 반복문 돌림
			$("input[name=age]:checked").each(function(index, item) { 
				if(index != 0)	{
					//첫번째가 아니면 앞에 , 찍음
					age += ',';					
				}
				age += $(this).val();
			});
			//----------------------------------------------

			//객체에 다 담기
			var arr = {
					"pName" : pName,
					"pExp": pExp,
					"pVendor" : pVendor,
					"ptName" : ptName,
					"price" : price,
					"flavor" : flavor,
					"taste" : taste,
					"allergy" : allergy,
					"age" : age
			};
			console.log(arr);
			
		 	$.ajax({
				url: "<%=request.getContextPath()%>/productInsert",
				data: arr,
				type: "get",
				success: function(data){
					if(data[key].result.result.equals("-1")){
						alert("상품명이 중복됩니다");
					}else if(data[key].result.equals("1")){
						alert("상품 등록에 성공하였습니다");
						location.href="<%=request.getContextPath()%>/views/product/productManagement.jsp";
					}else{
						console.log("실패");
						
					}
 				},
 				error: function(error){
 					console.log("에러!" + error);
 				}
			});
			
			
	
			
			 
		});
	});
	--%>


	
	
	$(function() {
		 if(msg != null){ 
			
			alert("wfwfef");
		 	//alert(msg.equals("상품명이 중복되었습니다"));
		 }
	});
	

</script>

</html>