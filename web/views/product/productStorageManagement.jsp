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

/* The Modal (background) */
.modal11 {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content11 {
  background-color: #fefefe;
  margin: 13% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
  height: 40%;
}

/* The Close Button */
.close11 {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close11:hover,
.close11:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
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
										
										<td rowspan="3"><input type="submit" class="searchBtn" value="검색하기" id="search" style="float: right;"></td>
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

<!-- 마라톤 -->
	<!-- The Modal -->
						<div id="myModal11" class="modal11">
						  <!-- Modal content -->
						  <div class="modal-content11">
						    <span class="close11">&times;</span>
						    <table align="center" class="modalTable1">
						    	<caption><h2>재고 정보 등록</h2></caption>
						    	<tr>
						    		<th>상품명</th>
						    		<th>상품코드</th>
						    		<th>수량</th>
						    		<th>로케이션번호</th>
						    		<th>제조일자</th>
						    		<th>등록구분</th>
						    		<th>등록구분코드</th>
						    	</tr>
						    	<tr>
									<td>
										<input type="text" name="pName">
									</td>
									<td><input type="text" placeholder="PNO-*****" name="pCode"></td>
									<td><input type="number" name="quantity"></td>
						    		<td>
						    			<div class="dropdown 1">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="sLocation" value="">
										        <ul class="dropdown-menu" value=""> 
										          <li id="">선택</li>
										          <li id="L1">L1</li>
										          <li id="L2">L2</li>
										          <li id="L3">L3</li>
										          <li id="L4">L4</li>
										          <li id="L5">L5</li>
										          <li id="L6">L6</li>
										          <li id="L7">L7</li>
										          <li id="L8">L8</li>
										          <li id="L9">L9</li>
										          <li id="L10">L10</li>
										        </ul>
										 </div>
									</td>
									<td><input type="date" name="mfd"></td>
									<td>
									<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="section" value="">
										        <ul class="dropdown-menu" value="">
										          <li id="">선택</li>
										          <li id="발주">발주</li>
										          <li id="교환">교환</li>
										        </ul>
										      </div>
									</td>
									<td><input type="text" name="sectionCode"></td>
						    	</tr>
						  	<tr>
						  		<td colspan="7">
						   			 <button onclick="" class="btn searchBtn" id="chCodeBtn" style="margin-right:40px;">추가하기</button>
						   			 <button onclick="" class="btn searchBtn" id="noBtn">등록취소</button>
						  		
						  		</td>
						  	</tr>
						    </table>
						  </div>
						</div>





			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					
					<div id="subSubTitle2" style="top:325px !important; width: 130px !important;">재고 등록 내역</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<input type="button" class="addBtn btn-position btn" id="apply11" value="재고등록">
						<!-- 테이블 시작 -->
					
						<!-- 조회 리스트 테이블 -->
					<table id="listTable10-1" style="top:365px !important;">
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th>등록번호</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>등록일</th>
								<th>수량</th>
								<th>로케이션</th>
								<th>제조일</th>
								<th>등록구분</th>
								<th>등록구분코드</th>
								<th>유통기한 구분</th>

								
							</tr>
						</thead>
						<tbody>
						<!-- 리스트 바디  -->
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

//검색 버튼 클릭시 검색조건에 따라 검색 내역 가져오기
$(function() {
	$("#search").click(function(){
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
				$tableBody = $("#listTable10-1 tbody");
				$tableBody.html('');
				$tableBody.find("tr").remove();
				
					for(var key in data){

							var $tr =  $("<tr>").attr('class','listBody hover');
							var $td1 = $("<td>").text(data[key].storageCode);
							var $td2 = $("<td>").text(data[key].pCode);
							var $td3 = $("<td>").text(data[key].pName);
							var $td4 = $("<td>").text(data[key].storageDate);
	 						var $td5 = $("<td>").text(data[key].quantity);
	 						var $td6 = $("<td>").text(data[key].sLocation);
	 						var $td7 = $("<td>").text(data[key].mfd);
	 						var $td8 = $("<td>").text(data[key].section);
	 						var $td9 = $("<td>").text(data[key].sectionCode);
	 						var $td10 = $("<td>").text(data[key].color);
							$tr.append($td1);
							$tr.append($td2);
							$tr.append($td3);
	 						$tr.append($td4);
	 						$tr.append($td5);
	 						$tr.append($td6);
	 						$tr.append($td7);
	 						$tr.append($td8);
	 						$tr.append($td9);
	 						$tr.append($td10);
							$tableBody.append($tr);
							
						}	 
				},
				error: function(error){
					console.log("에러!" + error);
				}
		});
	});
});  

/* 	private String storageCode;//식별자
	private String storageDate;//등록일 (입고 완료 후 등록한 날짜)
	private String color;//유통기한 색상
	private String sectionCode;//분류 코드( 발주코드나, 교환 코드 )
	private String section;//발주 or 교환
	private String mfd; //제조일
	private String sLocation; //위치 L1,L2
	private int quantity; //수량
	private String pCode; //상품코드
	private String pName; //상품이름 상품 테이블 조인
	private int basicExp; //기본 유통기한 상품 테이블 조인
	private String sysDate; //쿼리문에서 오늘 날짜 받아오는 변수 */


//모달 창에서 등록 취소 버튼 누르면 데이터 없애기
	 $(document).on('click', "#noBtn", function(){
		 //com='';
	 	});
   	});
	
	
	



//Get the modal
var modal11 = document.getElementById("myModal11");

// Get the button that opens the modal
var btn11 = document.getElementById("apply11");

// Get the <span> element that closes the modal
var span11 = document.getElementsByClassName("close11")[0];

// When the user clicks on the button, open the modal
btn11.onclick = function() {
  modal11.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span11.onclick = function() {
  modal11.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal11) {
    modal11.style.display = "none";
  }
}





//변경 모달

/*  */


















</script>


</html>