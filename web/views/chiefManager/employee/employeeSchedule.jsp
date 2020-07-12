<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

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
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
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
.btn:hover {
	cursor:pointer;
}

</style>
<link rel="stylesheet" type="text/css" href="../../../resources/css/all.css"/>
</head>
<body>
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../../common/menu/cmMain.jsp" %>
	
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
				<div id="subTitle">월별 스케줄</div>
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
							<form id="searchForm">
								<table>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
										<td>담당자명 :</td>
										<td><input type="text" class="searchTextBox" size="7"></td>
																			
										<td>상태  :</td>
										<td><div class="dropdown">
        										<div class="select">
          											<span>전체</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="Job-code">
										        <ul class="dropdown-menu">
										          <li id="">승인요청</li>
										          <li id="">확정</li>
										        </ul>
										      </div>
                        				</td>
										
										<td>날짜  :</td>
										<td><input type="date"></td>
										
										<td width="200px" ></td>
										<!-- <td><input type="text" class="searchTextBox" size="10"></td> -->
										
										<td><input type="submit" class="btn" value="검색하기" id="submit"></td>
									
									</tr>
								</table>
							</form>
						</div>
				</div>
				
				
					
				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">리스트</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">변경/추가</button>
						Trigger/Open The Modal
				
						The Modal
						<div id="myModal" class="modal">
						  Modal content
						  <div class="modal-content">
						    <span class="close">&times;</span>
						    <table align="center">
						    	<tr>
						    		<th>직원이름</th>
						    		<th>담당자명</th>
						    		<th>회사명</th>
						    		<th>담당자 연락처</th>
						    		<th>주소</th>
						    	</tr>
						    	<tr>
						    		<td>
						    			<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="emp-code">
										        <ul class="dropdown-menu">
										          <li id="">심다윤</li>
										          <li id="">김보훈</li>
										          <li id="">이민형</li>
										          <li id="">이재형</li>
										          <li id="">최재영</li>
										        </ul>
										 </div>
									</td>
									<td>
									<div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="Job-code">
										        <ul class="dropdown-menu">
										          <li id="">정용탁</li>
										          <li id="">정상현</li>
										          <li id="">최우아</li>
										        </ul>
										      </div>
									</td>
									<td>내용</td>
									<td>내용</td>
									<td>내용</td>
									
						    	</tr>
						    	
						    </table>
						    <button onclick="" class="btn" id="chCodeBtn">추가하기</button>
						  </div>
						
						</div>-->
						<button onclick="" class="btn" id="apply">수정</button>
					
					<!-- 조회 리스트 테이블 -->
					<table id="listTable">
						<!-- 테이블 헤드 -->
						<tr id="listHead">
							
							<th width="80px">매칭코드</th>
							<th width="140px">이름</th>
							<th width="80px">담당자명 </th>
							<th width="100px">회사명</th>
							<th width="100px">배송일자</th>
							<th width="100px">배송요일</th>
							<th width="100px">배송시간</th>
							<th width="100px">상태</th>
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
							<td>승인요청</td>
						</tr>
						<tr class="listBody">
							
							<td>2</td>
							<td>심다윤</td>
							<td>최우아</td>
							<td>쏘이지</td>
							<td>20-07-09</td>
							<td>목</td>
							<td>10:00AM</td>
							<td>확정</td>
						</tr>
						<tr class="listBody">
							
							<td>3</td>
							<td>심다윤</td>
							<td>최우아</td>
							<td>쏘이지</td>
							<td>20-07-14</td>
							<td>화</td>
							<td>10:00AM</td>
							<td>확정</td>
						</tr>
						<tr class="listBody">
							
							<td>4</td>
							<td>심다윤</td>
							<td>최우아</td>
							<td>쏘이지</td>
							<td>20-07-16</td>
							<td>목</td>
							<td>10:00AM</td>
							<td>확정</td>
						</tr>
						<tr class="listBody">
							
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						
					</table>
				</div>
				
			
			
			</div>
			<!-- 본문영역 중앙부 끝 -->
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

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
	$(function() {
		  $( ".calendar" ).datepicker({
				dateFormat: 'dd/mm/yy',
				firstDay: 1
			});
			
			$(document).on('click', '.date-picker .input', function(e){
				var $me = $(this),
						$parent = $me.parents('.date-picker');
				$parent.toggleClass('open');
			});
			
			
			$(".calendar").on("change",function(){
				var $me = $(this),
						$selected = $me.val(),
						$parent = $me.parents('.date-picker');
				$parent.find('.result').children('span').html($selected);
			});
		});


</script>
	
</body>
</html>