<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/mine.css">
<style type="text/css">
#apply{
	position:absolute;	
	top:300px !important;
	right:90px !important;
	}

	

</style>
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../common/cmMain.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
		
			<!-- title-area start ---------------------------------------------------------------------------->
			<div id="titleArea">
				<div id="mainTitle">상품 관리</div>
				<div id="line1"></div>
				<div id="subTitle">재고 등록 및 조회</div>	
			</div>	<!--title-area end ---------------------------------------------------------------------------->
			
			<!-- search-area start ---------------------------------------------------------------------------->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">재고 등록 내역 조회</div>
					<!-- searchBox start -->
						<div id="searchBox" style="height: 90px !important; display: table !important;">
							<div id="searchForm" style="display:table-cell !important; vertical-align:middle !important; ">
								<table id="searchOrder"  style="margin-left: auto !important; margin-right: auto !important; border-spacing: 20px 10px" >
									<tr style="height:34px !important;">
										
										<!--------옵션-------------------------------------->
										<td>등록번호  :
										<input type="text" class="searchTextBox" size="8" name="storageCode">
										</td>
										<!--------옵션-------------------------------------->	
										
                        				<td>
										</td>
										<td width="150px">상품명  :
											<input type="text" class="searchTextBox" size="8" name="pName">
										</td>
										<td width="185px" colspan="2"><label style="color:purple; font-weight: bold;">COLOR :</label>
											<div class="dropdown">
	        									<div class="select">
	          										<span>선택</span>
											          <i class="fa fa-chevron-left"></i>
											     </div>
											        <input type="hidden" name="color">
											        <ul class="dropdown-menu">
								                           <li id="">선택</li>
								                           <li id="RED" style="color:red;">RED</li>
								                           <li id="YELLOW" style="color:orange;">YELLOW</li>
								                           <li id="GRAY" style="color:gray;">GRAY</li>
											        </ul>
											 </div>
										</td>
										
										<td rowspan="3"><input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="float: right;"></td>
									</tr>
									<tr>	
										<td colspan="2">입고일  :
										<input type="date" class="searchTextBox" name="storageDate">
										</td>
										<td width="150px" colspan="2">제조일  :
										<input type="date" class="searchTextBox" name="mfd">
										</td>															
										
									
									</tr>
								</table>
								
							</div>
						</div>
				</div><!-- search-area end ---------------------------------------------------------------------------->


			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					
					<div id="subSubTitle2" style="top:325px !important; width: 130px !important;">재고 등록 내역</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<input type="button" class="addBtn btn-position btn" id="myBtndd" value="재고등록">
						<!-- 테이블 시작 -->
					
						<!-- 조회 리스트 테이블 -->
					<table id="listTable10" style="top:365px !important;">
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th>등록번호</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>입고일</th>
								<th>입고 수량</th>
								<th>로케이션</th>
								<th>제조일</th>
								<th>입고구분</th>
								<th>입고구분코드</th>
								<th>유통기한 색상</th>

								
							</tr>
						</thead>
						<tbody>
						<!-- 리스트 바디  -->
							<tr class="hover">
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
							<tr class="hover">
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
					<!-- 테이블 끝 -->
			</div>
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->
<!-- 재고 등록모달 ---------------------------------------------------------------------->
						

						
						
<!-- 재고 등록모달 끝 ---------------------------------------------------------------------->



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

//검색 버튼 클릭시 화면 바뀌게 하기
$(function() {
	$(".searchBtn").click(function(){
		var storageDate = $("input[name=storageDate]").val();
		var mfd = $("input[name=mfd]").val();
		var pName = $("input[name=pName]").val();
		var color = $("input[name=color]").val();
		var storageCode = $("input[name=storageCode]").val();
			
		var arr = {
				"storageDate" : storageDate,
				"mfd" : mfd,
				"pName" : pName,
				"storageCode": storageCode,
				"color" : color,
		};
		
		$.ajax({
			url: "<%=request.getContextPath()%>/selectProductStorage",
			data: arr,
			type: "get",
			success: function(data){
				
				console.log("성공");
				/* $tableBody = $("#listTable tbody");
				$tableBody.html('');
				$tableBody.find("tr").remove();
				
						for(var key in data){
							//클래스 속성 추가
							var $tr =  $("<tr>").attr('class','listBody');
							var $td1 = $("<td>").html('<input type="checkbox" name="chk" onclick="only(this)">');
							var $td2 = $("<td>").text(data[key].equipCode);
							var $td3 = $("<td>").text(data[key].equipType);
							var $td4 = $("<td>").text(data[key].equipName);
	 						var $td5 = $("<td>").text(data[key].possible);
	 						var $td6 = $("<td>").text(data[key].equipMake);
							$tr.append($td1);
							$tr.append($td2);
							$tr.append($td3);
	 						$tr.append($td4);
	 						$tr.append($td5);
	 						$tr.append($td6);
							$tableBody.append($tr);
							
						}	 */
				},
				error: function(error){
					console.log("에러!" + error);
				}
		});
	});
});  


</script>


</html>