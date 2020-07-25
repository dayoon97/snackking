<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.adjustment.model.vo.Adjustment, java.util.*"%>
<% ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");%>
<% ArrayList<HashMap<String, Object>> Clist = (ArrayList<HashMap<String, Object>>) request.getAttribute("Clist");%>
<% String msg = (String) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mine.css">
<style>
#apply{
	position:absolute;	
	top:310px !important;
	right:220px !important;
}
/* The Modal (background) */
.modal2 {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 2; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content2 {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 5px;
  border: 1px solid #888;
  width: 30%; /* Could be more or less, depending on screen size */
  z-index:1;
}
#yesBtn{
	margin-left: 130px;
}
#yesBtn, #noBtn{
	margin-top: 70px;
}
#searchStock1{
    margin-top: 10px;
    margin-left: 50px;
}
#delBtn{
	margin-right: 100px;
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
					<div id="mainTitle">정산 관리</div>
					<div id="line1"></div>
					<div id="subTitle">정산내역 관리</div>
				</div>	<!--title-area end ---------------------------------------------------------------------------->
				
				<!-- search-area start ---------------------------------------------------------------------------->
				<div id="searchArea">
					<!-- 조회 제목 -->
					<div id="subSubTitle1">정산내역 조회</div>
						<!-- searchBox start -->
							<div id="searchBox" style="display: table;">
									<div >
									<table id="searchStock1" style="align:center;">
										<tr>
											<!-- 검색 내용 타이핑하는 부분 -->	
											<td style="width:200px !important;">회사명  :
											<input type="text" class="searchTextBox" size="6" id="adjCom"></td>
									
		
											<td style="width:240px">정산월  :
												<input type="month" class="searchTextBox" size="6" id="adjMo"></td>
											
	                       					
											<td style="width:220px">결제여부  :
											<div class="dropdown">
	        										<div class="select">
	          											<span id="adjYN">선택</span>
											          <i class="fa fa-chevron-left"></i>
											        </div>
											        <ul class="dropdown-menu">
								                           <li id="com1">선택</li>
								                           <li id="noCom">미결제</li>
								                           <li id="yesCom">결제</li>
											        </ul>
											      </div>
											      
	                        				</td>
											
											<td><input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="float: right;"></td>
										</tr>
									</table>
									</div>
							</div>
					</div><!-- search-area end ---------------------------------------------------------------------------->
	
	
	
				
				<!-- 조회 결과 리스트 부분 -->
					<div id="listArea">
						<!-- 조회 결과 리스트 제목 -->
						
						<div id="subSubTitle2" style="top:310px !important; width: 120px;">정산내역 리스트</div>
						<!-- 적용 버튼 -->
						<span id="apply"></span>
						<%if(loginUser.gettCode().equals("T4")) {%>
						<button class="addBtn btn-position" id="addBtn">추가</button>
						<button class="addBtn btn-position" id="delBtn">삭제</button>
						<% } %>
							<!-- 테이블 시작 -->
							<!-- 조회 리스트 테이블 -->
						<%if(loginUser.gettCode().equals("T3")) { %>
						<table id="listTable7" align="center">
						<% } else { %>
						<table id="listTable7" align="center">
						<% } %>
							<thead>
								<!-- 테이블 헤드 -->
								<tr id="listHead" >
								<%if(loginUser.gettCode().equals("T4")){ %>
									<th>선택</th>
									<%} %>
									<th>번호</th>
									<th>회사명</th>
									<th>총금액</th>
									<th>입금일</th>
									<th>결제여부</th>
									<%if (loginUser.gettCode().equals("T3")) { %>
									<th>지급완료처리</th>
									<% } %>
									<th>상세내역확인</th>
								</tr>
							</thead>
							
							
							<% if(loginUser.gettCode().equals("T3")) {%>
							<tbody >
							<!-- 리스트 바디  -->
							
							<% int j = 0; %>
							<%for (int i = 0; i < list.size(); i++) { %>
								<tr class="listBody">
									<td> <% j++; %><%= j %>
									</td>
									<td><%= list.get(i).get("company") %></td>
									<td><%= list.get(i).get("adJustmentAmount") %></td>
									<td><%if((list.get(i).get("adJustmentDate")) == null) {%>
									미지급
									<%} else { %>
									<%= list.get(i).get("adJustmentDate") %>
									<% } %></td>
									<td><% if((list.get(i).get("adJustmentComplete")).equals("Y")) { %>
									결제
									<% } else { %>
									미결제
									<% } %>
									</td>
									<%if (loginUser.gettCode().equals("T3")) { %>
									<td>
									<% if(list.get(i).get("adJustmentComplete").equals("N")) { %>
									<input type="button" class="approval-btn" id="change<%=j%>" value="변경">
									<% } else {%>
									완료
									<% } %>
									</td>
									<% } %>
									<td><button class="btn detail-btn" id="detail">상세</button></td>
								</tr>
								<%} %>
						</tbody>
								<% } else {%>
								<tbody >
							<!-- 리스트 바디  -->
							
							<% int j = 0; %>
							<%for (int i = 0; i < Clist.size(); i++) { %>
								<tr class="listBody">
									<td><input type="checkbox" id="ch"></td>
									<td> <% j++; %><%= j %>
									</td>
									<td><%= Clist.get(i).get("company") %></td>
									<td><%= Clist.get(i).get("adJustmentAmount") %></td>
									<td><%if((Clist.get(i).get("adJustmentDate")) == null) {%>
									미지급
									<%} else { %>
									<%= Clist.get(i).get("adJustmentDate") %>
									<% } %></td>
									<td><% if((Clist.get(i).get("adJustmentComplete")).equals("Y")) { %>
									결제
									<% } else { %>
									미결제
									<% } %>
									</td>
									<%if (loginUser.gettCode().equals("T3")) { %>
									<td>
									<% if(Clist.get(i).get("adJustmentComplete").equals("N")) { %>
									<input type="button" class="approval-btn" id="change<%=j%>" value="변경">
									<% } else {%>
									완료
									<% } %>
									</td>
									<% } %>
									<td><button class="btn detail-btn" id="detail">상세</button></td>
								</tr>
								<%} %>
						</tbody>
								<%} %>
						
								
					</table><!-- 테이블 끝 -->
				</div>
			</div>	<!-- background-box end -->
		</div>	<!-- outer end -->
	</div>	<!-- mainWrapper end -->

									<!-- The Modal -->
									<div id="myModal2" class="modal2">
									  <!-- Modal content -->
									  <div class="modal-content2">
									    <span class="close">&times;</span>
									    <p align="center" class ="modaltitle" style="font-size:30px;">변경하시겠습니까?</p>
									    <div class="titleLine"></div>
									   
									    <button class="searchBtn" id="yesBtn">예</button>
									    <button class="searchBtn" id="noBtn">아니오</button>
									  </div>
									
									</div>





