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
<style type="text/css">
   #outer {
      margin-left: 265px;
      margin-right: 35px;
      /* width: auto; */
      height: 100vh;
      position: relative;
   }
   #background-box {
      position: relative;
      width: 1092px;
      /* width: auto; */
      height: 700px;
      top: 15px;
      background: white;
      border-radius: 12px;
      margin-left: auto;
      margin-right: auto;
   }
         
   /*본문영역 상단부*/
   #titleArea {
      position: relative;
      height: 20%;
   
   }
   /*본문 영역 제목*/
   #mainTitle {
      position: absolute;
      width: 250px;
      height: 100px;
      left: 30px;
      font-family: NanumSquare_ac;
      font-style: normal;
      font-weight: normal;
      font-size: 35px;
      line-height: 53px;
      display: flex;
      align-items: center;
      color: #232323;   
   }
   
   /*본문 영역 제목 밑에있는 선*/
   #line1 {
      position: absolute;
      width: 170px;
      height: 0px;
      left: 30px;
      top: 80px;
      border: 1px solid #666666;
   }
   
   /*본문 영역 소제목*/
   #subTitle {
      position: absolute;
      width: 250px;
      height: 50px;
      left: 30px;
      top: 78px;
      font-family: NanumSquare_ac;
      font-style: normal;
      font-size: 25px;
      line-height: 40px;
      display: flex;
      align-items: center;
      color: #343434;
   }

/*조회 결과 리스트 제목 스타일*/
.subSubTitle2{
/* width: 90px; */
height: 30px;
margin-left: 40px;
margin-bottom: 15px;
font-family: NanumSquare_ac;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 20px;
display: flex;
align-items: center;
color: #000000;
}

#subSubTitle3 {
height: 30px;
margin-top: 10px;
margin-bottom: 10px;
margin-left: 10px;
margin-right: 30px;
font-family: NanumSquare_ac;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 20px;
display: flex;
align-items: center;
color: #000000;
}

#cuListTable{
	width: 1010px;
}

.listTable{
	width: 475px;
	border-collapse:collapse;
	margin: 0 auto;
	text-align:center;
}


/*조회 리스트 테이블 listHead*/
.listHead{
width: 475px;
height: 31px;
padding-left:20px;
background: #FBFAFA;
box-sizing:border-box;
border-radius: 300px 0 0 300px;
}

/*조회 리스트 부분 테이블 헤더 폰트 스타일*/
.listHead th{
padding:4px;
font-size:15px;
line-height:17px;
}

/* 리스트 바디 하위 td 테이블 선 스타일*/
.listBody>td{
border-bottom:3px solid #EBEAEA;
height: 25px;
}

.listBody:hover{
   cursor:pointer;
   background: #F0BB00;
}
#mainWrapper {
   margin-left: auto;
   margin-right: auto;
   display: table;
}
#culistTableWrap {
	margin-top: 10px;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
	display: block;
}

.tableWrap {
	height: 265px;
	overflow: auto;
	display: inline-block;
	margin-left: 40px;
}
.tableWrap::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
}
.tableWrap::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
}

.modaltableWrap{
	height: 200px;
	overflow: auto;
	display: inline-block;
	overflow-x: hidden;
}
.modaltableWrap::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
}
.modaltableWrap::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
}
#productArea {
	float: right;
	width: 475px;
	height: 265px;
	overflow: auto;
	display: inline-block;
	margin-right: 40px;
	overflow-x: hidden
}
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 4% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  border-radius: 10px;
  width: 80%; /* Could be more or less, depending on screen size */
  height: 80%;
}

