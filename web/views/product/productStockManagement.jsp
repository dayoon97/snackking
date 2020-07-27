<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.product.model.vo.*, java.util.*"%>
<% ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mine.css">

<style type="text/css">
#apply{
	position:absolute;	
	top:300px !important;
	right:220px !important;
	}

#searchStock{
	margin-top: 10px;
}
</style>

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
				<div id="mainTitle">상품 관리</div>
				<div id="line1"></div>
				<div id="subTitle">상품 재고 확인</div>
			</div>	<!--title-area end ---------------------------------------------------------------------------->
			
			<!-- search-area start ---------------------------------------------------------------------------->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">재고 조회</div>
					<!-- searchBox start -->
						<div id="searchBox" style="height: 90px !important; display: table;">
								<div>
								<table id="searchStock" class="left">
									<tr style="height:34px !important;">
										<!-- 검색 내용 타이핑하는 부분 -->	
										<td>매입처  :
											<input type="text" class="searchTextBox" size="6" name="proCom">
										</td>
										<td>상품종류  :
										<div class="dropdown">
        										<div class="select">
          											<span id="ptSelect">선택</span>
										          <i class="fa fa-chevron-left"></i>
										        </div>
										        <input type="hidden" name="productKinds">
										        <ul class="dropdown-menu">
							                           <li id="선택">선택</li>
							                           <li id="과자">과자</li>
							                           <li id="캔디/껌/초콜릿">캔디/껌/초콜릿</li>
							                           <li id="커피/차">커피/차</li>					                         
							                           <li id="음료">음료</li>
							                           <li id="컵라면/컵밥">컵라면/컵밥</li>
							                           <li id="케이크">케이크</li>  
										        </ul>
										      </div>
                        				</td>	
										<td style="width:150px">상품명  :
											<input type="text" class="searchTextBox" size="6" name="proCom">
										</td>
										<!-- <td><input type="checkbox" class="a">재고없는 상품 조회</td> -->
									</tr>
									<tr>	
										<td style="width:170px">상품코드  :
											<input type="text" class="searchTextBox" size="6" name="proCom">
										</td>
                       					<td colspan="2">수량검색 :
										             					
                       						<input type="text" class="searchTextBox" size="3" name="proCom">&nbsp;&nbsp;~&nbsp;&nbsp;
                       						<input type="text" class="searchTextBox" size="3" name="proCom">&nbsp;&nbsp;개
                        				</td>
										<td rowspan="2"><input type="submit" class="searchBtn" value="검색하기" id="searchBtn" style="float: right;"></td>
									</tr>
								</table>
							</div>
					</div>
				</div><!-- search-area end ---------------------------------------------------------------------------->


			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					
					<div id="subSubTitle2" style="top:310px !important;">재고 리스트</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
					<!-- <span id="apply" style="top:310px !important;">조회 결과 수 :</span> -->
					<!-- <input type="button" class="addBtn btn-position" id="addModalBtn" value="추가요청"> -->
					
						<!-- The Modal -->
						<div id="myModal2" class="modal2">
						  <!-- Modal content -->
						  <div class="modal-content2">
						    <span class="close2">&times;</span>
						    <table align="center">
						    	<caption><h2>재고 발주 요청</h2></caption>
						    	<tr style="height: 20px;"></tr>
						    	<tr>
						    		<td class="right">상품명 : </td>
                                    <td><input type="text" class="InputBox3"></td>
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
                                                   <li id="">상품명</li>
                                                   <li id="">검색한거</li>
                                                   <li id="">불러오기</li>
                                         </ul>
                                       </div>
                                    </td>
                                    <td><button onclick="" class="nameSearch-btn">검색</button></td>
						    	</tr>
						    	
						    	<tr style="height: 30px;"></tr>
								<tr>
									<td>요청 수량 :</td>
									<td><input type="text" class="InputBox1" style="margin-right: 15px;">개</td>
									<td colspan="2"></td>
								</tr>
								
								<tr style="height: 30px;"></tr>
								<!-- <tr>
									<td colspan="4">
										<input type="button" class="btn1" id="amountRequestBtn" value="수량 요청하기">
									</td>
								
								</tr> -->
						    </table>
						  </div>
						</div>
					
					
					
						<!-- 테이블 시작 -->
						<!-- 조회 리스트 테이블 -->
					<table id="listTable5" align="center">
						<thead>
							<!-- 테이블 헤드 -->
							<tr id="listHead" >
								<th>상품코드</th>
								<th>상품종류</th>
								<th>상품명</th>
								<th>매입처</th>
								<th>총수량</th>
								
							</tr>
						</thead>
						<tbody>
						<% for(Product p : list) { %>
						<!-- 리스트 바디  -->
							<tr class="hover">
								<td><%=p.getpCode() %></td>
								<td>
								<%if(p.getPtCode().equals("PT1")) {%>
									과자
								<% } else if(p.getPtCode().equals("PT2")){ %>
									캔디/껌/초콜릿
								<% } else if(p.getPtCode().equals("PT3")){ %>
									커피/차
								<% } else if(p.getPtCode().equals("PT4")){ %>
									음료
								<% } else if(p.getPtCode().equals("PT5")){ %>
									컵라면/컵밥
								<% } else if(p.getPtCode().equals("PT6")){ %>
									케이크
								<% } %>
								</td>
								<td><%=p.getpName() %></td>
								<td><%=p.getpVendor() %></td>
								<td><%=p.getTotal() %></td>
							</tr>
							
						<% } %>
						</tbody>
					</table>
					<!-- 테이블 끝 -->
			
			
			
				</div>
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

