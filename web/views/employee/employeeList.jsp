<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.user.model.vo.User, java.util.*"%>
<% ArrayList<User> adminlist = (ArrayList<User>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
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
	/*조회 제목 스타일*/
	#subSubTitle1{
		position: absolute;
		/* width: 69px; */
		height: 30px;
		left: 40px;
		top: 150px;
		/* font-family: NanumSquare_ac; */
		font-style: normal;
		font-weight: bold;
		font-size: 18px;
		/* line-height: 20px; */
		display: flex;
		align-items: center;
		/* color: #000000; */
	}
	/*조회 상자 테두리*/
	#searchBox{
		position: absolute;
		width: 980px;
		height: 60px;
		left: 40px;
		right: 40px;
		margin: 0 auto;
		top: 190px;
		border: 1px solid rgba(75, 75, 75, 0.23);
		box-sizing: border-box;
		border-radius: 33.5px;
		padding-top: 8px;
		padding-left: 10px;
	}
	/*폼 기본 서식*/
	#searchForm{
		height:100%;
		margin: 0 auto;
		padding-left:20px;
		padding-top: 8px;
	}
	/*테이블 기본 서식*/
	.memberTable, #listTable{
		width: 950px;
		margin-top: 10px;
		margin-left: 10px;
	}

	/*td 글자 스타일 지정*/
  	.memberTable>td{
		height: 30px;
		font-family: NanumSquare_ac;
		font-style: normal;
		font-weight: normal;
		font-size: 15px;
		color: #000000;
		padding-top:5px;
		padding-left:0;	
	}
	 
	
	
	/*검색 내용 타이핑하는 부분, input 태그*/
 	.searchTextBox{
		border:0;
		outline:0;
		height: 20px;
		padding:0;
		margin:0;
		margin-left:30px;
		margin-right:30px;
		background: #F6F1F1;
	}
	
	/*노란 버튼 공통 스타일*/
 	.searchBtn{
		border:0;
		outline:0;
		width: 92px;
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

/*조회 결과 리스트 제목 스타일*/
#subSubTitle2{
position: absolute;
width: 90px;
height: 30px;
left: 40px;
top: 300px;
font-family: NanumSquare_ac;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 20px;
display: flex;
align-items: center;
color: #000000;
}

/*적용 버튼*/
#apply{
position:absolute;	
top:300px;
right:90px;
}

#listTable{
border-collapse:collapse;
text-align:center;
width: 1000px;
}


/*조회 리스트 테이블 listHead*/
#listHead{
width: 1400px;
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