/* The Close Button */
.close {
	display: inline-block;
	color: #aaa;
	float: right;
	font-size: 50px;
	font-weight: bold;
	margin-top: 6px;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.modal-header{
	border-bottom: 2px solid black;
}
#modal-title {
	display: inline-block;
}
.modal-body {
	text-align: center;
}
#moSection1 {
	/* background: green; */
	display: inline-block;
	width: 43%;
	height: 510px;
	float: left;
}
#moSection2 {
	/* background: skyblue; */
	display: inline-block;
	width: 49%;
	float: left;
	height: 530px;
	padding-left: 70px;
}
#moSection3 {
	/* background: lightgray; */
	display: inline-block;
	width: 8%;
	float: left;
	height: 510px;
	
}
#pickingTable {
	width: 100%;
	height: 90%;
}
#searchBox {
border:1px solid rgba(75, 75, 75, 0.23); 
padding:10px; 
text-align:-webkit-center; 
width:1000px; 
margin-left:auto; 
margin-right:auto; 
margin-bottom: 40px;
border-radius: 33.5px;
height: 30px;
height: 50px;
line-height: 2.9;
}
#searchBox input[type=text] {
	padding-left: 10px;
}
#searchBtn {
border:0;
outline:0;
background: #F0BB00;
color: #FFFFFF;	
padding: 6px;
border-radius: 8px;
}
#searchBtn:hover {
	cursor: pointer;
}
#pickingProductBtn {
	background: #F0BB00;
	width: 50px;
	padding: 7px;
	margin-right: 10px;
	border-radius: 5px;
}
.pickBtn {
	background: #F0BB00;
	border-radius: 3px;
	border:0;
	outline:0;
}
.pickBtn:hover {
	cursor: pointer;
}
#pickingHeader {
	border-bottom: 2px solid black;
}
#pickingHeader .header {
	width: 50%;
	font-size: 25px; 
	text-align: left; 
	padding-left: 10px;
}
#pickingHeader td {
	text-align: right;
}
#pickingHeader th {
	text-align: left;
}
#pickingTable thead {
	border-bottom: 2px solid black;
}
#pickingList {
/* border: 1px solid black; */
float: right;
background: #F0BB00;
border-radius: 5px;
font-size: 15px;
color: black;
padding: 5px;
}
</script>
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
            <div id="mainTitle">주문 관리</div>
            <div id="line1"></div>
            <div id="subTitle">출고 리스트 등록</div>
         </div>   <!--title-area end -->
         
         <div class="subSubTitle2" style="margin-top: 30px;">큐레이팅 리스트 검색</div>
         <div id="searchBox">
			<table>
				<tr>
					<th>큐레이팅ID</th>
					<th style="padding-left: 5px; padding-right: 5px;"><input type="text" size="8"></th>
					<th>회원명</th>
					<th style="padding-left: 5px; padding-right: 5px;"><input type="text" size="8"></th>
					<th>회사명</th>
					<th style="padding-left: 5px; padding-right: 5px;"><input type="text" size="8"></th>
					<th>검색날짜</th>
					<th><input type="date"> ~ <input type="date"></th>
					<th style="padding-left: 15px;"><input id="searchBtn" type="button" value="검색하기"></th>		
				</tr>
			</table>
         </div>
         <!-- 조회 결과 리스트 부분 -->
            <div id="listArea">
               <!-- 조회 결과 리스트 제목 -->
               <div id="subSubTitle2" class="subSubTitle2">큐레이팅 리스트</div>
               <!-- 조회 리스트 테이블 -->
               
               <div id="culistTableWrap" style="text-align: center;">
	               <div class="tableWrap" style="margin: 0">
		               <table id="cuListTable" class="listTable">
		                  <!-- 테이블 헤드 -->
		                  <thead>
			                  <tr id="listHead" class="listHead">
			                     <th>큐레이팅ID</th>
			                     <th>회원명</th>
			                     <th>회사명</th>
			                     <th>날짜</th>
			                  </tr>
		                  </thead>
		                  
		                  <!-- 리스트 바디  -->
		                  <tbody>
		                  <% for(CurationList c : list) { %>
		                  	<tr class="listBody">
		                  		<input type="hidden" id="cuListNo" name="cuListNo" value="<%=c.getCuListNo()%>">
		                  		<td><%= c.getCuListNo() %></td>
		                  		<td><%= c.getUserName() %></td>
		                  		<td><%= c.getCompany() %></td>
		                  		<td><%= c.getClDate() %></td>
		                  	</tr>	
		                  <% } %>
			                  <!-- <tr class="listBody">
			                     <td>CURATING01</td>
			                     <td>남궁보훈</td>
			                     <td>(주)SNACKKING</td>
			                     <td>2020-07-22</td>
			                  </tr> -->
			                  
		                  </tbody>
		               </table>
	               </div>
               </div>	<!-- listTableWrap end -->
            </div>
      
      </div>   <!-- background-box end -->
   </div>   <!-- outer end -->
