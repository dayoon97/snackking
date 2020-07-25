<%@page import="com.kh.snackking.preference.model.vo.curatingList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.snackking.curating.model.vo.*"%>
<%
	ArrayList<CurationList> list = (ArrayList<CurationList>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#mainWrapper {
margin-left: auto;
margin-right: auto;
display: table;
}
#outer {
	margin-left: 265px;
	margin-right: 35px;
	height: 100vh;
	position: relative;
}
body {
  overflow-x: hidden;
}
span.msg,
span.choose {
  color: #555;
  padding: 5px 0 10px;
  display: inherit
}
.container {
  width: 500px;
  margin: 50px auto 0;
  text-align: center
}

/*Styling Selectbox*/
.dropdown {
  width: 90px;
  display: inline-block;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 0 2px rgb(204, 204, 204);
  transition: all .5s ease;
  position: relative;
  font-size: 14px;
  color: #474747;
  height: 100%;
  text-align: left
}
.dropdown .select {
    cursor: pointer;
    display: block;
    padding: 10px
}
.dropdown .select > i {
    font-size: 13px;
    color: #888;
    cursor: pointer;
    transition: all .3s ease-in-out;
    float: right;
    line-height: 20px
}
.dropdown:hover {
    box-shadow: 0 0 4px rgb(204, 204, 204)
}
.dropdown:active {
    background-color: #f8f8f8
}
.dropdown.active:hover,
.dropdown.active {
    box-shadow: 0 0 4px rgb(204, 204, 204);
    border-radius: 2px 2px 0 0;
    background-color: #f8f8f8
}
.dropdown.active .select > i {
    transform: rotate(-90deg)
}
.dropdown .dropdown-menu {
    position: absolute;
    background-color: #fff;
    width: 100%;
    left: 0;
    margin-top: 1px;
    box-shadow: 0 1px 2px rgb(204, 204, 204);
    border-radius: 0 1px 2px 2px;
    overflow: hidden;
    display: none;
    max-height: 144px;
    overflow-y: auto;
    z-index: 9
}
.dropdown .dropdown-menu li {
    padding: 10px;
    transition: all .2s ease-in-out;
    cursor: pointer
} 
.dropdown .dropdown-menu {
    padding: 0;
    list-style: none
}
.dropdown .dropdown-menu li:hover {
    background-color: #f2f2f2
}
.dropdown .dropdown-menu li:active {
    background-color: #e2e2e2
}

/* The Modal (background) */
.modal {
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
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 65%; /* Could be more or less, depending on screen size */
  z-index:1;
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.footerArea{
	height:150px;
}
.orderArea{
	height:700px;
	width:1200px;
	margin:0 auto;
}
.order-table{
	width:1100px;
	height:700px;
	margin-left: 100px;
	margin-top: -20px;
}
.order-History{
	font-size: 30px;
	text-align: center;
}
.order-history-table{
	padding: 1px;
	width:100%;
}
td{
	border-bottom: 1px solid #E8E8E8;
	height: 50px;
	text-align: center;
}
.order-td:hover{
	background: white;
}
th{
	height: 40px;
	border-bottom: 1px solid #FFC700;
	background: #F0BB00;
	color: white;
	font-weight: lighter;
}
.odNum{
	color: #007AEB;
}
.line{
	margin:0 auto;
	margin-top: 5px;
	width:16%;
	border: 2px solid #FFC700;
}
.searchArea{
	margin-top: 30px;
	margin-bottom: 15px;
	margin-left: 893px;
}

.box .form-control{
	max-width: 300px;
	margin: 0 auto;	
}

.form-control{
	height: 50px;
	font-size: 16px;
	color: #414D64;
	background: #ffffff;
	padding: 0 15px;
	border: 2px solid #DADEEA;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	text-align: center;
}
textarea.form-control{
	height: 120px;
	padding-top: 15px;
}
.form-control-plaintext{
	font-size: 18px;
	color: #434343;
}
button.form-control{
	text-overflow: ellipsis;
	overflow: hidden;
}
.form-control:focus{
	border-color: #37B448;
	-webkit-box-shadow: 0px 2px 6px rgba(55, 180, 72, .15);
	-moz-box-shadow: 0px 2px 6px rgba(55, 180, 72, .15);
	box-shadow: 0px 2px 6px rgba(55, 180, 72, .15);
}
input[type='text']{
	width:92px;
	height:28px;
	background: #F0F0F0;
	border: 0;
	outline: 0;
	color: #D8D8D8;
}
.submit-btn{
	border:0;
	outline:0;
	width: 60px;
	height: 32px;
	background: #F0BB00;
	display:inline-block;
	font-family: NanumSquare_ac;
	font-style: normal;
	font-weight: 300;
	font-size: 17px;
	line-height: 19px;
	text-align: center;
	color: #FFFFFF;
}
.listAreaBox {
	width: 500px;
	overflow: auto;
}
#listArea {
	display: inline-block;
	height: 475px;
}
#cuListArea {
	display: inline-block;
	height: 475px;
	float: right;
}
#cuListTable {
	width: 100%;
}
.listAreaBox::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
}
.listAreaBox::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
}
#totalPrice {
	 float: right;
	 border-radius: 5px; 
	 padding: 10px; 
	 margin-right: 10px; 
	 margin-top: 5px;
	 background: #F0BB00;
	 color: white;
	 font-weight: 600;
}
#cuCheckBtn:hover {
	cursor: pointer;
}
.cuCheckYN {
	color: red;
	font-weight: 600;
}
</style>
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">
	<%@ include file="../common/userMenu.jsp" %>
	<div class="nav" style="height: 57.8px">
			<div class="snack-nav">
			</div>
	</div>
	<div class="outer">
		<div class="orderArea">
			<div class="order-table">
				<p class="order-History">큐레이팅 내역</p>
				<div class="line"></div>
					<div class="searchArea">
						<input type="date" id="searchDate" class="searchDate" name="searchDate">
						<input type="submit" value="검색" class="submit-btn">
					</div>
				
				<div id="listArea" class="listAreaBox">
					<table class="order-history-table" align="center">
						<thead>
						<tr>
							<th width="30%">큐레이팅 번호</th>
							<th width="40%">작성일자</th>
							<th width="30%">큐레이팅 승인 여부</th>
						</tr>
						</thead>
						<tbody>
						<% for(CurationList cl : list) { %>
						<tr class="order-td">
							<input type="hidden" name="cNum" id="cNum" value="<%= cl.getCuListNo()%>">
							<td class="odNum"><%= cl.getCuListNo()%></td>
							<td><%= cl.getClDate()%></td>
							<td class="cuCheckYN"><%= cl.getStatus()%></td>
						</tr>
						<% } %>
						</tbody>
					</table>
				</div>	<!-- listArea end -->
				
				<div id="cuListArea" class="listAreaBox">
					<table id="cuListTable" class="cuListTable" align="center">
						<!-- <caption>큐레이팅-상품 리스트</caption> -->
						<thead>
							<tr>
								<th>상품명</th>
								<th>수량</th>
								<th>단가</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody>
							<tr class="order-td">
								<td colspan="4">큐레이팅 리스트를 클릭해주세요.</td>
							</tr>
							
						</tbody>
					</table>
				</div>	<!-- cuListArea end -->
				<div id="totalPrice">
					<span id="priceArea">주문 금액 : 0 원</span>
					<span id="cuCheckBtn">주문 진행하기</span>
				</div>
				
			</div>	<!-- order-table -->
		</div>	<!-- orderArea -->
	</div>	<!-- outer end -->
	
	
	<div class="footerArea">
	<%@ include file="../common/footer.jsp" %>
	</div>
