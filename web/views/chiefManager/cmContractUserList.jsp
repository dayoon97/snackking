<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.user.model.vo.User, java.util.*"%>
 <% ArrayList<User> list = (ArrayList<User>) request.getAttribute("list"); %>
 <% ArrayList<User> adminlist = (ArrayList<User>) request.getAttribute("adminlist"); %>
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
	}
	/*폼 기본 서식*/
	#searchForm{
		height:100%;
		margin: 0 auto;
		padding-left:20px;
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

.table-scroll{
	height:300px;
	position: absolute;
	margin-top: 200px;
	margin-left: 30px;
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
  margin-right: 10px;
  margin-left: 10px;
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
</style>
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">
	
	<!--  -->
	<%@ include file ="../common/userMenu.jsp" %>
	
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
		
			<!-- title-area start -->
			<div id="titleArea">
				<div id="mainTitle">계약 관리</div>
				<div id="line1"></div>
				<div id="subTitle">회원 리스트</div>
			</div>	<!--title-area end -->
			
			<!-- search-area start -->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">회원 검색</div>
					<!-- searchBox start -->
					<div id="searchBox">
						<form id="searchForm"<%--  action="<%=request.getContextPath()%>/selectName.us?num=<%=loginUser.getUserNo() %>" method="post" value="mngNo" --%>>
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td>이름  :</td>
									<td><input type="text" class="searchTextBox" size="7" name="member" onfocus="this.value=''; return true" id="memberName"></td>
									
									<td>회사명  :</td>
									<td><input type="text" class="searchTextBox" size="7" name="member" onfocus="this.value=''; return true" id="memberCompany"></td>
									
									<td>아이디  :</td>
									<td><input type="text" class="searchTextBox" size="7" name="member" onfocus="this.value=''; return true" id="memberId"></td>
									
									<td>전화번호  :</td>										
									<td><input type="text" class="searchTextBox" size="10" name="member" onfocus="this.value=''; return true" id="memberPhone"></td>
									
									<td>회원 구분 :</td>										
									<td><div class="dropdown">
        										<div class="select">
          											<span id="userCode">선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <!-- <input type="hidden" name="employee" id="employeeTcode"> -->
										        <ul class="dropdown-menu">
										          <li id="T1">일반회원</li>
										          <li id="T2">계약회원</li>
										        </ul>
										      </div></td>
									
									<td><input type="hidden" id="mngNo" value="<%=loginUser.getUserNo()%>"><input type="button" class="searchBtn" value="검색하기" id="submit" name="searchBtn"></td>
									
								</tr>
							</table>
						</form>
					</div> <!-- searchBox end -->
			</div>	<!-- search-area end -->
			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">회원 리스트</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					
					<!-- 조회 리스트 테이블 -->
					<div class="table-scroll" style="overflow: auto;">
					<table id="listTable" name="listTable">
						<!-- 테이블 헤드 -->
						<thead>
						<tr id="listHead">
							<th width="30px">번호</th>
							<th width="80px">아이디</th>
							<th width="80px">회사</th>
							<th width="80px">담당자명</th>
							<th width="250px">주소</th>
							<th width="100px">연락처</th>
							<th width="80px">가입일</th>
							<%if(loginUser.gettCode().equals("T3")){ %>
							<th width="80px">회원구분</th>
							<%} %>
						</tr>
						</thead>
						<!-- 리스트 바디  -->
						<tbody>
							<% for(User u : list) {%>
							
						<tr class="listBody">
							<input type="hidden" value="<%= u.getUserNo() %>">
							<td><%= u.getUserNo() %></td>
							<td><%= u.getUserId() %></td>
							<td><%= u.getCompany() %></td>
							<td><%= u.getUserName() %></td>
							<td><%= u.getAddress() %></td>
							<td><%= u.getPhone() %></td>
							<td><%= u.getEnrollDate() %></td>
							
							<%if(loginUser.gettCode().equals("T3")){ %>
							<td><% if(u.gettCode().equals("T1")) { %>
								일반회원
								<% } else { %>
								계약회원
								<% } %>
							</td>
							<%} %>
						</tr> 
						<% } %>
					</tbody>
					</table>
					</div>
				</div>
		
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

	$('.dropdown-menu li').click(function() {
		var input = '<strong>'+ $(this).parents('.dropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
		$('.msg').html(msg + input + '</span>');
	});
	
	//check박스 전체선택
      
      $(document).ready(function(){
   	   /*  //최상단 체크박스 클릭 */
   	    $("#checkall").click(function(){
   	        /* //클릭되었으면 */
   	        if($("#checkall").prop("checked")){
   	            //* /input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 */
   	            $("input[name=chk]").prop("checked",true);
   	            /* //클릭이 안되있으면 */
   	        }else{
   	            /* //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의 */
   	            $("input[name=chk]").prop("checked",false);
   	        }
   	    });
   	   
   	});
   	
	
	//회원 구분 검색(최고관리자만 보이게 하기)
	if(<%=loginUser.gettCode().equals("T4")%>){
		$("#searchForm td").eq(8).hide();
		$("#searchForm td").eq(9).hide();
	} else {
		$("#searchForm td").eq(8).show();
		$("#searchForm td").eq(9).show();
	}
	
	
	
	
	//큐레이터 회원 조건 검색
	if(<%=loginUser.gettCode().equals("T4")%>){
	$(function(){
		
		
		$("#submit").click(function(){
		
			$("#listTable td").remove();
			
			var arr = [];
			
			var name = document.getElementsByName("member")[0].value;
			var company = document.getElementsByName("member")[1].value;
			var id = document.getElementsByName("member")[2].value;
			var phone = document.getElementsByName("member")[3].value;
			
			$('input[name="member"]:text').each(function(i){
				arr.push($(this).val());
			});
			
			for(i in arr){
				console.log(arr[i])
				if(arr[i] == null) {
					
				} 	
			}
			
			var member = {
				"user" : $("#mngNo").val(),
				"list" : arr
					
			};
			
			console.log(arr);
			$.ajax({
				url: "<%=request.getContextPath()%>/selectName.us",
				data: member,
				type: "get",
				traditional:true,
				success: function(data){
					
					console.log(data);
					$tableBody = $("#listTable tbody");
 					
 					$tableBody.html('');
 					
 					$.each(data, function(index, value){
 						var $tr = $("<tr>");
 						var $noTd = $("<td>").text(value.userNo);
 						var $idTd = $("<td>").text(decodeURIComponent(value.userId));
 						var $companyTd = $("<td>").text(decodeURIComponent(value.company));
 						var $userNameTd = $("<td>").text(decodeURIComponent(value.userName));
 						var $addressTd = $("<td>").text(decodeURIComponent(value.address));
 						var $phoneTd = $("<td>").text(decodeURIComponent(value.phone));
 						var $enrollDateTd = $("<td>").text(decodeURIComponent(value.enrollDate));
 						
 						

 						var year = (value.enrollDate).substr(7, 8);
 						var mon = (value.enrollDate).substr(0, 1);
 						if(mon.indexOf(" ", 0)){
 							var mon1 = "0";
 						}
 						var day = (value.enrollDate).substr(3, 2);
 						var code;
 						
 						var nal = year.concat("-", mon1, mon,"-",day);
 						
 						$enrollDateTd = $("<td>").text(nal);
 						
 						$tr.append($noTd);
 						$tr.append($idTd);
 						$tr.append($companyTd);
 						$tr.append($userNameTd);
 						$tr.append($addressTd);
 						$tr.append($phoneTd);
 						$tr.append($enrollDateTd);
 						
 						
 						$tr.append($tr).css({"border-bottom":"3px solid #EBEAEA", "height" : "27px"});
 						
 						$tableBody.append($tr);
 					}); 
 					
 					
 				},
 				error: function(data){
 					console.log("에러!");
 				}
				
				
			});
			
		});
	});
	}
	//최고관리자 회원 조건검색
	else {
	$(function(){
		 $("#submit").click(function(){
		
			$("#listTable td").remove();
			
			var arr = [];
			
			var name = document.getElementsByName("member")[0].value;
			var company = document.getElementsByName("member")[1].value;
			var id = document.getElementsByName("member")[2].value;
			var phone = document.getElementsByName("member")[3].value;
			var userTcode = $("span").eq(0).text();
			
			console.log(userTcode);
			
			if(userTcode == "일반회원"){
				userTcode = "T1";
			} else if(userTcode == "계약회원"){
				userTcode = "T2";
			}
			
			$('input[name="member"]:text').each(function(i){
				arr.push($(this).val());
			});
			
			for(i in arr){
				console.log(arr[i])
				if(arr[i] == null) {
					
				} 	
			}
			
			var member = {
				"user" : $("#mngNo").val(),
				"list" : arr,
				userTcode : userTcode
					
			};
			
			console.log(arr);
			
			$.ajax({
				url: "<%=request.getContextPath()%>/adminSearchList.ad",
				data: member,
				type: "get",
				traditional:true,
				success: function(data){
					
					console.log(data);
					$tableBody = $("#listTable tbody");
 					
 					$tableBody.html('');
 					
 					$.each(data, function(index, value){
 						var $tr = $("<tr>");
 						var $noTd = $("<td>").text(value.userNo);
 						var $idTd = $("<td>").text(decodeURIComponent(value.userId));
 						var $companyTd = $("<td>").text(decodeURIComponent(value.company));
 						var $userNameTd = $("<td>").text(decodeURIComponent(value.userName));
 						var $addressTd = $("<td>").text(decodeURIComponent(value.address));
 						var $phoneTd = $("<td>").text(decodeURIComponent(value.phone));
 						var $enrollDateTd = $("<td>").text(decodeURIComponent(value.enrollDate));
 						var $tCodeTd = $("<td>").text(decodeURIComponent(value.tCode));
 						
 						
 						var year = (value.enrollDate).substr(7, 8);
 						var mon = (value.enrollDate).substr(0, 1);
 						if(mon.indexOf(" ", 0)){
 							var mon1 = "0";
 						}
 						var day = (value.enrollDate).substr(3, 2);
 						var code;
 						
 						var nal = year.concat("-", mon1, mon,"-",day);
 						
 						
 						
 						if(value.tCode == "T1"){
 							code = '일반회원';
 						} else if (value.tCode == "T2"){
 							code = '계약회원';
 						}
 						
 						
 						
						$enrollDateTd = $("<td>").text(nal);
						$tCodeTd = $("<td>").text(code);
 						
 						$tr.append($noTd);
 						$tr.append($idTd);
 						$tr.append($companyTd);
 						$tr.append($userNameTd);
 						$tr.append($addressTd);
 						$tr.append($phoneTd);
 						$tr.append($enrollDateTd);
 						$tr.append($tCodeTd);
 						
 						
 						$tr.append($tr).css({"border-bottom":"3px solid #EBEAEA", "height" : "27px"});
 						
 						$tableBody.append($tr);
 					}); 
 					
 					
 				},
 				error: function(data){
 					console.log("에러!");
 				}
				
				
			});
		});
	});
	}
	//num으로 회원번호 받아옴
	//회원리스트에서 클릭하면 보여질 페이지도 location.href으로 설정해둠
	$(function() {
		$("#listTable td").click(function() {
			var num = $(this).parent().children("input").val();
			location.href="<%=request.getContextPath()%>/selctOneContract.co?num=" + num;
			 console.log("num : " + num); 
		});
	});
	
	
   	</script>
	
</body>
</html>