</div>   <!-- mainWrapper end -->

	<!-- ***************************출고 리스트 등록 모달******************************* -->
	<!-- Modal -->
	<div class="modal" id="find-Modal">
		
			<!-- modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="modal-title">출고리스트 등록</h2>
					<div class="close">&times;</div>
				</div>	<!-- modal-header end -->
				<div class="modal-body">
				<div id="moSection1">
					<div id="subSubTitle3">큐레이팅-상품 리스트</div>
	               <div id="listTableWrap" class="modaltableWrap">
		               <table id="proListTable" class="listTable">
		                  <thead>
			                  <tr id="listHead" class="listHead" style="background: #ececec;">
			                     <th>상품코드</th>
			                     <th>상품명</th>
			                     <th>필요수량</th>
			                     <th>제조사</th>
			                  </tr>
		                  </thead>
		                  <tbody>
		                  </tbody>
		               </table>
	               
	               </div>	<!-- listTableWrap end -->
	               <div id="subSubTitle3">상품-재고 리스트</div>
					<div id="listTableWrap" class="modaltableWrap">
						<table id="storageTable" class="listTable">
							<thead>
								<tr class="listHead" style="background: #ececec;">
									<th width="120px">상품명</th>
									<th>재고 번호</th>
									<th>로케이션<br>번호</th>
									<th>재고<br>수량</th>
									<th>선택<br>수량</th>
									<th width="10%">추가<br>버튼</th>
								</tr>
							</thead>
							<tbody>
								<tr class="listBody">
									<td colspan="6">상품 리스트를 클릭해주세요.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>	<!-- moSection1 -->
				<!-- 
				<div id="moSection3">
					<table style="padding-top: 270px; padding-left: 5px;">
						<thead>
							<tr>
								<td><div id="pickingProductBtn">담기 ▶</div></td>
							</tr>
						</thead>
					</table>
				</div>	moSection3 end
				 -->
				<div id="moSection2">
					<table id="pickingHeader" style="width: 100%; padding-top: 15px;">
						<tr>
							<th class="header" rowspan="2" colspan="4">피킹리스트</th>
							<th>날짜</th>
							<td id="pickingDate"></td>
							<th>피킹ID</th>
							<td id="pickingId"></td>
						</tr>
						<tr>
							<th></th>
							<td></td>
							<th>회사명</th>
							<td id="pickingCom"></td>
						</tr>
					</table>
					<table id="pickingTable">
						<thead>
							<tr>
								<th width=10%>순번</th>
								<th width=23%>회사명</th>
								<th width=25%>제품명</th>
								<th width=15%>재고ID</th>
								<th width=10%>수량</th>
								<th width=17%>로케이션<br>번호</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>check</td>
								<td>check</td>
								<td>check</td>
								<td>check</td>
								<td>check</td>
								<td>check</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6"><span id="pickingList" class="close" name="pickingList">저장하기</span></td>
							</tr>
						</tfoot>
					</table>
				</div>	<!-- moSection2 end -->
				</div>	<!-- modal-body end -->
				<div class="modal-footer">
				</div>	<!-- modal-footer end -->



			</div>	<!-- modal-content end -->
		
	</div>	<!-- Modal end -->
<script type="text/javascript">
var modal = document.getElementById("find-Modal");
var span = document.getElementsByClassName("close")[0];

