<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.equipment.model.vo.Equipment, java.util.*"%>
<% ArrayList<Equipment> list = (ArrayList<Equipment>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/mine.css">

<style type="text/css">

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
				<div id="mainTitle">주문 관리</div>
				<div id="line1"></div>
				<div id="subTitle">보유 설비 관리</div>
			</div>	<!--title-area end -->
			
			<!-- search-area start -->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">설비 검색</div>
					<!-- searchBox start -->
					<div id="searchBox">
						<form id="searchForm">
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
								
									<td>설비타입  :</td>
									<td>
										<div class="dropdown"  style="width: 120px;">
											<div class="select">
												<span>선택</span>
												<i class="fa fa-chevron-left"></i>
											</div>
											<input type="hidden" name="equipType" id="equipType" value="">
											<ul class="dropdown-menu">
												<li id="">선택</li>
												<li id="소형냉장고">소형냉장고</li>
												<li id="대형냉장고">대형냉장고</li>
												<li id="소형케이스">소형케이스</li>
												<li id="대형케이스">대형케이스</li>
											</ul>
										</div>
									</td>
									
									<td>모델명 :</td>
									<td><input type="text" class="searchTextBox" size="7"  name="equipName" value=""></td>
										
									<td>제조사  :</td>										
									<td><input type="text" class="searchTextBox" size="7" name="equipMake" value=""></td>
									
									<td style="width:110px;">대여가능 여부  :</td>
									<td><input type="radio" name="possible" value="Y" id="Y"><label for="Y">Y</label>
                          				 <input type="radio" name="possible" value="N" id="N"><label for="N">N</label>
                           			</td>

									
									<td><input type="button" class="searchBtn" value="검색하기" id="submit"></td>
								
								</tr>
							</table>
						</form>
					</div> <!-- searchBox end -->
			</div>	<!-- search-area end -->
				<!-- The Modal 추가모달 --------------------------------------------------------------->
						<div id="myModal3" class="modal3">
						  <!-- Modal content -->
						  <div class="modal-content3">
						    <span class="close3">&times;</span>
						    <form>
						    <table align="center">
						    	<caption><h2>설비 추가 등록</h2></caption>
						    	<tr style="height: 20px;"></tr>
						    	<tr>
						    		<td class="right">설비타입 : </td>
                                    <td>
                                    <div class="dropdown a" style="width: 140px;">
                                         <div class="select">
                                              <span class="basic">선택</span>
                                           <i class="fa fa-chevron-left"></i>
                                         </div>
                                         <input type="hidden" name="addEquipType" value="">
                                         <ul class="dropdown-menu">
                                                   <li id="선택">선택</li>
                                                   <li id="소형냉장고">소형냉장고</li>
                                                   <li id="소형냉장고">대형냉장고</li>
                                                   <li id="소형냉장고">소형케이스</li>
                                                   <li id="소형냉장고">대형케이스</li>
                                         </ul>
                                       </div>
                                    </td>
						    	</tr>
						    	
						    	<tr style="height: 30px;"></tr>
								<tr>
									<td>모델명 :</td>
									<td><input type="text" name="addEquipName" class="add InputBox1" style="margin-right: 15px;"></td>
									<td colspan="2"></td>
								</tr>
								<tr style="height: 30px;"></tr>
								<tr>
									<td>제조사 :</td>
									<td><input type="text" name="addEquipMake" class="add InputBox1" style="margin-right: 15px;"></td>
									<td colspan="2"></td>
								</tr>
								
								<tr style="height: 30px;"></tr>
								<tr>
									<td colspan="4">
										<input type="button" class="btn1" id="addEquipmentBtn" value="등록">
									</td>
								
								</tr>
						    </table>
						    </form>
						  </div>
						</div><!-- 추가 모달----------------------------------------------- -->
			
			<!-- The Modal 수정모달--------------------------------------------------------------->
						<div id="myModal4" class="modal4">
						  <!-- Modal content -->
						  <div class="modal-content4">
						    <span class="close4">&times;</span>
						    <form>
						    <table align="center">
						    	<caption><h2>설비 정보 수정</h2></caption>
						    	<tr style="height: 20px;"></tr>
						    	<tr>
						    		<td class="right">설비타입 : </td>
                                    <td>
                                    <div class="dropdown a" style="width: 140px;">
                                         <div class="select">
                                              <span class="basic">선택</span>
                                           <i class="fa fa-chevron-left"></i>
                                         </div>
                                         <input type="hidden" name="updateEquipType" value="">
                                         <ul class="dropdown-menu">
                                                   <li id="선택">선택</li>
                                                   <li id="소형냉장고">소형냉장고</li>
                                                   <li id="소형냉장고">대형냉장고</li>
                                                   <li id="소형냉장고">소형케이스</li>
                                                   <li id="소형냉장고">대형케이스</li>
                                         </ul>
                                       </div>
                                    </td>
						    	</tr>
						    	
						    	<tr style="height: 30px;"></tr>
								<tr>
									<td>모델명 :</td>
									<td><input type="text" name="updateEquipName" class="InputBox1" style="margin-right: 15px;"></td>
									<td colspan="2"></td>
								</tr>
								<tr style="height: 30px;"></tr>
								<tr>
									<td>제조사 :</td>
									<td><input type="text" name="updateEquipMake" class="InputBox1" style="margin-right: 15px;"></td>
									<td colspan="2"></td>
								</tr>
								
								<tr style="height: 30px;"></tr>
								<tr>
									<td colspan="4">
										<input type="button" class="btn1" id="updateEquipmentBtn" value="등록">
									</td>
								
								</tr>
						    </table>
						    </form>
						  </div>
						</div><!-- 수정 모달----------------------------------------------- -->
			
			
			
			
			
			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2" style="width:120px !important;">설비 리스트</div>
					<!-- 적용 버튼 -->
					 <button id="del"  class="btn2 btnPosition3">삭제</button> 
					 <button id="update" class="btn2 btnPosition2">수정</button> 
					 <button style="display:none;" id="updateModalBtn" ></button>
					 <button id="addModalBtn" class="btn2 btnPosition1">추가</button> 
					<!-- <span id="apply">조회 결과 수 :</span> -->
					
					<!-- 조회 리스트 테이블 -->
					<table id="listTable">
						<!-- 테이블 헤드 -->
						<thead>
							<tr id="listHead">
								<th width="50px">선택</th>
								<th width="180px">설비코드</th>
								<th width="180px">설비타입</th>
								<th width="180px">모델명</th>
								<th width="180px">대여가능여부</th>
								<th width="180px">제조사</th>
							</tr>
						</thead>
						
						<tbody>
						</tbody>
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
		
	
	     
	      
	 //검색 버튼 클릭시 화면 바뀌게 하기
	$(function() {
		$(".searchBtn").click(function(){
			var equipType = $("input[name=equipType]").val();
			var equipMake = $("input[name=equipMake]").val();
			var equipName = $("input[name=equipName]").val();
			//check 된 radio 버튼
			var possible = $("input[name=possible]:checked").val();
			
			var arr = {
					"equipType" : equipType,
					"equipMake": equipMake,
					"equipName" : equipName,
					"possible" : possible
			};
			
			$.ajax({
				url: "<%=request.getContextPath()%>/selectEquipment",
				data: arr,
				type: "get",
				success: function(data){
					$tableBody = $("#listTable tbody");
					$tableBody.html('');
					$tableBody.find("tr").remove();
					
 						for(var key in data){
 							//클래스 속성 추가
 							var $tr =  $("<tr>").attr('class','listBody');
 							var $td1 = $("<td>").html('<input type="checkbox" name="chk" onclick="only(this)">');
 							var $td2 = $("<td>").text(data[key].equipCode);
 							var $td3 = $("<td>").text(data[key].equipType);
 							var $td4 = $("<td>").text(data[key].equipName);
 	 						var $td5 = $("<td>").text(data[key].possible);
 	 						var $td6 = $("<td>").text(data[key].equipMake);
 							$tr.append($td1);
 							$tr.append($td2);
 							$tr.append($td3);
 	 						$tr.append($td4);
 	 						$tr.append($td5);
 	 						$tr.append($td6);
 							$tableBody.append($tr);
 							
 						}	
 							
 						/*	var $tr = $("<tr class="listBody">");
 						
 						
 						
 						
 						}; */
 					
			
 				},
 				error: function(error){
 					console.log("에러!" + error);
 				}
			});
		});
	});  
	      
	   
	 
		function only(chk){ 
			var obj = document.getElementsByName("chk");
	        for(var i=0; i<obj.length; i++){
	            if(obj[i] != chk){
	                obj[i].checked = false;
	            }
	        }
		}
	
		//최고 관리자 설비 추가
		 $(function() {
			$("#addEquipmentBtn").click(function() {
				var newEquipType = $("input[name=addEquipType]").val();
				var newEquipMake = $("input[name=addEquipMake]").val();
				var newEquipName = $("input[name=addEquipName]").val();
				if(newEquipType == "" || newEquipType == "선택" || newEquipMake=="" || newEquipName ==""){
					alert("항목을 모두 입력해주세요");
				}else{
					var arr2 = {
							"newEquipType" : newEquipType,
							"newEquipMake": newEquipMake,
							"newEquipName" : newEquipName
					};
					$.ajax({
						url: "<%=request.getContextPath()%>/addEquipment",
						type: "get",
						data: arr2,
						success: function(data){
							console.log(data);
							$('.dropdown').find('span').text('선택');
							$("input[name=addEquipMake]").val('');
							$("input[name=addEquipName]").val('');
							alert("설비 등록에 성공하였습니다")
						},
						error: function(error){
		 					console.log("equipment 추가 실패!");
		 				}
					});
				}
			});
		});
		
	
		
		//설비 삭제
		 $(function() {
				$("#del").click(function() {
					var str = "";
					/* var num = 0;
		            var obj = document.getElementsByName("chk");
		                 for(var i=0; i<obj.length; i++){
			                  if(obj[i].checked){
			                      num = i;
			                      //td 맨 첫번째 숫서 기준이라서 두번째 설비코드값 가져와야함~!!
			                      console.log("출력  : " + num + "번 선택");
			                  }
						 } */
						 
						 /* 테이블 특정 요소 값 가져오기 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
		               var checkbox = $("input[name=chk]:checked");
						checkbox.each(function(i){
							var tr = checkbox.parent().parent().eq(i);
							var td = tr.children();
							str = td.eq(1).text();
						});
						 
					

		               console.log(str); 
		                 
	                 $.ajax({
							url: "<%=request.getContextPath()%>/deleteEquipment",
							type: "get",
							data: {"str" : str},
							success: function(data){
								alert("설비 삭제에 성공하였습니다");
								//삭제 성공하고 한번더 갔다옴. 페이지 renew 하려고
										$.ajax({
											url: "<%=request.getContextPath()%>/renewPageEquipment",
											type: "get",
											success: function(data){
												/* 다시 업데이트 해줌 */
												
												$tableBody = $("#listTable tbody");
												$tableBody.html('');
												$tableBody.find("tr").remove();
												
							 						for(var key in data){
							 							//클래스 속성 추가
							 							var $tr =  $("<tr>").attr('class','listBody');
							 							var $td1 = $("<td>").html('<input type="checkbox" name="chk" onclick="only(this)">');
							 							var $td2 = $("<td>").text(data[key].equipCode);
							 							var $td3 = $("<td>").text(data[key].equipType);
							 							var $td4 = $("<td>").text(data[key].equipName);
							 	 						var $td5 = $("<td>").text(data[key].possible);
							 	 						var $td6 = $("<td>").text(data[key].equipMake);
							 							$tr.append($td1);
							 							$tr.append($td2);
							 							$tr.append($td3);
							 	 						$tr.append($td4);
							 	 						$tr.append($td5);
							 	 						$tr.append($td6);
							 							$tableBody.append($tr);
							 							
							 						}
												
												
												
												
												
												
												
											},
											error: function(error){
							 					console.log("equipment 삭제 실패!");
							 				}
										});
								
							},
							error: function(error){
			 					console.log("equipment 삭제 실패!");
			 				}
						});   
		              
		                 
				});
			});
		
		
		
		$(function() {
			$("#update").click(function() {
				alert("업데이트 기능 구현은 차차 생각해보겠습니다.");
			});
		});
		
		
		
	//추가 버튼 작동시 모달	
			
	//Get the modal
	var modal = document.getElementById("myModal3");
	
	//Get the button that opens the modal
	var btn = document.getElementById("addModalBtn");
	
	//Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close3")[0];
	var span22 = document.getElementById("addEquipmentBtn");

	//When the user clicks on the button, open the modal
	btn.onclick = function() {
	modal.style.display = "block";
	}
	
	//When the user clicks on <span> (x), close the modal
	span22.onclick = function() {
	modal.style.display = "none";
	}	
	span.onclick = function() {
		modal.style.display = "none";
	}	
	
	
	
	
	</script>	
	

	
	
	

	
</body>
</html>