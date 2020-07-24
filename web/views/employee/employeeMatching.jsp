<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.awt.*, com.kh.snackking.user.model.vo.*, java.util.*"%>
<% ArrayList<User> list = (ArrayList<User>) request.getAttribute("list"); %>
<% ArrayList<User> emplist = (ArrayList<User>) request.getAttribute("emplist"); %>
<% ArrayList<User> userlist = (ArrayList<User>) request.getAttribute("userlist"); %>
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
		margin-left: 70px;
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
  width: 35%; /* Could be more or less, depending on screen size */
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
				<div id="subTitle">매칭 리스트 관리</div>
			</div>
			<!-- 본문영역 상단부 끝 -->
			
			<!-- 본문영역 중앙부 -->
			<div id="contentArea">
				<!-- 조회 정보 입력 부분 -->
				<div id="searchArea">
						<!-- 조회 제목 -->
						<div id="subSubTitle1">검색</div>
						<!-- 조회 상자 테두리-->
						<div id="searchBox">
								<table>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
										<td>이름  :</td>
										<td><input type="text" class="searchTextBox" size="7" id="EmpName"></td>
																			
										<td>회사명  :</td>
										<td><input type="text" class="searchTextBox" size="7" id="company"></td>
										
										
										<td>전화번호  :</td>
										<td><input type="text" class="searchTextBox" size="10" id="phone"></td>
										
										<td><input type="submit" class="searchBtn" value="검색하기" id="submit"></td>
									
									</tr>
								</table>
						</div>
				</div>
				
				
					
				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">매칭 리스트</div>
					<!-- 적용 버튼 -->
					<button onclick="" class="searchBtn" id="apply">추가</button>
						<!-- Trigger/Open The Modal -->
				
						<!-- The Modal -->
						<div id="myModal" class="modal">
						  <!-- Modal content -->
						  <div class="modal-content">
						    <span class="close">&times;</span>
						  	<h1 align="center">매칭하기</h1><br>
						    <table align="center">
						    	<tr>
						    		<th>직원이름</th>
						    		<th>담당자명</th>
						    	</tr>
						    	<tr>
						    		<td>
						    			<div class="dropdown">
        										<div class="select">
          											<span id="emName">선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="emp-code">
										        <ul class="dropdown-menu">
										        <% for(User e : emplist) {%>
										          <li><%= e.getUserName()%></li>
										         <% } %>
										        </ul>
										 </div>
									</td>
									<td>
									<div class="dropdown">
        										<div class="select">
          											<span id="uName">선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="Job-code">
										        <ul class="dropdown-menu">
										        <%for(User u2 : userlist) {%>
										          <li><%= u2.getUserName() %></li>
										          <% } %>
										        </ul>
										      </div>
									</td>
									
						    	</tr>
						    	
						    </table>
						    <button onclick="" class="searchBtn" id="chCodeBtn">추가하기</button>
						  </div>
						
						</div>

					
					<!-- 조회 리스트 테이블 -->
					
					<div class="table-scroll" style="overflow: auto;">
						<table id="listTable">
						<!-- 테이블 헤드 -->
						<thead>
						<tr id="listHead">
							<th width="80px">매칭코드</th>
							<th width="140px">직원이름</th>
							<th width="80px">고객명 </th>
							<th width="100px">회사명</th>
							<th width="250px">고객 연락처</th>
							<th width="250px">주소</th>
						</tr>
						</thead>
						<!-- 리스트 바디  -->
						<tbody>
						<% int j = 0; %>
						<%for(User u : list) { %>
						<tr class="listBody">
							<td><% j++; %><%= j %></td>
							<td><%=u.getManager()%></td>
							<td><%=u.getUserName() %></td>
							<td><%=u.getCompany() %></td>
							<td><%=u.getPhone() %></td>
							<td><%=u.getAddress() %></td>
						</tr>
						<% } %>
						</tbody>
					</table>
					</div>
				</div>
		</div>	
		</div>
	</div>
</div>	
<script>
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
	
	// Get the modal
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("apply");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal
	btn.onclick = function() {
	  modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
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

    
    
    $(document).on('click', '#chCodeBtn', function(){
    	var uName = $('#uName').text();
        var emName = $('#emName').text();
    	
        
    	$.ajax({
    		url:"<%=request.getContextPath()%>/updateMatching",
    		data: {uName:uName, emName:emName},
    		type: "get",
    		traditional:true,
    		success: function(data){
    			location.href="<%=request.getContextPath()%>/matchingSelect";
    		},
    		error: function(data){
    			alert("에러");
    		}
    	});
    });
    
  //검색 결과 ajax
	$(document).on('click', '#submit', function(e){

		$("#listTable td").remove();
		
		var name = document.getElementById("EmpName").value;
		var company = document.getElementById("company").value;
		var phone = document.getElementById("phone").value;
		
		console.log(name);
		
		
		$.ajax({
			url: "<%=request.getContextPath()%>/searchMatching",
			data: {name:name, company:company, phone:phone},
			type: "get",
			success: function(data){
				
				
				$tableBody = $("#listTable tbody");
					
					$tableBody.html('');
					
					$.each(data, function(index, value){
						
						var $tr = $("<tr class='listBody'>");
						var $noTd = $("<td>").text(value.userNo);
						/* var $tCodeTd = $("<td>").text(decodeURIComponent(value.manager));
						var $userNameTd = $("<td>").text(decodeURIComponent(value.userName));
						var $addressTd = $("<td>").text(decodeURIComponent(value.address));
						var $phoneTd = $("<td>").text(decodeURIComponent(value.phone));
						var $enrollDateTd = $("<td>").text(decodeURIComponent(value.enrollDate));
						var $statusTd = $("<td>").text(decodeURIComponent(value.status));
						var $endTr = $("</tr>");
						
						
						
						$tr.append($noTd);
						$tr.append($tCodeTd);
						$tr.append($userNameTd);
						$tr.append($addressTd);
						$tr.append($phoneTd);
						$tr.append($enrollDateTd);
						$tr.append($statusTd);
						$tr.append($endTr);
						
						$tr.append($tr).css({"border-bottom":"3px solid #EBEAEA", "height" : "27px"});
						
						$tableBody.append($tr); */
					});  
					 
				},
				error: function(data){
					console.log("에러!");
				}
			
			
		});
	});
</script>

</body>
</html>