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
  height: 20px;
  text-align: left;
}
.dropdown .select {
    cursor: pointer;
    display: block;
    padding: 2px 10px;
}
.dropdown .select > i {
    font-size: 13px;
    color: #888;
    cursor: pointer;
    transition: all .3s ease-in-out;
    float: right;
    line-height: 20px;
}
.dropdown:hover {
    box-shadow: 0 0 4px rgb(204, 204, 204);
}
.dropdown:active {
    background-color: #f8f8f8;
}
.dropdown.active:hover,
.dropdown.active {
    box-shadow: 0 0 4px rgb(204, 204, 204);
    border-radius: 2px 2px 0 0;
    background-color: #f8f8f8;
}
.dropdown.active .select > i {
    transform: rotate(-90deg);
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
    z-index: 9;
}
.dropdown .dropdown-menu li {
    padding: 10px;
    transition: all .2s ease-in-out;
    cursor: pointer;
} 
.dropdown .dropdown-menu {
    padding: 0;
    list-style: none;
}
.dropdown .dropdown-menu li:hover {
    background-color: #f2f2f2;
}
.dropdown .dropdown-menu li:active {
    background-color: #e2e2e2;
}
/* drowBox Css end */
#mainWrapper {
	margin-left: auto;
	margin-right: auto;
	display: table;
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
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 50px;
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
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
</style>
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="curatorMain.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
		
			<!-- title-area start -->
			<div id="titleArea">
				<div id="mainTitle">스케줄 관리</div>
				<div id="line1"></div>
				<div id="subTitle">개인 스케줄 관리</div>
			</div>	<!--title-area end -->
			
			<!-- search-area start -->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">재고 검색</div>
					<!-- searchBox start -->
					<div id="searchBox">
						<form id="searchForm">
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td>이름 :</td>
									<td><input type="text" class="searchTextBox" size="7"></td>
																		
									<td>담당자명 :</td>
									<td>
										<!-- <select id="searchCondition" name="searchCondition">
											<option value="none">==선택==</option>
											<option value="continue">진행중</option>
											<option value="endContract">종료</option>
										</select> -->
										<div class="dropdown">
											<div class="select">
												<span>선택</span>
												<i class="fa fa-chevron-left"></i>
											</div>
											<input type="hidden" name="Job-code">
											<ul class="dropdown-menu">
												<li id="continue">김보훈</li>
												<li id="endContract">김미소</li>
												<li id="endContract">심다윤</li>
												<li id="endContract">이재형</li>
												<li id="endContract">이민형</li>
												<li id="endContract">최재영</li>
											</ul>
										</div>
									</td>
									
									
									<td>회사명  :</td>										
									<td><input type="text" class="searchTextBox" size="7"></td>
									
									<td>날짜  :</td>
									<td><input type="date"></td>
									
									<td><input type="submit" class="searchBtn" value="검색하기" id="submit"></td>
								
								</tr>
							</table>
						</form>
					</div> <!-- searchBox end -->
			</div>	<!-- search-area end -->
			
				<button onclick="" class="searchBtn" id="apply" style="position:absolute; top: 300px; right: 90px;">추가</button>
                  <!-- Trigger/Open The Modal -->
            
                  <!-- The Modal -->
                  <div id="myModal" class="modal">
                  <form >
                    <!-- Modal content -->
                    <div class="modal-content">
                      <span class="close">&times;</span>
                      <table align="center">
                      	<tr>
                      		<td></td>
                      		<td>이름</td>
                      		<td></td>
                      		<td>담당자명</td>
                      		<td></td>
                      		<td>회사명</td>
                      		<td></td>
                      		<td>날짜</td>
                      		<td></td>
                      		<td>요일</td>
                      		<td></td>
                      		<td>시간</td>
                      		<td></td>
                      	</tr>
                      
                         <tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td></td>
									<td><input type="text" class="searchTextBox" size="7"></td>
																		
									<td></td>
									<td>
										<!-- <select id="searchCondition" name="searchCondition">
											<option value="none">==선택==</option>
											<option value="continue">진행중</option>
											<option value="endContract">종료</option>
										</select> -->
										<div class="dropdown">
											<div class="select">
												<span>선택</span>
												<i class="fa fa-chevron-left"></i>
											</div>
											<input type="hidden" name="Job-code">
											<ul class="dropdown-menu">
												<li id="continue">김보훈</li>
												<li id="endContract">김미소</li>
												<li id="endContract">심다윤</li>
												<li id="endContract">이재형</li>
												<li id="endContract">이민형</li>
												<li id="endContract">최재영</li>
											</ul>
										</div>
									</td>
									<td></td>										
									<td><input type="text" class="searchTextBox" size="7"></td>
									
									<td></td>
									<td><input type="date"></td>
									
									<td></td>
									<td>
										<div class="dropdown">
											<div class="select">
												<span>선택</span>
												<i class="fa fa-chevron-left"></i>
											</div>
											<input type="hidden" name="Job-code">
											<ul class="dropdown-menu">
												<li id="continue">월</li>
												<li id="endContract">화</li>
												<li id="endContract">수</li>
												<li id="endContract">목</li>
												<li id="endContract">금</li>
											</ul>
										</div>
									</td>
									<td></td>
									<td><input type="time"></td>
									<td><button onclick="" class="searchBtn" id="chCodeBtn">추가하기</button></td>
								</tr>
                      </table>
                    </div>
                  </form>
                  </div>
			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">재고 리스트</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<!-- <span id="apply">조회 결과 수 :</span> -->
					
					<!-- 조회 리스트 테이블 -->
					<table id="listTable">
						<!-- 테이블 헤드 -->
						<tr id="listHead">
							
							<th width="80px">매칭코드</th>
							<th width="140px">이름</th>
							<th width="80px">담당자명 </th>
							<th width="100px">회사명</th>
							<th width="150x">배송일자</th>
							<th width="50px">배송요일</th>
							<th width="150px">배송시간</th>
							<th width="100px">변경</th>
						</tr>
						
						<!-- 리스트 바디  -->
						<tr class="listBody">
							<td>1</td>
							<td>심다윤</td>
							<td>최우아</td>
							<td>쏘이지</td>
							<td>20-07-07</td>
							<td>화</td>
							<td>10:00AM</td>
							<td><button class="searchBtn" id="apply">추가</button></td>
						</tr>
						<tr class="listBody">
							
							<td>2</td>
							<td>심다윤</td>
							<td>최우아</td>
							<td>쏘이지</td>
							<td>20-07-09</td>
							<td>목</td>
							<td>10:00AM</td>
							<td><button onclick="" class="searchBtn" id="apply">추가</button></td>
						</tr>
						<tr class="listBody">
							
							<td>3</td>
							<td>심다윤</td>
							<td>최우아</td>
							<td>쏘이지</td>
							<td>20-07-14</td>
							<td>화</td>
							<td>10:00AM</td>
							<td><button onclick="" class="searchBtn" id="apply">추가</button></td>
						</tr>
						<tr class="listBody">
							
							<td>4</td>
							<td>심다윤</td>
							<td>최우아</td>
							<td>쏘이지</td>
							<td>20-07-16</td>
							<td>목</td>
							<td>10:00AM</td>
							<td><button onclick="" class="searchBtn" id="apply">추가</button></td>
						</tr>
						<tr class="listBody">
							
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td><button onclick="" class="searchBtn" id="apply">추가</button></td>
						</tr>
						
					</table>
				</div>
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

	<script type="text/javascript">
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
	</script>	
                  
      <script>
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
      </script>
      
      
      <script>
      $("#listTable tr").click(function(){
    	   // Get the modal
          var modal2 = document.getElementById("myModal2");

          // Get the button that opens the modal
          var btn2 = document.getElementById("apply2");

          // Get the <span> element that closes the modal
          var span2 = document.getElementsByClassName("close")[0];

          // When the user clicks on the button, open the modal
          btn2.onclick = function() {
            modal2.style.display = "block";
          }

          // When the user clicks on <span> (x), close the modal
          span2.onclick = function() {
            modal2.style.display = "none";
          }

          // When the user clicks anywhere outside of the modal, close it
          window.onclick = function(event) {
            if (event.target == modal2) {
              modal2.style.display = "none";
            }
          }
      });
      
      
      

      </script>
</body>
</html>