<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.user.model.vo.User"%>
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
	height:850px;
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
	margin-top: 50px;
	padding: 1px;
	width:100%;
}
td{
	border-bottom: 1px solid #E8E8E8;
	height: 50px;
	text-align: center;
}
#order-td:hover{
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
	width:10%;
	border: 2px solid #FFC700;
}
.searchArea{
	margin-left: 750px;
	margin-top: 30px;
}

.box .form-control{
	max-width: 300px;
	margin: 0 auto;	
}
.datepicker{
	font-family: 'Exo 2', sans-serif;
}
.datepicker--cell.-range-to-{
	background: rgba(248, 206, 236, 0.4);
	border-color: rgba(248, 206, 236, 1);
}
.datepicker--cell.-current-{}
.datepicker--cell.-selected-,.datepicker--cell.-selected-.-focus-{
	background-color: #f8ceec;
	color: #000000;
}
.datepicker--cell.-in-range-{
	background: rgba(248, 206, 236, 0.2);
}
.datepicker--cell-day {
    font-weight: 500;
    color: #000000;
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

input[type='checkbox']{
	border: 1px solid #F0BB00;
}
.write{
	float: right;
	margin-top: 60px;
}
.delete{
	margin-left: 1000px;
	margin-top:60px;
	background: white;
	color:#F0BB00;
	border: 1px solid #F0BB00;
}
.btnArea{
	height:200px;
	width:1200px;
	margin:0 auto;
}
</style>
</head>
<body>
	<!-- mainWrapper start -->
<div id="mainWrapper">
	<%@ include file="../common/userMenu.jsp" %>
	<div class="nav">
			<div class="snack-nav">
				<div class="snack-logo"><img src="../../resources/image/logo5.png"></div>
			</div>
	</div>
	<div class="outer">
		<div class="orderArea">
			<div class="order-table">
				<p class="order-History">문의 내역</p>
				<div class="line"></div>
					<div class="searchArea">
						<!--<input type="text" class="datepicker-here form-control" id="minMaxExample" data-date-format="yy/mm/dd" data-language="en" placeholder="날짜를 선택해주세요">  -->
						<input type="date">
						<input type="text" size="9" value="주문번호 검색">
						<input type="submit" value="검색" class="submit-btn">
					</div>
			<form>
				<table class="order-history-table" align="center">
					<tr>
						<th width="40px;"><input type="checkbox"></th>
						<th width="60px;">번호</th>
						<th width="400px;">제목</th>
						<th width="150px;">날짜</th>
						<th width="300px;">구분</th>
						<th width="80px;">상태</th>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>제목</td>
						<td>날짜</td>
						<td>구분</td>
						<td>미답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>9</td>
						<td>제목</td>
						<td>날짜</td>
						<td>구분</td>
						<td>미답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>8</td>
						<td>제목</td>
						<td>날짜</td>
						<td>구분</td>
						<td>미답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>7</td>
						<td>제목</td>
						<td>날짜</td>
						<td>구분</td>
						<td>미답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>6</td>
						<td>제목</td>
						<td>날짜</td>
						<td>피드백</td>
						<td>답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>5</td>
						<td>제목</td>
						<td>날짜</td>
						<td>피드백</td>
						<td>답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>4</td>
						<td>제목</td>
						<td>날짜</td>
						<td>피드백</td>
						<td>답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>3</td>
						<td>제목</td>
						<td>날짜</td>
						<td>피드백</td>
						<td>답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>제목</td>
						<td>날짜</td>
						<td>교환</td>
						<td>답변</td>
					</tr>
					<tr id="order-td">
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>제목</td>
						<td>날짜</td>
						<td>피드백</td>
						<td>답변</td>
					</tr>
				</table>
			</form>
			</div>
			<div class="btnArea">
				<input type="button" value="글쓰기" class="submit-btn write">
				<input type="button" value="삭제" class="submit-btn delete">
			</div>
		</div>
	</div>
	
	
	<div class="footerArea">
	<%@ include file="../common/footer.jsp" %>
	</div>
</div>	<!-- mainWrapper end -->

<script>
	/* $('.dropdown').click(function () {
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


	/* $('.dropdown-menu li').click(function () {
	  var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>',
	      msg = '<span class="msg">Hidden input value: ';
	  $('.msg').html(msg + input + '</span>');
	});  */
	
	var mindate = new Date();
	    mindate.setDate(mindate.getDate() - 8);
	    
	var maxdate = new Date();
	    maxdate.setDate(maxdate.getDate() - 1);
	    
	  /* $(document).ready(function(){
		  $('#minMaxExample').datepicker({
			  	dateFormat: 'yy-mm-dd',
			    language: 'en',
					range : true,
					minDate : mindate,
			    maxDate : maxdate,
					multipleDates: true,
					multipleDatesSeparator: " - "
			});
	  }); */
	 $(function(){
		 $('#minMaxExample').datepicker({
			 
		 });
	 });
	
	</script>
	
</body>
</html>