.searchBtn:hover {
	cursor: pointer;
}
#mainWrapper {
	margin-left: auto;
	margin-right: auto;
	display: table;
}
body {
  background-color: #fafafa
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
  text-align: left;
  margin-right: 30px;
  margin-left: 30px;
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
  padding: 10px;
  border: 1px solid #888;
  width: 75%; /* Could be more or less, depending on screen size */
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
td {
	text-align: center;
}
.modalTable{
	width: 1000px;
	margin-top: 40px;
}
#chCodeBtn{
	margin-top: 30px;
	margin-left: 45%;
}
.modaltitle:after{
  content: "";
  display: block;
  width: 220px;
  border-bottom: 5px solid #F0BB00;
  margin-right: 10px;
}
.table-scroll{
	height:300px;
	position: absolute;
	margin-top: 200px;
	margin-left: 30px;
}
</style>
<!-- <link rel="stylesheet" type="text/css" href="../../resources/css/all.css"/> -->
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../common/userMenu.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
			<!-- 본문영역 상단부 -->
			<div id="titleArea">
				<!-- 본문 영역 제목 -->
				<div id="mainTitle">직원 관리</div>
				<!-- 본문 영역 제목 밑에있는 선 -->
				<div id="line1"></div>
				<!-- 본문 영역 소제목 -->
				<div id="subTitle">직원 권한변경</div>
			</div>
			<!-- 본문영역 상단부 끝 -->
			
			<!-- 본문영역 중앙부 -->
			<div id="contentArea">
				<!-- 조회 정보 입력 부분 -->
				<div id="searchArea">
						<!-- 조회 제목 -->
						<div id="subSubTitle1">직원 검색</div>
						<!-- 조회 상자 테두리-->
						<div id="searchBox">
								<table>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
										<td>이름  :</td>
										<td><input type="text" class="searchTextBox" size="7" name="employee" onfocus="this.value=''; return true" id="employeeName"></td>
																			
										<td>직급코드  :</td>
										<td><div class="dropdown">
        										<div class="select">
          											<span id="employeeTcode">선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <!-- <input type="hidden" name="employee" id="employeeTcode"> -->
										        <ul class="dropdown-menu">
										          <li id="T4">T4</li>
										          <li id="T5">T5</li>
										        </ul>
										      </div>
                        				</td>
										
										<td>사원코드  :</td>
										<td><input type="text" class="searchTextBox" size="7" name="employee" onfocus="this.value=''; return true" id="employeeNo"></td>
										
										<td>근무상태  :</td>
										<td>
											<div class="dropdown">
        										<div class="select">
          											<span id="employeeStatus">선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <!-- <input type="hidden" name="employee" id="employeeTcode"> -->
										        <ul class="dropdown-menu">
										          <li id="work">근무중</li>
										          <li id="rest">휴가중</li>
										          <li id="travel">퇴사</li>
										        </ul>
										      </div>
										</td>
										
										<td><button class="searchBtn" id="submit">검색하기</button></td>
									
									</tr>
								</table>
						</div>
				</div>
				
				
					
				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">회원 리스트</div>
					<!-- 적용 버튼 -->
					<button onclick="" class="searchBtn" id="apply">권한변경</button>
						<!-- Trigger/Open The Modal -->


						<!-- The Modal -->
						<div id="myModal" class="modal">
						  <!-- Modal content -->
						  <div class="modal-content">
						    <span class="close">&times;</span>
						    <p align="center" class ="modaltitle" style="font-size:30px;">직급코드 변경하기</p>
						    <div class="titleLine"></div>
						    <table align="center" class="modalTable">
						    	
						    </table>
						    <button class="searchBtn" id="chCodeBtn">변경하기</button>
						  </div>
						
						</div>
					
					<!-- 조회 리스트 테이블 -->
					
				<div class="table-scroll" style="overflow: auto;">
					<table id="listTable">
						<!-- 테이블 헤드 -->
						<thead>
						<tr id="listHead">
							<th width="30px;">선택</th>
							<th width="30px">사원</th>
							<th width="50px">직급코드</th>
							<th width="80px">이름 </th>
							<th width="250px">주소</th>
							<th width="80px">연락처</th>
							<th width="80px">입사일</th>
							<th width="50px">근무상태</th>
						</tr>
						</thead>
						<tbody>
						<!-- 리스트 바디  -->
						<% for(User u : adminlist) {%>
						<tr class="listBody">
							<td><input type="checkbox" name="chk"></td>
							<td><%= u.getUserNo() %></td>
							<td><%= u.gettCode() %></td>
							<td><%= u.getUserName() %></td>
							<td><%= u.getAddress() %></td>
							<td><%= u.getPhone() %></td>
							<td><%= u.getEnrollDate() %></td>
							<td>
							<%if (u.getStatus().equals("Y")) { %>
								근무중
							<% } else { %>
								퇴사
							<% } %>
							</td>
						</tr>
						<% } %>
						</tbody>
					</table>
						</div>
					</div>
			</div>
			<!-- 본문영역 중앙부 끝 -->
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