<!--정산서 조회 모달 ----------------------------------------------------------------------------------->


	<!-- Trigger/Open The Modal -->
	<!-- The Modal -->
	<div id="myModal" class="modal">
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
		    <h1 align="center">물품대금 정산서</h1><br>
	   
	   			<div id="wrapper" style="width:600px; margin-left: auto; margin-right: auto;">
	    <!-- 상단 정보 테이블 시작 -->
	  	 		 <table align="center" border="1" style="width: 600px; height: 180px;" id="adjustment-upper-table">
					<tr>
						<td rowspan="3" style="width: 30%;">
							<h7>2020년 8월 1일</h7>
							<h2>(주)그루모아</h2><h5>貴中</h5>
				
						</td>
						<td>사업자번호</td>
						<td colspan="3">123-45-67899</td>
					</tr>
					<tr>
						<td>상호</td>
						<td>스낵킹</td>
						<td>대표자 성명</td>
						<td>김미소</td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="3">서울시 강남구 테헤란로 14길 6 남도빌딩 2F</td>
					</tr>								
					<tr>
						<td rowspan="2">아래와 같이 계산합니다.</td>
						<td>업태</td>
						<td>도소매</td>
						<td>종목</td>
						<td>전자상거래</td>
					</tr>
					<tr>
						<td>전화</td>
						<td>02-1234-5678</td>
						<td>팩스</td>
						<td>02-2020-8888</td>
					</tr>
			    </table><!-- 상단 정보 테이블 끝 -->
				<table border="1" align="center" id="adjustment-total-table"><!-- 중간 테이블 시작 -->
					<tr style="width: 600px; height: 75px;"><td colspan="3"></td></tr>
					<tr>	
						<td colspan="3" style="height: 10px;"></td>
					</tr>
					<tr class="color-box">
						<td style="width: 120px"><h3>청구 합계</h3></td>
						<td style="width: 300px;"><h4 class="total-detail1">일금</h4><h3 class="total-detail2">백육십오만 원정</h3></td>
						<td style="width: 180px; padding: 10px;"><h3 class="total-detail2">&#8361;1,650,000</h3></td>
					</tr>	
					<tr style="width: 600px; height: 20px;">
						<td colspan="5" style="text-align: right;">(단위 : 원)</td>
					</tr>
				</table><!-- 중간 테이블 끝 -->
				<table id="listTable-adjustment"><!-- 거래내역 리스트 테이블 시작 -->	
					<thead>
						<tr>
							<th>회차</th>
							<th>배송일</th>
							<th>거래품목</th>
							<th>총수량</th>
							<th>공급가액</th>
							<th>세액</th>
							<th>합계금액</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1회차</td>
							<td>2020.06.01</td>
							<td>칸쵸 외</td>
							<td>80개</td>
							<td>500,000</td>
							<td>50,000</td>
							<td>550,000</td>
							<td></td>
						</tr>
						<tr>
							<td>2회차</td>
							<td>2020.06.11</td>
							<td>칸쵸 외</td>
							<td>80개</td>
							<td>500,000</td>
							<td>50,000</td>
							<td>550,000</td>
							<td></td>
						</tr>
						<tr>
							<td>3회차</td>
							<td>2020.06.21</td>
							<td>칸쵸 외</td>
							<td>80개</td>
							<td>500,000</td>
							<td>50,000</td>
							<td>550,000</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>-</td>
							<td></td>
						</tr>
					</tbody>	
					
				</table><!-- 거래내역 리스트 테이블 끝 -->	
				<br><br>
				<table border="1" id="bottom-info-table"><!-- 하단 계좌 정보 테이블 -->	
					<tr>
						<td style="height:20px; width:75px;">거래은행</td>
						<td style="width: 75px;" colspan="2">기업은행</td>
						<td style="width: 75px;">예금주</td>
						<td style="width: 75px;" colspan="2">스낵킹</td>
						<td style="width: 75px;" colspan="2"></td>
					</tr>
					<tr>
						<td style="height:20px; width:75px;">계좌번호</td>
						<td style="width: 75px;" colspan="2">010-012345-01-010</td>
						<td style="width: 75px;">청구일시</td>
						<td style="width: 75px;" colspan="2">2020년 7월 5일</td>
						<td style="width: 75px;" colspan="2"></td>
					</tr>
				</table><!-- 하단 계좌 정보 테이블 끝 -->		
			</div><!-- wrapper 끝 -->
		</div>
	</div>
