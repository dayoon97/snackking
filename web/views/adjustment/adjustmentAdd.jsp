<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/mine.css">

</head>
<body>
<!-- mainWrapper start -->
	<div id="mainWrapper">
	
		<%@ include file="../common/cmMain.jsp" %>
		
		<!-- outer start -->
		<div id="outer">
			<!-- background-box start -->
			<div id="background-box">
			
				<!-- title-area start ---------------------------------------------------------------------------->
				<div id="titleArea">
					<div id="mainTitle">정산 관리</div>
					<div id="line1"></div>
					<div id="subTitle">정산내역 등록</div>
				</div>	<!--title-area end ---------------------------------------------------------------------------->
				
				<!-- search-area start ---------------------------------------------------------------------------->
				<div id="searchArea">
					
						<!-- searchBox start -->
							<div id="searchBox" style="display: table; height: 500px; width:1000px; top:150px;">
								<form id="adjustmentAddForm" style="display:table-cell; vertical-align:middle">
			   						<table id="adjustmentAddTable" border="1" style="text-align:left !important;">
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
			   								<td><input type="text" class="InputBox1" size="6" name=""></td>
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
					</div><!-- search-area end ---------------------------------------------------------------------------->
			</div>	<!-- background-box end -->
		</div>	<!-- outer end -->
	</div>	<!-- mainWrapper end -->


	
									<table id="searchStock" style="align:center;">
										<tr>
											<!-- 검색 내용 타이핑하는 부분 -->	
											<td style="width:200px !important;">회사명  :
											</td>
									
		
											<td style="width:240px">정산월  :
												<input type="month" class="searchTextBox" size="6" name=""></td>
											
	                       					
											<td style="width:220px">결제여부  :
											<div class="dropdown">
	        										<div class="select">
	          											<span>선택</span>
											          <i class="fa fa-chevron-left"></i>
											        </div>
											        <input type="hidden" name="">
											        <ul class="dropdown-menu">
								                           <li id="선택">선택</li>
								                           <li id="미지급">미지급</li>
								                           <li id="지급">지급</li>
											        </ul>
											      </div>
	                        				</td>
	
											<td><input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="float: right;"></td>
										</tr>
									</table>   


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


//등록 모달
// Get the modal
   var modal = document.getElementById("myModal");
   
   // Get the button that opens the modal
   var btn = document.getElementById("detail");

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


 //모달 시작
// Get the modal
   var modal2 = document.getElementById("addModal");
   
   // Get the button that opens the modal
   var btn2 = document.getElementById("addModalBtn");

   // Get the <span> element that closes the modal
   var span2 = document.getElementsByClassName("close2")[0];

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
   
   
   
   


</script>
</html>