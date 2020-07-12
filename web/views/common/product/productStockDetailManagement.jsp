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
	right:220px !important;
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
				<div id="subTitle">상품 재고 확인</div>
			</div>	<!--title-area end ---------------------------------------------------------------------------->
			
			<!-- search-area start ---------------------------------------------------------------------------->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">재고 조회</div>
					<!-- searchBox start -->
						<div id="searchBox" style="height: 90px !important; display: table;">
							<form id="searchForm" style="display:table-cell; vertical-align:middle">
								<div>
								<table id="searchStock" class="left">
									<tr style="height:34px !important;">
										<!-- 검색 내용 타이핑하는 부분 -->	
										<td>매입처  :
											<input type="text" class="searchTextBox" size="6" name="">
										</td>
										<td>상품종류  :
										<div class="dropdown">
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
										<td style="width:150px">상품명  :
											<input type="text" class="searchTextBox" size="6" name="">
										</td>
										<td><input type="checkbox" class="a">재고없는 상품 조회</td>
									</tr>
									<tr>	
										<td style="width:170px">상품코드  :
											<input type="text" class="searchTextBox" size="6" name="">
										</td>
                       					<td colspan="2">재고기준  :
											<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="stockKinds">
										        <ul class="dropdown-menu">
							                           <li id="선택">선택</li>
							                           <li id="총수량">총수량</li>
							                           <li id="출고가능">출고가능</li>
							                           <li id="입고진행">입고진행</li>
							                           <li id="출고진행">출고진행</li>
							                           <li id="교환예정">교환예정</li>					                         
										        </ul>
										      </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										             					
                       						<input type="text" class="searchTextBox" size="3" name="">&nbsp;&nbsp;~&nbsp;&nbsp;
                       						<input type="text" class="searchTextBox" size="3" name="">&nbsp;&nbsp;개
                        				</td>
										<td rowspan="2"><input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="float: right;"></td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div><!-- search-area end ---------------------------------------------------------------------------->


			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle1" style="top:310px !important;">재고 상세 정보</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<span id="apply" style="top:310px !important;">조회 결과 수 :</span>
					<div>
						<table class="prductStockDetail" border="1" style="vertical-align:middle">
							<thead>
								<tr>
									<th>상품정보</th><th>재고상태</th><th colspan="3">유통기한</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="5" class="padding1">
										<div><span  class="pCode left">00700</span><span class="red right">111</span><span class="right padding">총재고</span></div>
										<br><br>
										<div class="pName">초코송이</div>
										<div class="line1"></div>
										<br><br>
										<div class="left padding2"><span>상품종류 : </span><span>과자</span></div>
										<br>
										<div class="left padding2"><span>업체명 : </span><span>(주)오리온</span></div>
									
									
									
									</td>
									<td>입고진행 수량</td>
									<td colspan="3">
										<div class="text-align"><div class="expGrayBox1 left">정보없음</div><div class="expGrayBox2 left">2</div></div>
									</td>
								</tr>
								<tr>
									<td rowspan="2">출고가능 수량</td>
									<td><div class="text-align"><div class="expGrayBox1 left">정보없음</div><div class="expGrayBox2 left">2</div></div></td>
									<td><div class="text-align"><div class="expGrayBox1 left">정보없음</div><div class="expGrayBox2 left">2</div></div></td>
									<td><div class="text-align"><div class="expGrayBox1 left">정보없음</div><div class="expGrayBox2 left">2</div></div></td>
								</tr>
								<tr>
									<td><div class="text-align"><div class="expRedBox1 left">정보없음</div><div class="expRedBox2 left">2</div></div></td>
									<td><div class="text-align"><div class="expYellowBox1 left">정보없음</div><div class="expYellowBox2 left">2</div></div></td>
									<td><div class="text-align"><div class="expGrayBox1 left">정보없음</div><div class="expGrayBox2 left">2</div></div></td>
								</tr>
								<tr>
									<td>출고진행 수량</td>
									<td colspan="3"><div class="text-align"><div class="expGrayBox1 left">정보없음</div><div class="expGrayBox2 left">2</div></div></td>

								</tr>
								<tr>
									<td>교환예정 수량</td>
									<td colspan="3"><div class="text-align"><div class="expGrayBox1 left">정보없음</div><div class="expGrayBox2 left">2</div></div></td>

								</tr>
							</tbody>
						</table>
					</div>
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




//Get the modal
var modal = document.getElementById("myModal2");

//Get the button that opens the modal
var btn = document.getElementById("addModalBtn");

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close2")[0];

//When the user clicks on the button, open the modal
btn.onclick = function() {
modal.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
span.onclick = function() {
modal.style.display = "none";
}





</script>


</html>