<script>
	<!-- 드롭다운  -->
	$('.dropdown').click(function() {
		$(this).attr('tabindex', 1).focus();
		$(this).toggleClass('active');
		$(this).find('.dropdown-menu').slideToggle(300);
	});
	$('.dropdown').focusout(function() {
		$(this).removeClass('active');
		$(this).find('.dropdown-menu').slideUp(300);
	});
	$('.dropdown .dropdown-menu li').click(
		function() {
			$(this).parents('.dropdown').find('span').text(
					$(this).text());
			$(this).parents('.dropdown').find('input').attr('value',
					$(this).attr('id'));
		});
	/*End Dropdown Menu*/

	$('.dropdown-menu li')
			.click(
					function() {
						var input = '<strong>'
								+ $(this).parents('.dropdown')
										.find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
						$('.msg').html(msg + input + '</span>');
					});

	//모달 스크립트
	// Get the modal
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("apply");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal
	
	$(document).on('click','btn',function(e){
		modal.style.display = "block";
	});
	//ajax 실행후 엘리먼트 함수 안돼서 바꿈
	btn.onclick = function() {
		modal.style.display = "block";
	}

	
	//
	$(document).on('click','span',function(e){
		modal.style.display = "none";
	});
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	};
	
	
	$(document).on('click', 'input[type=checkbox]', function(e){
		if($(this).prop('checked')){
			$('input[type=checkbox]').prop("checked",false);
    		$(this).prop("checked",true);
    	}
	});
    
	
	//검색 결과 ajax
	$(document).on('click', '#submit', function(e){

		$("#listTable td").remove();
		
		var name = document.getElementsByName("employee")[0].value;
		
		var tCode = $("span").eq(0).text();
		if(tCode == "선택"){
			tCode = "";
		}
		var num = document.getElementsByName("employee")[1].value;
		var status = $("span").eq(1).text();
		if(status == "선택"){
			status = "";
		}
		
		var employee = {
			name : name,
			tCode : tCode,
			num : num,
			status : status
		};
		
		console.log(employee);
		
		console.log(name);
		console.log(tCode);
		console.log(num);
		console.log(status);
		
		
		$.ajax({
			url: "<%=request.getContextPath()%>/adminEmpSearch.ad",
			data: employee,
			type: "get",
			async:false,
			traditional: true,
			success: function(data){
				
				
				$tableBody = $("#listTable tbody");
					
					$tableBody.html('');
					
					$.each(data, function(index, value){
						
						var $tr = $("<tr class='listBody'>");
						var $Td = $("<td>").html("<input type='checkbox' name='chk'>");
						var $noTd = $("<td>").text(value.userNo);
						var $tCodeTd = $("<td>").text(decodeURIComponent(value.tCode));
						var $userNameTd = $("<td>").text(decodeURIComponent(value.userName));
						var $addressTd = $("<td>").text(decodeURIComponent(value.address));
						var $phoneTd = $("<td>").text(decodeURIComponent(value.phone));
						var $enrollDateTd = $("<td>").text(decodeURIComponent(value.enrollDate));
						var $statusTd = $("<td>").text(decodeURIComponent(value.status));
						var $endTr = $("</tr>");
						
						
						//근무상태 형태 바꾸기
						var sta;
						if(value.status == 'Y'){
							sta = '근무중';
						} else if(value.status == 'N'){
							sta = '퇴사';
						}
						
						$statusTd = sta;
						
						
						
						//입사일 형태 바꾸기
						var year = (value.enrollDate).substr(7, 8);
 						var mon = (value.enrollDate).substr(0, 1);
 						if(mon.indexOf(" ", 0)){
 							var mon1 = "0";
 						}
 						var day = (value.enrollDate).substr(3, 2);
 						var code;
 						
 						var nal = year.concat("-", mon1, mon,"-",day);
 						
 						$enrollDateTd = $("<td>").text(nal);
						
						
						
						$tr.append($Td);
						$tr.append($noTd);
						$tr.append($tCodeTd);
						$tr.append($userNameTd);
						$tr.append($addressTd);
						$tr.append($phoneTd);
						$tr.append($enrollDateTd);
						$tr.append($statusTd);
						$tr.append($endTr);
						
						$tr.append($tr).css({"border-bottom":"3px solid #EBEAEA", "height" : "27px"});
						
						$tableBody.append($tr);
					});  
					 
				},
				error: function(data){
					console.log("에러!");
				}
			
			
		});
	});
	
    //체크박스 여러개 체크 못하게 하는거
    var obj = document.getElementsByName("chk");
    	
    $(document).ready(function(){
    	$("input[type='checkbox'][name='chk']").click(function(e){
    		if($(this).prop('checked')){
    			$('input[type="checkbox"][name="chk"]').prop("checked",false);
    			$(this).prop("checked",true);
    		}
    	})
    });
    
   
    
    //직원권한 변경 버튼 눌렀을 때
    $(document).on('click','#apply',function(e){
    	//$(".modalTable").empty();
		var rowData = new Array();
		var tdArr = new Array();
		
		 //체크된 체크박스를 가져온다.
	    var checkbox = $("input:checkbox[name=chk]:checked");
	    
		console.log(checkbox);
	    //체크된 체크박스의 값을 반복해 불러옴.
	    checkbox.each(function(i){
	    	
	    	
	    	//checkbox.parent() : checkbox의 부모는 td.
	    	//checkbox.parent().parent() : td의 부모는 tr.
	    	var tr = checkbox.parent().parent().eq(i);
	    	var td = tr.children();
	    	
	    	var html = "";
	    	rowData.push(tr.text());
	    	
	    	
	    	var id = td.eq(1).text();
	    	var name = td.eq(3).text();
	    	var address = td.eq(4).text();
	    	var phone = td.eq(5).text();
	    	var enrolldate = td.eq(6).text();
	    	var status = td.eq(7).text();
	   
	    	
	    	html += '<tr>';
	    	html += '<th width="40px !important;"> 사원 </th>';
	    	html += '<th width="30px !important;"> 직급코드 </th>';
	    	html += '<th width="70px !important;"> 이름 </th>';
	    	html += '<th width="400px !important;"> 주소 </th>';
	    	html += '<th width="200px !important;"> 연락처 </th>';
	    	html += '<th width="100px !important;"> 입사일 </th>';
	    	html += '<th width="70px !important;"> 상태 </th>';
	    	html += '</tr>';
	    	html += '<tr>';
	    	html += '<td>' + id + '</td>';
	    	html += '<td><div class="dropdown"> <div class="select"> <span id="tCode"> 선택  </span> <i class="fa fa-chevron-left"></i> </div>'
	    	+ '<input type="hidden" name="Tcode"> <ul class="dropdown-menu"> <li id="T4">T4</li> <li id="T5">T5'
	    	+ '</li> </ul> </div> </td>';
	    	html += '<td>' + name + '</td>';
	    	html += '<td>' + address + '</td>';
	    	html += '<td>' + phone + '</td>';
	    	html += '<td>' + enrolldate + '</td>';
	    	html += '<td>' + status + '</td>';

	    	
	    	$(".modalTable").empty();
	    	$(".modalTable").append(html);
	    	
	    	//드롭다운 
	    	$('.dropdown').click(function() {
	    		$(this).attr('tabindex', 1).focus();
	    		$(this).toggleClass('active');
	    		$(this).find('.dropdown-menu').slideToggle(300);
	    	});
	    	$('.dropdown').focusout(function() {
	    		$(this).removeClass('active');
	    		$(this).find('.dropdown-menu').slideUp(300);
	    	});
	    	$('.dropdown .dropdown-menu li').click(
	    		function() {
	    			$(this).parents('.dropdown').find('span').text(
	    					$(this).text());
	    			$(this).parents('.dropdown').find('input').attr('value',
	    					$(this).attr('id'));
	    		});
	    	/*End Dropdown Menu*/

	    	$('.dropdown-menu li').click(function() {
	    		var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
	    		$('.msg').html(msg + input + '</span>');
	    	});
	    	 
	    	
	    });
    });
    
    //권한변경 모달안에서 변경하기 버튼 눌렀을 때
    $(document).on('click','#chCodeBtn',function(e){
    	modal.style.display = "none";

		
		var userNo = $('.modalTable td').eq(0).text();
		console.log(userNo);
		var Tcode = $('#tCode').text();
    	console.log(Tcode);

    	var arr = {
    			"userNo" : userNo,
    			"Tcode" : Tcode
    	};
    	
    	$.ajax({
    		url:"<%=request.getContextPath()%>/changeTcode.ad",
    		data: arr,
    		type: "get",
    		traditional:true,
    		success: function(data){
    			location.reload(true);
    		},
    		error: function(data){
    			console.log("에러");
    		}
    		});
    	});
  
    
	</script>
	
</body>
</html>