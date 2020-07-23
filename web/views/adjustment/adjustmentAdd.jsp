<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.user.model.vo.*, java.util.*"%>
<% ArrayList<User> list = (ArrayList<User>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mine.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<!-- mainWrapper start -->
   <div id="mainWrapper">
   
      <%@ include file="../common/userMenu.jsp" %>
      
      <!-- outer start -->
      <div id="outer">
         <!-- background-box start -->
         <div id="background-box">
         
            <!-- title-area start ---------------------------------------------------------------------------->
            <div id="titleArea">
               <div id="mainTitle">정산 관리</div>
               <div id="line1"></div>
               <div id="subTitle">정산내역 등록</div>
            </div>   <!--title-area end ---------------------------------------------------------------------------->
            
            <!-- search-area start ---------------------------------------------------------------------------->
            <div id="searchArea">
               
                  <!-- searchBox start -->
                     <div id="searchBox" style="display: table; height: 250px; width:1000px; top:150px;">
                              <table id="adjustmentAddTable">
                                 <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                 </tr>
                               
                                <tr>
                                    <td></td>
                                    <td>정산월 :</td>
                                    <td><input type="month" class="InputBox2" id="month"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                 </tr>
                                  <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                 </tr>
                                 <tr>
                                    <td></td>
                                    <td>회사명 : </td>
                                    <td><input type="text" class="InputBox1" id="company"></td>
                                    <td>
                                    <div class="dropdown">
                                         <div class="select">
                                              <span>선택</span>
                                           <i class="fa fa-chevron-left"></i>
                                         </div>
                                         <ul class="dropdown-menu">
                                                   <li id="ch"></li>
                                                   <!-- <li id="">여기다가</li>
                                                   <li id="">검색한거</li>
                                                   <li id="">불러오기</li>
                                                   <li id="">불러오기</li>
                                                   <li id="">불러오기</li> -->
                                         </ul>
                                       </div>
                                    </td>
                                    <td><button class="nameSearch-btn" id="searchBtn" >검색</button></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                 </tr>
                                  <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                 </tr>
                                 <tr>
                                    <td></td>
                                    <td>정산금액 : </td>
                                    <td><input type="text" class="InputBox1" id="money"></td>
                                    <td><button onclick="" class="amountSearch-btn" id="detail">조회</button></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td colspan="2"><input type="submit" class="addBtn btn" id="addBtn" value="등록하기"></td>
                                    <td></td>
                                 </tr>
                                 <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                 </tr>
                              </table>
                     </div>
<!-- 금액 조회  모달 시작 --------------------------------------------------------------------------->
                  <!-- The Modal -->
                  <div id="myModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                      <span class="close">&times;</span>
                      ssd
					</div>
					</div>
<!-- 금액 조회 모달 끝 --------------------------------------------------------------------------->                           
                         
               </div><!-- search-area end ---------------------------------------------------------------------------->
         </div>   <!-- background-box end -->
      </div>   <!-- outer end -->
   </div>   <!-- mainWrapper end -->
                                

   


</body>


<script>
/* 옵션 선택 드롭 다운--------------------------------------------------------------------------- */
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

//회사 검색하기
$(function(){
	$("#searchBtn").click(function(){
		var company = document.getElementById("company").value;
		console.log(company);
		
		$.ajax({
			url: "<%=request.getContextPath()%>/searchCompany",
			data:{company:company},
			type:"get",
			success: function(data){
				
			},
			error: function(data){
				console.log("에러");
			}
		});
	});
});

//정산내역 등록하기
$(document).on('click', '#addBtn', function(){
	//정산월 가져오기
	var mon = document.getElementById("month").value;
	//회사명 가져오기
	var company = document.getElementById("company").value;
	//정산금액 가져오기
	var money = document.getElementById("money").value;
	
	console.log(mon);
	console.log(company);
	console.log(money);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/insertAdjustment",
		data: {mon:mon, company:company, money:money},
		type:"get",
		success:function(data){
			console.log("성공");
		},
		error:function(data){
			
		}
	});
	
});



</script>
</html>