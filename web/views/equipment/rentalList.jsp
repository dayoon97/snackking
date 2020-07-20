<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.equipment.model.vo.EquipmentRent, java.util.*"%>
<% ArrayList<EquipmentRent> list = (ArrayList<EquipmentRent>) request.getAttribute("list"); %>
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
				<div id="subTitle">대여 설비 정보</div>
			</div>	<!--title-area end -->
			
			<!-- search-area start -->
			<div id="searchArea">
				<!-- 조회 제목 -->
				<div id="subSubTitle1">대여내역 검색</div>
					<!-- searchBox start -->
					<div id="searchBox">
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td>대여일  :</td>
									<td><input type="date" class="searchTextBox" size="7" name="rentDate"></td>
																		
									<td>대여 회사명  :</td>
									<td><input type="text" class="searchTextBox" size="7" name="company"></td>
									
									
									<td>설비코드  :</td>										
									<td><input type="text" class="searchTextBox" size="7" name="equipCode"></td>
									
									<td style="width:90px;">회수 여부  :</td>
									<td><input type="radio" name="backOk" value="Y" id="Y"><label for="Y">Y</label>
                          				 <input type="radio" name="backOk" value="N" id="N"><label for="N">N</label>
                           			</td>
                           			
									<td><button class="searchBtn">검색하기</button></td>
									

								
								
								</tr>
							</table>
					</div> <!-- searchBox end -->
			</div>	<!-- search-area end -->
			
			<!-- 조회 결과 리스트 부분 -->
				<div id="listArea">
					<!-- 조회 결과 리스트 제목 -->
					<div id="subSubTitle2" style="width:120px;">대여내역 조회</div>
					<!-- 적용 버튼 -->
					<!-- <button onclick="" class="btn" id="apply">적용</button> -->
			
					<!-- 조회 리스트 테이블 -->
					<table id="listTable">
						<!-- 테이블 헤드 -->
						<thead>
							<tr id="listHead">
								<th width="40px">순번</th>
								<th width="80px">대여일</th>
								<th width="80px">회수일</th>
								<th width="100px">설비코드</th>
								<th width="100px">설비타입</th>
								<th width="100px">모델명</th>
								<th width="60px">제조사</th>
								<th width="60px">대여 회사명</th>
							
							</tr>
						</thead>
						<tbody>	
						<!-- 리스트 바디  -->
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
	
	      
		
		
		
		
	//검색 버튼 클릭시 내용 조회하기
$(function() {
		$(".searchBtn").click(function(){
			var rentDate = $("input[name=rentDate]").val();
			var equipCode = $("input[name=equipCode]").val();
			var company = $("input[name=company]").val();
			//check 된 radio 버튼
			var backOk = $("input[name=backOk]:checked").val();
			var rent = {
					"rentDate" : rentDate,
					"equipCode": equipCode,
					"company" : company,
					"backOk" : backOk
			};
			//console.log(array);
			//출력됨
				$.ajax({
					url: "<%=request.getContextPath()%>/equipmentRentSelect",
					data: rent,
					type: "get",
					success: function(data){
						$tableBody = $("#listTable tbody");
						$tableBody.html('');
						$tableBody.find("tr").remove();
						
						
						
						var num = 1;
						
	 						for(var key in data){
	 							var $tr =  $("<tr>").attr('class','listBody');
	 							var $td1 = $("<td>").text(num);
	 							num += 1;
	 							var backDate = "";
	 							if((data[key].backDate)==('9999-12-31')){
	 								backDate = "미회수";
	 							}else{
	 								backDate = data[key].backDate;
	 							}
	 							
	 							var $td2 = $("<td>").text(data[key].rentDate);
	 							var $td3 = $("<td>").text(backDate);
	 							var $td4 = $("<td>").text(data[key].equipCode);
	 	 						var $td5 = $("<td>").text(data[key].equipType);
	 	 						var $td6 = $("<td>").text(data[key].equipName);
	 	 						var $td7 = $("<td>").text(data[key].equipMake);
	 							var $td8 = $("<td>").text(data[key].company);
	 							$tr.append($td1);
	 							$tr.append($td2);
	 	 						$tr.append($td3);
	 	 						$tr.append($td4);
	 	 						$tr.append($td5);
	 	 						$tr.append($td6);
	 	 						$tr.append($td7);
	 	 						$tr.append($td8);
	 							$tableBody.append($tr);
	 						}	 
	 				},
	 				
	 				
	 				error: function(error){
	 					console.log("에러!" + error);
	 				}
				});
			});
		});

		
	</script>	
	
</body>
</html>