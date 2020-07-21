<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		height: 400px;
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
	 .memberTable {
		width: 950px;
		margin-top: 10px;
		margin-left: 10px;
		width: 900px; 
		height: 350px; 
		margin-left: 30px;
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
	
	/* 배송주기 주, 요일 타이핑하는 부분, input 태그*/
	.deliveryTextBox {
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
	
	/* 노란 버튼 등록 버튼 */
	.insertBtn {
		border:0;
		outline:0;
		width: 85px;
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
	
	
	/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	 /* Could be more or less, depending on screen size */
	height: 30%;
}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}


	
}

/*조회 결과 리스트 제목 스타일*/
/* #subSubTitle2{
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
} */

/*적용 버튼*/
/* #apply{
position:absolute;	
top:300px;
right:90px;
} */

/* #listTable{
border-collapse:collapse;
position: absolute;
top:350px;
left:45px;
text-align:center;
} */


/*조회 리스트 테이블 listHead*/
/* #listHead{
width: 1400px;
height: 31px;
padding-left:20px;
background: #FBFAFA;
box-sizing:border-box;
border-radius: 300px 0 0 300px;
} */

/*조회 리스트 부분 테이블 헤더 폰트 스타일*/
/* .listHead th{
padding:4px;
font-size:15px;
line-height:17px;
} */

/* 리스트 바디 하위 td 테이블 선 스타일*/
/* .listBody>td{
border-bottom:3px solid #EBEAEA;
height: 25px;
} */

/* .listBody:hover{
	cursor:pointer;
	background: #F0BB00;
} */

/* .searchBtn:hover {
	cursor: pointer;
} */

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

	<%@ include file="../common/cmMain.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
		
			<!-- title-area start -->
			<div id="titleArea">
				<div id="mainTitle">계약 관리</div>
				<div id="line1"></div>
				<div id="subTitle">계약 내역 등록</div>
			</div>	<!--title-area end -->
			
			<!-- search-area start -->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">계약 등록</div>
					<!-- searchBox start -->
					<div id="searchBox">
						<form id="searchForm" action="<%= request.getContextPath()%>/insertContract.co" method="post">
							<table class="memberTable">
							<tr>
								<td>거래처명 :</td>
								<!-- 여기 view 페이지에 있는 name=""(값 넘어가는것)하고 다음에 넘어가는 controller의 servlet getParameter("")하고 같아야 함!!! -->
								<td><input type="text" class="searchTextBox" size="15" name="corpName"> 
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>사업자등록번호:</td>
								<td><input type="text" class="searchTextBox" size="15" name="businessNo">
								</td>
								<td style="text-align:center">계약일 :</td>
								<td><input type="date" class="searchTextBox" size="10" name="conDate"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>계약기간 :</td>
								<td colspan="2">
									<input type="date" class="searchTextBox" size="" name="startDate">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
									<input type="date" class="searchTextBox" name="endDate"></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>배송횟수 :</td>
								<td>월 <input type="text" class="searchTextBox" size="10" name="delivCount">회</td>
								<td style="text-align:center">회차당 금액 :</td>
								<td><input type="text" class="searchTextBox" size="10" name="amountPDeliv">원</td>
								<td>월 계약금액 :</td>
								<td><input type="text" class="searchTextBox" size="10" name="ttlAmount">원</td>
							</tr>
									
						</table>
								
							<div><button type="submit" class="insertBtn"  id="submit" style="margin-left:860px; top:500px;">등록</button>
							</div>
								
									
							<!-- 전송, 클릭 이벤트. 이벤트가 2개라서 잘 안 됨 -->		
							<!-- <input type="submit" class="insertBtn" value="등록" id="submit" 
							onclick="button_click();" style="margin-left: 860px; top: 500px;"> -->
							<!--   <div id="myModal" class="modal">
								<div class="modal-content" style="width: 30%;">
									<span class="close">&times;</span>
									<div style="text-align:center; margin-top:50px;"> 등록이 완료되었습니다.</div>
									<div style="text-align:center; margin-top:50px;">
										<button onclick="" class="btn" id="chCodeBtn" style="width:70px;">확인</button>
									</div>
								</div>
							</div>
							-->
							
						</form>
					</div> <!-- searchBox end -->
			</div>	<!-- search-area end -->
			
			
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->
	
	<script>
	   //Get the modal
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
	
	
	
	
	<!-- check박스 전체선택 -->

      <!-- $(document).ready(function(){
   	   /*  //최상단 체크박스 클릭 */
   	    $("#checkall").click(function(){
   	        /* //클릭되었으면 */
   	        if($("#checkall").prop("checked")){
   	            //* /input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 */
   	            $("input[name=chk]").prop("checked",true);
   	            /* //클릭이 안되있으면 */
   	        }else{
   	            /* //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의 */
   	        }
   	            $("input[name=chk]").prop("checked",false);
   	    })
   	})
   	-->
      
   	</script>
	
</body>
</html>
