<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  width: 50%; /* Could be more or less, depending on screen size */
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
.modal-table{
    width: 700px;
    border: 1px solid #444444;
    margin: 0 auto;
}
#modal-close{
	margin-top: 10px;
}
</style>
<link rel="stylesheet" type="text/css" href="../../../resources/css/PickingListCss.css"/>
</head>
<!-- mainWrapper start -->
<div id="mainWrapper">

	<%@ include file="../menu/cmMain.jsp" %> 
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box">
			<!-- 본문영역 상단부 -->
			<div id="titleArea">
				<!-- 본문 영역 제목 -->
				<div id="mainTitle">출고 관리</div>
				<!-- 본문 영역 제목 밑에있는 선 -->
				<div id="line1"></div>
				<!-- 본문 영역 소제목 -->
				<div id="subTitle">피킹리스트 조회</div>
			</div>
			<!-- 본문영역 상단부 끝 -->
			
			<!-- 본문영역 중앙부 -->
			<div id="contentArea">
				<!-- 조회 정보 입력 부분 -->
				<div id="searchArea">
						<!-- 조회 제목 -->
						<div id="subSubTitle1">출고 검색</div>
						<!-- 조회 상자 테두리-->
						<div id="searchBox">
							<form id="searchForm">
								<table>
									<tr>
										<!-- 검색 내용 타이핑하는 부분 -->
										<td>회사명  :</td>
										<td><input type="text" class="searchTextBox" size="7"></td>
																			
										<td>진행상태  :</td>
										<td><div class="dropdown">
        										<div class="select">
          											<span>선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="">
										        <ul class="dropdown-menu">
										          <li id="">출고요청</li>
										          <li id="">출고지시</li>
										          <li id="">출고작업중</li>
										          <li id="">출고완료</li>
										        </ul>
										      </div>
                        				</td>
										
										<td>날짜  :</td>
										<td><input type="date" class="searchTextBox" size="7"></td>
										
									
									</tr>
									<tr>
										
										<td>주문번호  :</td>
										<td><input type="text" class="searchTextBox" size="10"></td>
										
										<td>담당자 명  :</td>
										<td><input type="text" class="searchTextBox" size="10"></td>
										
										<td>출고코드  :</td>
										<td><input type="text" class="searchTextBox" size="15"></td>
										
										<td><input type="submit" class="btn" value="검색하기" id="submit"></td>
									</tr>
								</table>
							</form>
						</div>
				</div>
				
				
					
				<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2">피킹 리스트</div>
					<!-- 적용 버튼 -->
					<button onclick="" class="btn" id="apply">리스트확인</button>
						<!-- Trigger/Open The Modal -->


						<!-- The Modal -->
						<div id="myModal" class="modal">
						  <!-- Modal content -->
						  <div class="modal-content">
						    <span class="close">&times;</span>
						    <h1 align="center">피킹리스트</h1>
						    <table class="modal-table">
						    	<tr>
						    		<th>순번</th>
						    		<th>제품명</th>
						    		<th>수량</th>
						    		<th>비고</th>
						    	</tr>
						    	<tr>
						    		<td>1</td>
									<td>오예스</td>
									<td>70</td>
									<td>-</td>
						    	</tr>
						    	<tr>
						    		<td>2</td>
									<td>매운 새우깡</td>
									<td>100</td>
									<td>-</td>
						    	</tr>
						    	<tr>
						    		<td>3</td>
									<td>초코송이</td>
									<td>140</td>
									<td>-</td>
						    	</tr>
						    	
						    </table>
						    <div align="center" id="modal-close">
						    <button onclick="" class="btn" id="chCodeBtn">닫기</button>
						    </div>
						  </div>
						
						</div>
					
					<!-- 조회 리스트 테이블 -->
					<table id="listTable">
						<!-- 테이블 헤드 -->
						<tr id="listHead">
							<th><input type="checkbox" id="checkall"></th>
							<th width="80px">회사명</th>
							<th width="140px">출고코드</th>
							<th width="80px">진행상태</th>
							<th width="100px">출고지시일</th>
							<th width="50px">회차</th>
							<th width="80px">담당자</th>
							<th width="80px">총금액</th>
							<th width="150px">주문번호</th>
							<th width="80px">관리메모</th>
						</tr>
						
						<!-- 리스트 바디  -->
						<tr class="listBody">
							<td><input type="checkbox" name="chk"></td>
							<td>SDY</td>
							<td>O20200601-00021</td>
							<td>출고완료</td>
							<td>2020-06-01</td>
							<td>1회차</td>
							<td>김보훈</td>
							<td>150,000</td>
							<td>202006-01-100</td>
							<td>-</td>
						</tr>
						<tr class="listBody">
							<td><input type="checkbox" name="chk"></td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						<tr class="listBody">
							<td><input type="checkbox" name="chk"></td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						<tr class="listBody">
							<td><input type="checkbox" name="chk"></td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
							<td>내용</td>
						</tr>
						<tr class="listBody">
							<td><input type="checkbox" name="chk"></td>
							<td>내용</td>
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
	
	//모달 닫기 버튼
	var chCodeBtn = document.getElementById("chCodeBtn");
	
	chCodeBtn.onclick = function() {
		  modal.style.display = "none";
	}
	
	
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
 	    })
 	})
	
	</script>
	
</html>