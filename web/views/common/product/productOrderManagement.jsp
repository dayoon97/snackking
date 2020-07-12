<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../../resources/css/mine.css">
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

	<%@ include file="../menu/cmMain.jsp" %> 
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
		
			<!-- title-area start ---------------------------------------------------------------------------->
			<div id="titleArea">
				<div id="mainTitle">상품 관리</div>
				<div id="line1"></div>
				<div id="subTitle">발주 조회</div>	
			</div>	<!--title-area end ---------------------------------------------------------------------------->
			
			<!-- search-area start ---------------------------------------------------------------------------->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">발주 조회</div>
					<!-- searchBox start -->
						<div id="searchBox" style="height: 120px !important; display: table !important;">
							<form id="searchForm" style="display:table-cell !important; vertical-align:middle !important; ">
								<table id="searchOrder"  style="margin-left: auto !important; margin-right: auto !important; border-spacing: 20px 10px" >
									<tr style="height:34px !important;">
										
										<!--------옵션-------------------------------------->
										<td width="185px">발주구분 :
											<div class="dropdown">
	        									<div class="select">
	          										<span>선택</span>
											          <i class="fa fa-chevron-left"></i>
											     </div>
											        <input type="hidden" name="productKinds">
											        <ul class="dropdown-menu">
								                           <li id="선택">선택</li>
								                           <li id="정량">정량</li>
								                           <li id="정기">정기</li>
											        </ul>
											 </div>
										</td>
										<!--------옵션-------------------------------------->	
										
                        				<td width="170px">발주코드  :
											<input type="text" class="searchTextBox" size="10" name="">
										</td>
										<td width="150px">상품명  :
											<input type="text" class="searchTextBox" size="7" name="">
										</td>
										<td width="150px">상품코드  :
											<input type="text" class="searchTextBox" size="6" name="">
										</td>
										<td rowspan="3"><input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="float: right;"></td>
									</tr>
									<tr>	
										<td colspan="3">발주일  :
										<input type="date" class="searchTextBox" name="">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
										<input type="date" class="searchTextBox" name="">
										</td>
																									
										<td>신청자  :
										<input type="text" class="searchTextBox" size="8" name="">
										</td>
									
									</tr>

									
									<tr>	

										<td>발주회사명  :
											<input type="text" class="searchTextBox" size="7" name="">
										</td>
										
										<td>승인상태  :
												<div class="dropdown">
		        									<div class="select">
		          										<span>선택</span>
												          <i class="fa fa-chevron-left"></i>
												     </div>
												        <input type="hidden" name="productKinds">
												        <ul class="dropdown-menu">
									                           <li id="선택">선택</li>
									                           <li id="승인">승인</li>
									                           <li id="미승인">미승인</li>
												        </ul>
												 </div>
										</td>	
										
										<td colspan="2">입고예정 : 
											<input type="date" class="searchTextBox" style="width:130px;" name="">
										</td>
									</tr>
								</table>
								
							</form>
						</div>
				</div><!-- search-area end ---------------------------------------------------------------------------->


			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					
					<div id="subSubTitle2" style="top:325px !important;">발주 리스트</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<span id="apply" style="top:330px !important;">조회 결과 수 :</span>
						<!-- 테이블 시작 -->
						<!-- 조회 리스트 테이블 -->
					<table id="listTable10" style="top:365px !important;">
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th>발주구분</th>
								<th>발주코드</th>
								<th>상품명</th>
								<th>상품코드</th>
								<th>발주회사명</th>
								<th>발주일</th>
								<th>신청자</th>
								<th>입고예정</th>
								<th>승인상태</th>
								<th>승인버튼</th>

								
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