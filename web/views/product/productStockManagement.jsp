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
	right:220px !important;
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
					
					<div id="subSubTitle2" style="top:310px !important;">재고 리스트</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<span id="apply" style="top:310px !important;">조회 결과 수 :</span>
					<input type="button" class="addBtn btn-position" id="addModalBtn" value="추가요청">
					
						<!-- The Modal -->
						<div id="myModal2" class="modal2">
						  <!-- Modal content -->
						  <div class="modal-content2">
						    <span class="close2">&times;</span>
						    <table align="center">
						    	<caption><h2>재고 발주 요청</h2></caption>
						    	<tr style="height: 20px;"></tr>
						    	<tr>
						    		<td class="right">상품명 : </td>
                                    <td><input type="text" class="InputBox3"></td>
                                    <td>
                                    <div class="dropdown">
                                         <div class="select">
                                              <span>선택</span>
                                           <i class="fa fa-chevron-left"></i>
                                         </div>
                                         <input type="hidden" name="">
                                         <ul class="dropdown-menu">
                                                   <li id="선택">선택</li>
                                                   <li id="">여기다가</li>
                                                   <li id="">상품명</li>
                                                   <li id="">검색한거</li>
                                                   <li id="">불러오기</li>
                                         </ul>
                                       </div>
                                    </td>
                                    <td><button onclick="" class="nameSearch-btn">검색</button></td>
						    	</tr>
						    	
						    	<tr style="height: 30px;"></tr>
								<tr>
									<td>요청 수량 :</td>
									<td><input type="text" class="InputBox1" style="margin-right: 15px;">개</td>
									<td colspan="2"></td>
								</tr>
								
								<tr style="height: 30px;"></tr>
								<tr>
									<td colspan="4">
										<input type="button" class="btn1" id="amountRequestBtn" value="수량 요청하기">
									</td>
								
								</tr>
						    </table>
						  </div>
						</div>
					
					
					
						<!-- 테이블 시작 -->
						<!-- 조회 리스트 테이블 -->
					<table id="listTable11" align="center">
						<thead>
							<!-- 테이블 헤드 -->
							<tr id="listHead" >
								<th>상품코드</th>
								<th>상품종류</th>
								<th>상품명</th>
								<th>매입처</th>
								<th>최근입고</th>
								<th>최근출고</th>
								<th>총수량</th>
								<th>출고가능</th>
								<th>입고진행</th>
								<th>출고진행</th>
								<th>교환예정</th>
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