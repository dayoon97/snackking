<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.preference.model.vo.*"%>
<% Preference insertPre = (Preference) request.getAttribute("insertPre"); %>
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
	#background-box2 {
		position: relative;
		width: 1092px;
		height: 2300px;
		top: 15px;
		background: white;
		border-radius: 12px;
		margin-left: auto;
		margin-right: auto;
		background: white;
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
		width: 1000px;
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
		top: 50px;
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
		height: 2000px;
		left: 40px;
		right: 40px;
		margin: 0 auto;
		top: 190px;
		border: 1px solid black;
		box-sizing: border-box;
		border-radius: 33.5px;
	}
	/*폼 기본 서식*/
	#searchForm{
		height:95%;
		margin: 0 auto;
		padding-left:20px;
		margin-top: 100px;
	}
	/*테이블 기본 서식*/
	.memberTable, #listTable{
		width: 800px;
		margin-top: 50px;
		margin-left:  50px;
	}

	/*td 글자 스타일 지정*/
  	.memberTable>td{
		height: 30px;
		font-family: NanumSquare_ac;
		font-style: normal;
		font-weight: normal;
		font-size: 20px;
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
		width: 300px;
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
		margin-top: 50px;
		margin-left: 300px;
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
position:absolute;	
top:300px;
right:90px;
}

#listTable{
border-collapse:collapse;
position: absolute;
top:350px;
left:45px;
text-align:center;
}