</body>


<script>

	
	/* 옵션 선택 드롭 다운 */
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


	
	//검색ajax
	$(document).on('click', '#searchBtn', function(){
		var prCom = document.getElementsByName("proCom")[0].value;
		var prSelect = $('#ptSelect').eq(0).text();
		var prName = document.getElementsByName("proCom")[1].value;
		var prCode = document.getElementsByName("proCom")[2].value;
		var prnum1 = document.getElementsByName("proCom")[3].value;
		var prnum2 = document.getElementsByName("proCom")[4].value;
		
		console.log(prCom);
		console.log(prSelect);
		console.log(prName);
		console.log(prCode);
		console.log(prnum1);
		console.log(prnum2);
		
		
		 $.ajax({
			url: "<%=request.getContextPath()%>/searchProductStock",
			data: {prCom:prCom, prSelect:prSelect, prName:prName, prCode:prCode, prnum1:prnum1, prnum2:prnum2},
			type: "get",
			success: function(data){
				
				console.log("성공");
				 $tableBody = $("#listTable5 tbody");
					
					$tableBody.html('');
					
					for(var key in data) {
						var $tr = $("<tr>");
						var $prComTd = $("<td>").text(data[key].prCom);
						var $prSelectTd = $("<td>").text(data[key].prSelect);
						var $prNameTd = $("<td>").text(data[key].prName);
						var $prCodeTd = $("<td>").text(data[key].prCode);
						var $tatalTd = $("<td>").text(data[key].total);
						
						var pro;
						if(data[key].prSelect == "PT1"){
							pro = "과자";
						} else if (data[key].prSelect == "PT2"){
							pro = "캔디/껌/초콜릿";
						} else if (data[key].prSelect == "PT3"){
							pro = "커피/차";
						} else if (data[key].prSelect == "PT4"){
							pro = "음료";
						} else if (data[key].prSelect == "PT5"){
							pro = "컵라면/컵밥";
						} else if (data[key].prSelect == "PT6"){
							pro = "케이크";
						}
						
						$prSelectTd = $("<td>").text(pro);
						
						
						$tr.append($prComTd);
						$tr.append($prSelectTd);
						$tr.append($prNameTd);
						$tr.append($prCodeTd);
						$tr.append($tatalTd);
				
						$tr.append($tr).css({"border-bottom":"3px solid #EBEAEA", "height" : "36px"});
						
						$tableBody.append($tr);
					};  
					
					
				},
				error: function(data){
					console.log("에러!");
				}
			
			
		}); 
		
	});



</script>


</html>