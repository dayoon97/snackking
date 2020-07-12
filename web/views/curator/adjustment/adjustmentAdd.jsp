<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../resources/css/mine.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<!-- mainWrapper start -->
   <div id="mainWrapper">
   
      <%@ include file="../../common/menu/cmMain.jsp" %>
      
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
                        <form id="adjustmentAddForm" style="display:table-cell; vertical-align:middle">
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
                                    <td><input type="month" class="InputBox2"></td>
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
                                    <td><input type="text" class="InputBox1"></td>
                                    <td>
                                    <div class="dropdown">
                                         <div class="select">
                                              <span>선택</span>
                                           <i class="fa fa-chevron-left"></i>
                                         </div>
                                         <input type="hidden" name="">
                                         <ul class="dropdown-menu">
                                                   <li id="선택">선택</li>
                                                   <li id="">여기다가</li>
                                                   <li id="">검색한거</li>
                                                   <li id="">불러오기</li>
                                         </ul>
                                       </div>
                                    </td>
                                    <td><button onclick="" class="nameSearch-btn">검색</button></td>
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
                                    <td><input type="text" class="InputBox1"></td>
                                    <td><button onclick="" class="amountSearch-btn" id="detail">조회</button></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td colspan="2"><button class="addBtn btn" id="addBtn">등록하기</button></td>
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
                        </form>
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




</script>
</html>