.searchBtn:hover {
	cursor: pointer;
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

	<%@ include file="../common/userMenu.jsp" %>
	
	<!-- outer start -->
	<div id="outer">
		<!-- background-box start -->
		<div id="background-box2">
		
			<!-- title-area start -->
			<div id="titleArea">
				<div id="mainTitle">선호도 작성</div>
				<div id="line1"></div>
			</div>	<!--title-area end -->
			
			<!-- search-area start -->
			<div id="searchArea">
				
					<!-- searchBox start -->
					<div id="searchBox">
					<!-- 조회 제목 -->
						<div id="subSubTitle1"><h2>기본 정보 입력</h2></div>
						<br>
						<form id="searchForm" action="<%= request.getContextPath() %>/insertPer.per?pno=<%=insertPre.getPreNo() %>" method="post">
							<input type="hidden" id="userid" name="userid" value="<%=loginUser.getUserNo()%>">
							<input type="hidden" id="username" name="userName" value="<%=loginUser.getUserName()%>">
							<input type="hidden" id="username" name="predate" value="<%=insertPre.getPreDate()%>">
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td width="800px"><h4>월 간식 예산을 입력해주세요.</h4></td>
								</tr>
								<tr>
								<td>
									<input type="text" name="budget" class="" size="100" style="height:40px;" value="<%= insertPre.getPreBudget()%>">
								</td>
								</tr>
							</table>
							
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td width="800px"><h4>간식 드시는 인원은 몇 명이신가요 ?</h4></td>
								</tr>
								<tr>
								<td>
									<input type="text" name="personnel" class="" size="100" style="height:40px;" value="<%= insertPre.getPrePersonnel()%>">
								</td>
								</tr>
							</table>
							
							<div class="memberTable">
								<h4>간식을 드시는 분들의 연령 구성을 입력해주세요</h4>
								<br>
								<table>
									<tr>
										<th width="90px;">20대</th>
										<th width="70px;"></th>
										<th width="90px;">30대</th>
										<th width="70px;"></th>
										<th width="90px;">40대</th>
										<th width="70px;"></th>
										<th width="90px;">50대</th>
										<th width="70px;"></th>
										<th width="90px;">60대↑</th>
									</tr>
									<tr><% String[] age = insertPre.getPreAge().split(", "); %>
										<td><input type="text" name="age1" class="" size="8" style="height:40px;" value="<%=age[0]%>"></td>
										<td></td>
										<td><input type="text" name="age2" class="" size="8" style="height:40px;" value="<%=age[1]%>"></td>
										<td></td>
										<td><input type="text" name="age3" class="" size="8" style="height:40px;" value="<%=age[2]%>"></td>
										<td></td>
										<td><input type="text" name="age4" class="" size="8" style="height:40px;" value="<%=age[3]%>"></td>
										<td></td>
										<td><input type="text" name="age5" class="" size="8" style="height:40px;" value="<%=age[4]%>"></td>
									</tr>
								</table>
							</div>
							
							<h2 style="margin-left: 20px; font-size: 30px;">선호도 입력</h2>
							
							<div class="memberTable">
								<h4>간식 종류를 선택해주세요(중복 선택 가능)</h4>
								<br>
								<table>
									<tr >
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" id="snack" name="kinds" value="과자">
										<label for="snack">과자</label></td>
										<td width="20px;"></td>
										<td width="150px;"><input type="checkbox" id="candy" name="kinds" value="캔디/껌/초콜릿">
										<label for="candy">캔디/껌/초콜릿</label></td>
										<td width="20px;"></td>
										<td width="120px;"><input type="checkbox" id="coffee" name="kinds" value="커피/차">
										<label for="coffee">커피/차</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="beverage" name="kinds" value="음료">
										<label for="beverage">음료</label></td>
										<td width="20px;"></td>
										<td width="120px;"><input type="checkbox" id="curamen" name="kinds" value="컵라면/컵밥">
										<label for="curamen">컵라면/컵밥</label></td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>선호하는 맛을 선택해주세 (중복 선택 가능)</h4>
								<br>
								<table>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" id="sweet" name="flavor" value="달콤">
										<label for="sweet">달콤</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="salty" name="flavor" value="짭짤">
										<label for="salty">짭짤</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="plain" name="flavor" value="단백">
										<label for="plain">단백</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="sue" name="flavor" value="고소">
										<label for="sue">고소</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="sour" name="flavor" value="새콤">
										<label for="sour">새콤</label></td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>선호하는 향을 선택해주세요 (중복 선택 가능)</h4>
								<br>
								<table>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" id="banana" name="smell" value="바나나">
										<label for="banana">바나나</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="choco" name="smell" value="초코">
										<label for="choco">초코</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="soda" name="smell" value="소다">
										<label for="soda">소다</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="coffee" name="smell" value="커피">
										<label for="coffee">커피</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="cinnamon" name="smell" value="시나몬">
										<label for="cinnamon">시나몬</label></td>
									</tr>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" id="mint" name="smell" value="민트">
										<label for="mint">민트</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="grape" name="smell" value="포도">
										<label for="grape">포도</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="strawberry" name="smell" value="딸기">
										<label for="strawberry">딸기</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="peanut" name="smell" value="땅콩">
										<label for="peanut">땅콩</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="vanilla" name="smell" value="바닐라">
										<label for="vanilla">바닐라</label></td>
									</tr>
								</table>
							</div>
							
							
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td width="800px"><h4>기타 선호 향 을 입력 해주세요.</h4></td>
								</tr>
								<tr>
								<td>
									<input type="text" class="" size="100" name="freesmell" style="height:40px;" placeholder="예시: 민트">
								</td>
								</tr>
							</table>
							
							<div class="memberTable">
								<h4>알레르기 해당 사항을 선택 해주세요. (중복 선택 가능)</h4>
								<br>
								<table>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" id="wheat" name="allergy" value="밀">
										<label for="wheat">밀</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="egg" name="allergy" value="계란">
										<label for="egg">계란</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="milk" name="allergy" value="우유">
										<label for="milk">우유</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="soybean" name="allergy" value="대두">
										<label for="soybean">대두</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="crab" name="allergy" value="게">
										<label for="crab">게</label></td>
									</tr>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" id="pig" name="allergy" value="돼지고기">
										<label for="pig">돼지고기</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="peanut" name="allergy" value="땅콩">
										<label for="peanut">땅콩</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="buckwheat" name="allergy" value="메밀">
										<label for="buckwheat">메밀</label></td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" id="walnut" name="allergy" value="호두">
										<label for="walnut">호두</label></td>
										<td width="20px;"></td>
										<td width="200px;"><input type="checkbox" id="" name="allergy" value="">기타
										<label for="vanilla"><input type="text" size="10"></label></td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>선호하는 구성 스타일을 선택 해주세요.</h4>
								<br>
								<table>
									<tr>
										<td width="100px;"></td>
										<td width="90px;"><input type="checkbox" id="abundance" name="perstyle" value="풍부하게" onclick="amountclick(this);">
										<label for="abundance">풍부하게</label></td>
										<td width="100px;"></td>
										<td width="90px;"><input type="checkbox" id="advanced" name="perstyle" value="고급지게" onclick="amountclick(this);">
										<label for="advanced">고급지게</label></td>
										<td width="100px;"></td>
										<td width="90px;"><input type="checkbox" id="half" name="perstyle" value="반반" onclick="amountclick(this);">
										<label for="half">반반</label></td>
									</tr>
								</table>
							</div>

							
							<div class="memberTable">
								<h4>필요하신 설비를 선택해주세요 (예산에 따라 제공되는 설비가 달라질 수 있으며, 사전 수요 조사용 문항입니다 ) </h4>
								<br>
								<table>
									<tr>
										<td width="50px;"></td>
										<td width="200px;"><input type="checkbox" id="Box" name="equipment" value="스낵 쇼케이스(대형)">
										<label for="bBox">스낵 쇼케이스(대형)</label></td>
										<td width="40px;"></td>
										<td width="200px;"><input type="checkbox" id="Box" name="equipment" value="스낵 쇼케이스(소형)">
										<label for="sBox">스낵 쇼케이스(소형)</label></td>
										<td width="40px;"></td>
										<td width="200px;"><input type="checkbox" id="bFrige" name="equipment" value="냉장고(대형)">
										<label for="bFrige">냉장고(대형)</label></td>
										<td width="40px;"></td>
										<td width="200px;"><input type="checkbox" id="sFrige" name="equipment" value="냉장고(소형)">
										<label for="sFrige">냉장고(소형)</label></td>
										<td></td>
									</tr>
									
									<tr>
										<td></td>
										<td colspan="2"><img src="<%=request.getContextPath()%>/resources/image/snack_big.png"></td>
										
										<td colspan="2"><img src="<%=request.getContextPath()%>/resources/image/snack_small.png"></td>
										
										<td colspan="2"><img src="<%=request.getContextPath()%>/resources/image/refrigerator_big.png"></td>
										
										<td colspan="2"><img src="<%=request.getContextPath()%>/resources/image/refrigerator_small.png"></td>
									</tr>
								</table>
							</div>
						</form>
						<input class="searchBtn" type="button" onclick="update();" value="저장하기">
					</div> <!-- searchBox end -->
			</div>	<!-- search-area end -->
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

<script type="text/javascript">

$(function(){
	var ProductTypes = '<%=insertPre.getPreProductTypes()%>'.split(",");
	var flavor = '<%=insertPre.getPreTaste()%>'.split(",");
	var smell = '<%=insertPre.getPreFlavor()%>'.split(",");
	var allergy = '<%=insertPre.getPreAlName()%>'.split(",");
	var perstyle = '<%=insertPre.getPreStyle()%>'.split(",");
	var equipment = '<%=insertPre.getPreEquipment()%>'.split(",");
	
	$("input[name=kinds]").each(function(){ //상품 종류
		for(var i = 0; i < ProductTypes.length; i++){
			if($(this).val() === ProductTypes[i]){
				$(this).attr("checked", true);
				
			} 
		}
	});
	
	$("input[name=flavor]").each(function(){ //맛
		for(var i = 0; i < flavor.length; i++){
			if($(this).val() === flavor[i]){
				$(this).attr("checked", true);
			} 
		}
	});
	
	$("input[name=smell]").each(function(){ //향
		for(var i = 0; i < smell.length; i++){
			if($(this).val() === smell[i]){
				$(this).attr("checked", true);
			} 
		}
	});
	
	$("input[name=allergy]").each(function(){ //알레르기
		for(var i = 0; i < allergy.length; i++){
			if($(this).val() === allergy[i]){
				$(this).attr("checked", true);
			} 
		}
	});
	
	$("input[name=perstyle]").each(function(){ //구성스타일
		for(var i = 0; i < perstyle.length; i++){
			if($(this).val() === perstyle[i]){
				$(this).attr("checked", true);
			} 
		}
	});
	
	$("input[name=equipment]").each(function(){ //설비
		for(var i = 0; i < equipment.length; i++){
			if($(this).val() === equipment[i]){
				$(this).attr("checked", true);
			} 
		}
	});
});
function amountclick(am){
    var obj = document.getElementsByName("perstyle");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != am){
            obj[i].checked = false;
        }
    }
}


function update(){
	
	$("#searchForm").submit();
}

</script>

	
</body>
</html>