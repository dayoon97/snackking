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
position: absolute;
top:350px;
left:45px;
text-align:center;
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
				<div id="mainTitle">회원 관리</div>
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
					<span id="apply">조회 결과 수 :</span>
					
					<!-- 조회 리스트 테이블 -->
					<table id="listTable" name="listTable">
						<!-- 테이블 헤드 -->
						<thead>
						<tr id="listHead">
						
							<th width="20px"><input type="checkbox" id="checkall"></th>
							<th width="30px">번호</th>
							<th width="80px">아이디</th>
							<th width="80px">회사</th>
							<th width="80px">담당자명</th>
							<th width="250px">주소</th>
							<th width="100px">연락처</th>
							<th width="80px">가입일</th>
						</tr>
						</thead>
						<!-- 리스트 바디  -->
						<tbody>
							<% for(User u : list) {%>
						<tr class="listBody">
							<td><input type="checkbox" name="chk"></td>
							<td><%= u.getUserNo() %></td>
							<td><%= u.getUserId() %></td>
							<td><%= u.getCompany() %></td>
							<td><%= u.getUserName() %></td>
							<td><%= u.getAddress() %></td>
							<td><%= u.getPhone() %></td>
							<td><%= u.getEnrollDate() %></td>
						</tr> 
						<% } %>
					</tbody>
						
					</table>
				</div>
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->
	<script>
	<!-- check박스 전체선택 -->
      
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
   	
	
	$(function(){
		$("#searchCondition").keyup(function(){
			$(this).css({"color":"black"});
		});
	});
	
	
	
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
 						var $Td = $("<td>").html("<input type='checkbox'>");
 						var $noTd = $("<td>").text(value.userNo);
 						var $idTd = $("<td>").text(decodeURIComponent(value.userId));
 						var $companyTd = $("<td>").text(decodeURIComponent(value.company));
 						var $userNameTd = $("<td>").text(decodeURIComponent(value.userName));
 						var $addressTd = $("<td>").text(decodeURIComponent(value.address));
 						var $phoneTd = $("<td>").text(decodeURIComponent(value.phone));
 						var $enrollDateTd = $("<td>").text(decodeURIComponent(value.enrollDate));
 						
 						$tr.append($Td);
 						$tr.append($noTd);
 						$tr.append($idTd);
 						$tr.append($companyTd);
 						$tr.append($userNameTd);
 						$tr.append($addressTd);
 						$tr.append($phoneTd);
 						$tr.append($enrollDateTd);
 						
 						
 						$tr.append($tr).css({"border-bottom":"3px solid #EBEAEA", "height" : "25px"});
 						
 						$tableBody.append($tr);
 					}); 
 					
 					
 				},
 				error: function(data){
 					console.log("에러!");
 				}
				
				
			});
		});
	});

	
   	</script>
	
</body>
</html>