<!--정산서 조회 모달 끝---------------------------------------------------------------------------------->

</body>



<script>
var id;
var com;
/* 옵션 선택 드롭 다운--------------------------------------------------------------------------- */
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


//등록 모달
// Get the modal
   var modal = document.getElementById("myModal");
   var modal2 = document.getElementById("myModal2");
   
   // Get the button that opens the modal
   var btn = document.getElementById("detail");
   var btn2 = document.getElementById("change"); 
   var btn3 = document.getElementById("noBtn");
   var yesBtn = document.getElementById("yesBtn");
   
   
   var span = document.getElementsByClassName("close")[0];
   var span2 = document.getElementsByClassName("close")[1];

   // When the user clicks on the button, open the modal
   btn.onclick = function() {
     modal.style.display = "block";
   }
   
 
   $(document).on('click', '#yesBtn', function(){
	   modal2.style.display = "block";
   });
   yesBtn.onclick = function() {
	 modal2.style.display = "block";
   }
  
   

   // When the user clicks on <span> (x), close the modal
   span.onclick = function() {
     modal2.style.display = "none";
   }
   span2.onclick = function() {
	 modal.style.display = "none";
   }
   
   btn3.onclick = function() {
	  modal2.style.display = "none";
   }

   // When the user clicks anywhere outside of the modal, close it
   window.onclick = function(event) {
     if (event.target == modal) {
       modal.style.display = "none";
     }
   }

   
 //정산 내역 추가하기 버튼 누르면 등록 페이지로 이동
   $("#addBtn").click(function() {
   		location.href="<%=request.getContextPath()%>/searchCompany?num=<%=loginUser.getUserNo()%>";
   });

 
   var com;
   $(document).on('click', '.approval-btn', function(){
	   id = $(this).parent().children("input").attr("id");
		console.log(id);
		
		modal2.style.display = "block";
	
	 	//어느 회산지 가져오기
		com = $(this).parent().parent().children().eq(1).text();
	 
	 
	 //아니오 버튼 누르면 데이터 없애기
	 $(document).on('click', "#noBtn", function(){
		 com='';
	 	});
   });
 
	 //예 버튼을 누르면 데이터 가져가서 업데이트 
	 $(document).on('click', '#yesBtn', function(){
		 	  //서블릿
		location.href="<%=request.getContextPath()%>/adjustmentComplete?com="+com;
			  
	});
	
	 //최고관리자가 로그인 했을 때 검색
	 <%if(loginUser.gettCode().equals("T3")) {%>
	 //검색 ajax
	 $(document).on('click','#searchBtn',function(){
		var company = document.getElementById("adjCom").value;
		var money = document.getElementById("adjMo").value;
		var yn = $("span").eq(0).text();
	
		console.log(company);
		console.log(money);
		console.log(yn);
		
		 
		 $.ajax({
			url:"<%=request.getContextPath()%>/adjustmentSearch",
			data:{company:company, money:money, yn:yn},
			type:"get",
			success: function(data){
				console.log("dㅇㅇㅇㅇ");
				$tableBody = $("#listTable7 tbody");
				
				$tableBody.html('');
				
				$.each(data, function(index, value){
					
					var $tr = $("<tr class='listBody'>");
					var $Td = $("<td>").text(index+1);
				
					var $companyTd = $("<td>").text(value.company);
					var $adjustmentAmountTd = $("<td>").text(decodeURIComponent(value.adJustmentAmount));
					var $adjustmentDateTd = $("<td>").text(decodeURIComponent(value.adJustmentDate));
					var $adjustmentCompleteTd = $("<td>").text(decodeURIComponent(value.adJustmentComplete));
					var $btn1Td = $("<td>").html("<input type='button' class='approval-btn' value='변경'>");
					var $btn2Td = $("<td>").html("<button class='btn detail-btn' id='detail'>상세</button>");
					var $endTr = $("</tr>");
					
					var $nullTd = $("<td>").text("완료");
					
					console.log(value.adJustmentDate);
					
					//결제여부 형태 바꾸기
					var comYN;
					if(value.adJustmentComplete == "Y"){
						comYN = '결제';
					} else if(value.adJustmentComplete == "N"){
						comYN = '미결제';
					}
					
					var $adComTd = $("<td>").text(comYN);
				
					
					
					
					//입금일 형태 바꾸기
					var dateY;
					if(value.adJustmentDate == undefined){
						dateN = '미지급';
					} else if(value.adJustmentDate != undefined){
						//입금일 형태 바꾸기
						var year = (value.adJustmentDate).substr(7, 8);
						var mon = (value.adJustmentDate).substr(0, 1);
						if(mon.indexOf(" ", 0)){
							var mon1 = "0";
						}
						var day = (value.adJustmentDate).substr(3, 2);
						var code;
						
						var nal = year.concat("-", mon1, mon,"-",day);
					} 
					
					var $adDateTd = $("<td>").text(dateN);
					var $adDate2Td = $("<td>").text(nal);
					
					$tr.append($Td);
					$tr.append($companyTd);
					$tr.append($adjustmentAmountTd);
					
					//지급완료면 입금일 보이게 하기
					if(comYN == '결제'){
						$tr.append($adDate2Td);
					} else {
						$tr.append($adDateTd);
					}
					$tr.append($adComTd);
					
					//지급완료면 변경버튼 안보이게 하기
					if(comYN == '결제'){
						$tr.append($nullTd);
					} else {
						$tr.append($btn1Td);
					}
					$tr.append($btn2Td);
					$tr.append($endTr);
					
					$tr.append($tr).css({"border-bottom":"3px solid #EBEAEA", "height" : "36px"});
					
					$tableBody.append($tr);
				}); 
			
				 
			},
			
			error: function(data){
				
			}
		});
	 });
	 <% } else {%>
	//검색 ajax
	 $(document).on('click','#searchBtn',function(){
		var company = document.getElementById("adjCom").value;
		var money = document.getElementById("adjMo").value;
		var yn = $("span").eq(0).text();
		//var num = $("input[type=hidden][name=num]").val();
 		console.log(company);
		console.log(money);
		console.log(yn);
		 
		 $.ajax({
			url:"<%=request.getContextPath()%>/adjustmentCuSearch",
			data:{company:company, money:money, yn:yn, num:<%=loginUser.getUserNo()%>},
			type:"get",
			success: function(data){
				console.log("제바아아알");
				$tableBody = $("#listTable7 tbody");
				
				$tableBody.html('');
				
				$.each(data, function(index, value){
					
					var $tr = $("<tr class='listBody'>");
					var $chTd = $("<td>").html("<input type=checkbox>");
					var $Td = $("<td>").text(index+1);
					var $companyTd = $("<td>").text(value.company);
					var $adjustmentAmountTd = $("<td>").text(decodeURIComponent(value.adJustmentAmount));
					var $adjustmentDateTd = $("<td>").text(decodeURIComponent(value.adJustmentDate));
					var $adjustmentCompleteTd = $("<td>").text(decodeURIComponent(value.adJustmentComplete));
					var $btn2Td = $("<td>").html("<button class='btn detail-btn' id='detail'>상세</button>");
					var $endTr = $("</tr>");
					
					var $nullTd = $("<td>").text("완료");
					
					
					//결제여부 형태 바꾸기
					var comYN;
					if(value.adJustmentComplete == "Y"){
						comYN = '결제';
					} else if(value.adJustmentComplete == "N"){
						comYN = '미결제';
					}
					
					var $adComTd = $("<td>").text(comYN);
				
					
					//입금일 형태 바꾸기
					var dateN;
					var dateY;
					if(value.adJustmentDate == undefined){
						dateN = '미지급';
					} else if(value.adJustmentDate != undefined){
						//입금일 형태 바꾸기
						var year = (value.adJustmentDate).substr(7, 8);
						var mon = (value.adJustmentDate).substr(0, 1);
						if(mon.indexOf(" ", 0)){
							var mon1 = "0";
						}
						var day = (value.adJustmentDate).substr(3, 2);
						var code;
						
						var nal = year.concat("-", mon1, mon,"-",day);
					} 
					
					var $adDateTd = $("<td>").text(dateN);
					var $adDate2Td = $("<td>").text(nal);
					
					$tr.append($chTd);
					$tr.append($Td);
					$tr.append($companyTd);
					$tr.append($adjustmentAmountTd);
					
					//지급완료면 입금일 보이게 하기
					if(comYN == '결제'){
						$tr.append($adDate2Td);
					} else {
						$tr.append($adDateTd);
					}
					
					$tr.append($adComTd);
					$tr.append($btn2Td);
					$tr.append($endTr);
					$tr.append($tr).css({"border-bottom":"3px solid #EBEAEA", "height" : "36px"});
					
					$tableBody.append($tr);
				}); 
			
				 
			},
			
			error: function(data){
				
			}
		});
	 });
	<% } %>

	$(document).on('click', 'input[type=checkbox]', function(e){
		if($(this).prop('checked')){
			$('input[type=checkbox]').prop("checked",false);
    		$(this).prop("checked",true);
    	}
	});
	
	$(document).on('click', '#delBtn', function(){

	});
	
</script>
</html>