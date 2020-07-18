<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>
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
				<div id="subTitle">상품 정보 확인</div>
			</div>	<!--title-area end ---------------------------------------------------------------------------->
			
			<!-- search-area start ---------------------------------------------------------------------------->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">상품 검색</div>
					<!-- searchBox start -->
						<div id="searchBox" style="height: 90px !important; display: table;">
							<form id="searchForm" style="display:table-cell; vertical-align:middle">
								<div >
								<table id="searchProduct">
									<tr style="height:34px !important;">
										<!-- 검색 내용 타이핑하는 부분 -->	
										<td style="width:170px">상품코드  :
										<input type="text" class="searchTextBox" size="7"></td>                        					
										<td style="width:220px">상품종류  :
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
                        				
                        				<td style="width:140px">향  :
                        				<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="productKinds">
										        <ul class="dropdown-menu">
							                           <li id="선택">선택</li>
							                           <li id="초코">초코</li>
							                           <li id="딸기">딸기</li>
							                           <li id="바나나">바나나</li>
							                           <li id="포도">포도</li>
							                           <li id="바닐라">바닐라</li>					                         
							                           <li id="커피">커피</li>
							                           <li id="민트">민트</li>
							                           <li id="소다">소다</li>
							                           <li id="시나몬">시나몬</li>
							                           <li id="땅콩">땅콩</li>  
										        </ul>
										      </div>
                        				</td>
                        				<td style="width:140px">맛  :
                        					<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="productKinds">
										        <ul class="dropdown-menu">
							                           <li id="달콤">달콤</li>
							                           <li id="짭짤">짭짤</li>
							                           <li id="고소">고소</li>
							                           <li id="담백">담백</li>
							                           <li id="새콤">새콤</li>
							                           <li id="매콤">매콤</li>					                         
										        </ul>
										      </div>
										</td>
											
											<td style="width:210px">기본 유통기한  :
												<input type="text" class="searchTextBox" size="2"> 개월
											</td>	
									</tr>
									<tr>	
										<td>상품명  :
											<input type="text" class="searchTextBox" size="9">
										</td>
									
								
                       					<td>알레르기 성분 :
											<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="stockKinds">
										        <ul class="dropdown-menu">
							                           <li id="선택">선택</li>
							                           <li id="밀">밀</li>
							                           <li id="대두">대두</li>
							                           <li id="계란">계란</li>
							                           <li id="땅콩">땅콩</li>
							                           <li id="갑각류">갑각류</li>					                         
							                           <li id="메밀">메밀</li>					                         
							                           <li id="유제품">유제품</li>					                         
							                           <li id="해당없음">해당없음</li>					                         
										    	    </ul>
										      </div>
                        				</td>
										
										<td colspan="2">가격  :
											<input type="text" class="searchTextBox" size="10"> ~
											<input type="text" class="searchTextBox" size="10"> 원
										</td>
										<td>
											<input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="margin-left:85px;">
										</td>
																	
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div><!-- search-area end ---------------------------------------------------------------------------->


			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					
					<div id="subSubTitle2" style="top:310px !important;">상품 리스트</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<span id="apply">조회 결과 수 :</span>
						<!-- 테이블 시작 -->
						<!-- 조회 리스트 테이블 -->
					<table id="listTable10" class="productSearchListTable">
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
						<tbody style="height: 230px !important;">
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
						</tbody>
							<tfoot style="float: right;">
								<tr>
									<td>
										<button onclick="" class="searchBtn" id="btnAddProduct"><a href="productAdd.jsp">추가</a></button>
									</td>
									<td>
										<button onclick="" class="searchBtn" id="btnUpdateProduct">수정</button>
									</td>
									<td>
										<button onclick="" class="searchBtn" id="btnDeleteProduct">삭제</button>
									</td>
								</tr>
							</tfoot>
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