</div>	<!-- mainWrapper end -->

<script>

	$("#listArea  .order-td").click(function() {
		var num = $(this).children("input").val();
		console.log("check num : " + num);
		
		var c1 = $(this).children("td").eq(2).text();
		console.log("c1 : " + c1);
		
		$.ajax({
			url: "<%= request.getContextPath()%>/selectProduct.cur",
			type: "post",
			data: {
				userNo: num
			},
			success: function(data) {
				//console.log("success data list : " + data.list);
				//console.log("success data price : " + data.toPrice);
				console.log("data : " + data.listNo);
				
				$tableBody = $("#cuListTable tbody");
				$tableBody.html('');
				
				for(var key in data.list) {
					var $tr = $("<tr>").attr('class', 'order-td');
					
					var $hiddenId = $("<input>").attr('name', 'listNo').attr('type', 'hidden').attr('value', data.listNo);
					var $naTd = $("<td>").text(data.list[key].pName);
					var $countTd = $("<td>").text(data.list[key].pCount);
					var $upTd = $("<td>").text(data.list[key].unitCount);
					var $priceTd = $("<td>").text(data.list[key].price);
					
					
					$tr.append($hiddenId);
					$tr.append($naTd);
					$tr.append($countTd);
					$tr.append($upTd);
					$tr.append($priceTd);
					
					$tableBody.append($tr);
				}
				
				$("#cuCheckBtn").hide();
				$("#priceArea").show();
				$("#priceArea").text("주문 금액 : " + data.toPrice + " 원");
				
			},
			error: function() {
				alert("error!!");
			}
		});
	});
	
	$("#cuCheckBtn").hide();
	
	$("#totalPrice").mouseover(function() {
		$("#cuCheckBtn").show();
		$("#priceArea").hide();
	}).mouseout(function(){
		$("#cuCheckBtn").hide();
		$("#priceArea").show();
	}).click(function() {
		var num = $(this).parent().children("#cuListArea").children().children("tbody").find("input").val();
		console.log(num);
		var check = window.confirm("큐레이팅을 진행하시겠습니까?\n(해당 상품으로 배송이 시작됩니다.)");
		if(check){
			$.ajax({
				url: "<%= request.getContextPath()%>/changeCuStatus.cur",
				type: "get",
				data: {
					listNo: num
				},
				success: function(data) {
					console.log(data);
					alert("해당 리스트대로 주문을 시작합니다.");
					
					$tableBody = $("#order-history-table tbody");
					$tableBody.html('');
					
					<%-- <% for(CurationList cl : list) { %>
					<tr class="order-td">
						<input type="hidden" name="cNum" id="cNum" value="<%= cl.getCuListNo()%>">
						<td class="odNum"><%= cl.getCuListNo()%></td>
						<td><%= cl.getClDate()%></td>
						<td class="cuCheckYN"><%= cl.getStatus()%></td>
					</tr>
					<% } %> --%>
					
					for(var key in data) {
						var $tr = $("<tr>").attr('class', 'order-td');
						
						var $hiddenId = $("<input>").attr('name', 'listNo').attr('type', 'hidden').attr('value', data.listNo);
						var $naTd = $("<td>").text(data.list[key].pName);
						var $countTd = $("<td>").text(data.list[key].pCount);
						var $upTd = $("<td>").text(data.list[key].unitCount);
						var $priceTd = $("<td>").text(data.list[key].price);
						
						
						$tr.append($hiddenId);
						$tr.append($naTd);
						$tr.append($countTd);
						$tr.append($upTd);
						$tr.append($priceTd);
						
						$tableBody.append($tr);
					}
					
				},
				error: function() {
					alert("error!!");
				}
			});
		}
	});
	
</script>
	
</body>
</html>