$(document).on("click", "#cuListTable td", function() {
	var num = $(this).parent().children("input").val();
	/* console.log("val : " + num); */
	$.ajax({
		url: "<%= request.getContextPath() %>/selectProductSelect.or",
		type: "post",
		data: {
			cuListNo: num
		},
		success: function(data) {
			/* console.log(data); */
			modal.style.display = "block";
			
			$tableBody = $("#proListTable tbody");
			$tableBody.html('');
			
			for(var key in data.cuList){
				$tr = $("<tr>").attr('class', 'listBody');
				$hiddenTd = $("<input>").attr("id", "cuProNo").attr("type", "hidden").attr("value", data.cuList[key].pCode);
				$codeTd = $("<td>").text(data.cuList[key].pCode);
				$nameTd = $("<td>").text(data.cuList[key].pName);
				$amountTd = $("<td>").text(data.cuList[key].pCount);
				$pvendorTd = $("<td>").text(data.cuList[key].pvendor);
				
				$tr.append($hiddenTd);
				$tr.append($codeTd);
				$tr.append($nameTd);
				$tr.append($amountTd);
				$tr.append($pvendorTd);
				
				$tableBody.append($tr);
			}
			
			$("#pickingDate").html(data.pList.pickDate);
			$("#pickingId").html(data.pList.pickNo);
			$("#pickingCom").html(data.pList.company);
			
		},
		error: function() {
			alert("Error!");
		}
	});
	
});

span.onclick = function() {
	modal.style.display = "none";
}

window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}

$(document).on("click", "#proListTable td", function() {
	var pNum = $(this).parent().children("input").val();
	console.log("pNum : " + pNum);
	$.ajax({
		url: "<%= request.getContextPath() %>/selectStorageSelect.or",
		type: "get",
		data: {
			pNum: pNum
		},
		success: function(data) {
			/* console.log(data); */
			
			$tableBody = $("#storageTable tbody");
			$tableBody.html('');
			
			for(var key in data){
				$tr = $("<tr>").attr('class', 'listBody');
				$hiddenTd = $("<input>").attr("id", "cuProNo").attr("type", "hidden").attr("value", data[key].sCode);
				$nameTd = $("<td>").text(data[key].pName);
				$codeTd = $("<td>").text(data[key].pCode);
				$loTd = $("<td>").text(data[key].location);
				$amountTd = $("<td>").attr("class", "amount").text(data[key].quantity);
				$amountInputTd = $("<td>").append($("<input>").attr("class", "ckBox").attr("type", "text").attr("size","1"));
				$ckTd = $("<td>").append($("<input>").attr("class", "pickBtn").attr("type", "button").attr("value", "추가"));
				
				$tr.append($hiddenTd);
				$tr.append($nameTd);
				$tr.append($codeTd);
				$tr.append($loTd);
				$tr.append($amountTd);
				$tr.append($amountInputTd);
				$tr.append($ckTd);
				
				$tableBody.append($tr);
			}
			
		},
		error: function() {
			alert("Error!");
		}
	});
	
});
	
 	$(document).on("click", "#storageTable .pickBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var amount  = $(this).parent().parent().children("td").eq(4).find("input").val();
		var pListNo = $("#pickingId").text();
		/* console.log("num : " + pListNo); */
		$.ajax({
			url: "<%= request.getContextPath() %>/insertPickingList.or",
			type: "get",
			data: {
				num: num,
				amount: amount,
				pListNo: pListNo
			},
			context: this,
			success: function(data) {
				console.log(data);
				
				$tableBody = $("#pickingTable tbody");
				$tableBody.html('');
				
				for(var key in data.list) {
					$tr = $("<tr>").attr('class', 'listBody');
					$hiddenTd = $("<input>").attr("id", "pickNo").attr("type", "hidden").attr("value", data.list[key].pickingProductNo);
					$numTd = $("<td>").text(data.list[key].rNum);
					$companyTd = $("<td>").text(data.list[key].company);
					$nameTd = $("<td>").text(data.list[key].pName);
					$sCodeTd = $("<td>").text(data.list[key].sCode);
					$countTd = $("<td>").text(data.list[key].pCount);
					$locationTd = $("<td>").text(data.list[key].location);
					
					
					$tr.append($hiddenTd);
					$tr.append($numTd);
					$tr.append($companyTd);
					$tr.append($nameTd);
					$tr.append($sCodeTd);
					$tr.append($countTd);
					$tr.append($locationTd);
					
					$tableBody.append($tr);
				}
				
				$amountCk  = $(this).parent().parent().children("td").eq(3).text();
				console.log("amount Check : " + $amountCk);
				
				$amount  = $(this).parent().parent().children("td").eq(3);
				$amount.text(data.storage.quantity);

				
			},
			error: function() {
				alert("Error!");
			}
		});
	});
	 
	 
</script>   
   
</body>
</html>