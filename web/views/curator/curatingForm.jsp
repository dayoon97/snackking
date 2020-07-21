<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.snackking.preference.model.vo.Preference, com.kh.snackking.product.model.vo.Product, java.util.*"%>
<% Preference insertPre = (Preference) request.getAttribute("insertPre"); 
	ArrayList<Product> Product = (ArrayList<Product>) request.getAttribute("Product");
%>


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
		height: 2600px;
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
		height: 880px;
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
		margin-top: 20px;
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
		margin-top: 80px;
		margin-left: 300px;
	}

/*조회 결과 리스트 제목 스타일*/
#subSubTitle2{
position: absolute;
width: 980px;
height: 500px;
top: 900px;
font-family: NanumSquare_ac;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 20px;
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
text-align:center;
width: 900px;
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

.searchBtn:hover {
	cursor: pointer;
}

/* drowBox Css end */
#mainWrapper {
	margin-left: auto;
	margin-right: auto;
	display: table;
}

#snackList{
	width: 980px;
	height: 500px;
	background: white;
	border: 1px solid black;
		border-radius: 33.5px;
}

#productList{
	width: 980px;
	height: 500px;
	background: white;
	border: 1px solid black;
	border-radius: 33.5px;
	margin-top: 50px;
}
</style>

<script>
function amountclick(am){
    var obj = document.getElementsByName("perstyle");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != am){
            obj[i].checked = false;
        }
    }
}

function deliveryclick(de){
    var obj = document.getElementsByName("delivery");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != de){
            obj[i].checked = false;
        }
    }
}
function packingclick(pack){
    var obj = document.getElementsByName("packing");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != pack){
            obj[i].checked = false;
        }
    }
}

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
</script>
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
				<div id="mainTitle">큐레이팅 등록</div>
				<div id="line1"></div>
			</div>	<!--title-area end -->
			
			<!-- search-area start -->
			<div id="searchArea">
				
					<!-- searchBox start -->
					<div id="searchBox">
					<!-- 조회 제목 -->
						<div id="subSubTitle1"><h2>선호도 입력 정보</h2></div>
						<form id="searchForm" action="<%= request.getContextPath() %>/curatingSelectProduct.pro" method="post">
							<%-- <input type="hidden" id="userid" name="userid" value="<%=loginUser.getUserNo()%>">
							<input type="hidden" id="username" name="userName" value="<%=loginUser.getUserName()%>"> --%>
							<input type="hidden" id="userNo" name="userNo" value="<%=insertPre.getUserNo()%>">
							<input type="hidden" id="preNo" name="preNo" value="<%=insertPre.getPreNo()%>">
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td width="110px"><h4>예산</h4></td>
									<td>
										<input type="text" name="budget" class="" size="80" style="height:40px;" value="<%= insertPre.getPreBudget() %>" placeholder="예시: 500000">
									</td>
								</tr>
							</table>
							
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td width="110px"><h4>인원</h4></td>
									<td>
										<input type="text" name="personnel" class="" size="80" style="height:40px;" value="<%= insertPre.getPrePersonnel() %>" placeholder="예시: 500000">
									</td>
								</tr>
							</table>
							
							<div class="memberTable">
								<table>
									<tr>
										<th rowspan="2" width="100px">연령대</th>
										<th width="90px;">20대</th>
										<th width="50px;"></th>
										<th width="90px;">30대</th>
										<th width="50px;"></th>
										<th width="90px;">40대</th>
										<th width="50px;"></th>
										<th width="90px;">50대</th>
										<th width="50px;"></th>
										<th width="90px;">60대↑</th>
									</tr>
									<tr><% String[] age = insertPre.getPreAge().split(", "); %>
										<td><input type="text" name="age1" class="" size="8" style="height:40px;" value="<%=age[0]%>" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="age2" class="" size="8" style="height:40px;" value="<%=age[1]%>" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="age3" class="" size="8" style="height:40px;" value="<%=age[2]%>" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="age4" class="" size="8" style="height:40px;" value="<%=age[3]%>" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="age5" class="" size="8" style="height:40px;" value="<%=age[4]%>" placeholder="                %"></td>
									</tr>
								</table>
							</div>
							
							
							<div class="memberTable">
								<br>
								<table>
									<tr >
										<td><b>간식 종류</b></td>
										<td width="40px;"></td>
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
								<br>
								<table>
									<tr>
										<td><b>상품 맛</b></td>
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
								<br>
								<table>
									<tr>
										<td rowspan="2"><b>상품 향</b></td>
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
									<td width="110px"><h4>기타 향</h4></td>
									<td>
										<input type="text" class="" size="80" name="freesmell" style="height:40px;" value="<%=insertPre.getPreEtcFlavor() %>" placeholder="예시: 민트">
									</td>
								</tr>
							</table>
							
							<div class="memberTable">
								<br>
								<table>
									<tr>
										<td rowspan="2"><b>알레르기</b></td>
										<td width="30px;"></td>
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
								<br>
								<table>
									<tr>
										<td><b>구성 스타일</b></td>
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
						</form>
					
			<div id="subSubTitle2"><!-- 과자 리스트 -->
				
				<!-- 조회 리스트 테이블 -->
				<div id="snackList">
				<br>
				<h3 style="margin-left: 50px;">과자 리스트</h3>
               <table id="listTable" class="snackTable">
                  <!-- 테이블 헤드 -->
                  <tr id="listHead">
                     <th width="130px">상품코드</th>
                     <th width="70px">상품명</th>
                     <th width="70px">업체명</th>
                     <th width="150px">상품 종류</th>
                     <th width="150px">상품 맛</th>
                     <th width="150px">상품 향</th>
                     <th width="150px">알레르기</th>
                     <th width="50px">갯수</th>
                     <th width="50px">가격</th>
                     <th width="50px">추가</th>
                  </tr>
                 
                  <!-- 리스트 바디  -->
                  <tbody id="tbody">
 				<% for(Product n : Product) { %>
                  <tr class="listBody">
						<td><%= n.getpCode() %></td>
						<td><%= n.getpName() %></td>
						<td><%= n.getpVendor() %></td>
						<td><%= n.getPtName() %></td>
						<td><%= n.getTaste()%></td>
						<td><%= n.getFlavor() %></td>
						<td><%= n.getAllergy() %></td>
						<td></td>
						<td><%= n.getPrice() %></td>
						<td><button id="proAdd" value="<%= n.getpCode() %>" >추가</button></td>
					</tr>
				<%} %>
				</tbody>
               </table>
                </div>
                
                
                
                
                <div id="productList"> <!-- 큐레이팅  등록 -->
                <br>
				<h3 style="margin-left: 50px;">상품 선택 리스트</h3>
               <table id="listTable">
                  <!-- 테이블 헤드 -->
                  <tr id="listHead">
                     <th width="100px">상품코드</th>
                     <th width="70px">상품명</th>
                     <th width="150px">상품 종류</th>
                     <th width="150px">상품 맛</th>
                     <th width="150px">상품 향</th>
                     <th width="150px">알레르기</th>
                     <th width="50px">갯수</th>
                  </tr>
                 
                  <!-- 리스트 바디  -->
<%-- 				<% for(Preference n : List) { %>
                  <tr class="listBody">
						<td><input type="checkbox"></td>
						<td><%= n.getPreNo() %></td>
						<td><%= n.getUserCom() %></td>
						<td><%= n.getUserName()%></td>
						<td><%= n.getPreDate() %></td>
						<td><%= n.getStatus() %></td>
						<td><a href="<%=request.getContextPath()%>/selectDetail.pre?num=<%=n.getPreNo()%>"><img src="/snackkking/resources/image/search.png" width="15px" alt="My Image"></a></td>
						<td><button onclick="location.href='<%= request.getContextPath()%>/delicatePre.pre?num=<%=n.getPreNo()%>'">삭제</button></td>
					</tr>
				<%} %> --%>
               </table>
                </div>
                
						
						</div>
					</div> <!-- searchBox end -->
			</div>	<!-- search-area end -->
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

<script type="text/javascript">


function preference(){
	var userId = $("#userid").val();
	
	console.log(userId);
	
	$("#searchForm").submit();
}

$(function(){
	
	var preNo = $("#preNo").val();
	var userNo = $("#userNo").val();
	console.log(preNo);
	console.log(userNo);
	//상품 체크하면 리스트 바뀌는 구문
	$("input[name=kinds]").click(function(){
		var kinds = "";
		var flavor = "";
		var smell = "";
		var allergy = "";
		if( $(this).prop("checked")){
			$("input[name=kinds]:checked").each(function() { 
				kinds += $(this).val() + ","; 
			});// 과자 종류
		}else{
			$("input[name=kinds]:checked").each(function() { 
				kinds += $(this).val() + ","; 
			});// 과자 종류
		}
		
		if( $(this).prop("checked")){
			$("input[name=flavor]:checked").each(function() { 
				flavor += $(this).val() + ","; 
			});// 맛
		}else{
			$("input[name=flavor]:checked").each(function() { 
				flavor += $(this).val() + ","; 
			});// 맛
		}
		
		if( $(this).prop("checked")){
			$("input[name=smell]:checked").each(function() { 
				smell += $(this).val() + ","; 
			});// 향
		}else{
			$("input[name=smell]:checked").each(function() { 
				smell += $(this).val() + ","; 
			});// 향
		}
		
		if( $(this).prop("checked")){
			$("input[name=allergy]:checked").each(function() { 
				allergy += $(this).val() + ",";
			});// 향
		}else{
			$("input[name=allergy]:checked").each(function() { 
				allergy += $(this).val() + ",";
			});// 향
		}
		
		
		$.ajax({
			url: "curatingSelectProduct.pro",
			data: {kinds:kinds, flavor:flavor, smell:smell, allergy:allergy, preNo:preNo, userNo:userNo},
			success:function(data){
				
				console.log(data);
				$tableBody = $(".snackTable #tbody");
				$tableBody.html('');
				
				$.each(data, function(index, value){
					
					var $tr = $("<tr>").attr('class', 'listBody');
					var $pCodeTd = $("<td>").text(decodeURIComponent(value.pCode)); //상품 코드
					var $pNameTd = $("<td>").text(decodeURIComponent(value.pName)); //상품명
					var $ptNameTd = $("<td>").text(decodeURIComponent(value.ptName)); //상품 종류명
					var $pVendorTd = $("<td>").text(decodeURIComponent(value.pVendor)); //업체명
					var $priceTd = $("<td>").text(decodeURIComponent(value.price)); //가격
					var $taste = $("<td>").text(decodeURIComponent(value.taste)); //맛
					var $flavor = $("<td>").text(decodeURIComponent(value.flavor)); //향
					var $allergy = $("<td>").text(decodeURIComponent(value.allergy)); //알레르기
					var $CountTd = $("<td>"); //개수
					
					
					var $button = $("<button>").attr('id','proAdd').html("추가");
					$button.val(decodeURIComponent(value.pCode));
					var $inputTd = $("<td>");
					$inputTd.append($button);
					
					$tr.append($pCodeTd);
					$tr.append($pNameTd);
					$tr.append($pVendorTd);
					$tr.append($ptNameTd);
					$tr.append($taste);
					$tr.append($flavor);
					$tr.append($allergy);
					$tr.append($CountTd);
					$tr.append($priceTd);
					$tr.append($inputTd);
					$tableBody.append($tr);
					
						if(){
							$("#proAdd").click(function(){
								$.ajax({
									url: "curatingBasket.pro",
									data: {proCode:$("#proAdd").val()},
									success:function(data){
										console.log("성공");
										console.log(data);
								
									},
									error:function(){
										console.log("실패!");
									}
								});	
							});
						}
					
				});
				
				
				/* 
				$.each(data, function(index, value){
					var $tr = $("<tr>");
					var $noTd = $("<td>").text(value.userNo);
					var $nameTd = $("<td>").text(decodeURIComponent(value.userName));
					var $nationTd = $("<td>").text(decodeURIComponent(value.userNation)); */
				
				console.log("성공!");
			},
			error:function(){
				console.log("실패!");
			}
		});
		
	});
	
	$("input[name=flavor]").click(function(){
		var kinds = "";
		var flavor = "";
		var smell = "";
		var allergy = "";
		if( $(this).prop("checked")){
			$("input[name=kinds]:checked").each(function() { 
				kinds += $(this).val() + ","; 
			});// 과자 종류
		}else{
			$("input[name=kinds]:checked").each(function() { 
				kinds += $(this).val() + ","; 
			});// 과자 종류
		}
		
		if( $(this).prop("checked")){
			$("input[name=flavor]:checked").each(function() { 
				flavor += $(this).val() + ","; 
			});// 맛
		}else{
			$("input[name=flavor]:checked").each(function() { 
				flavor += $(this).val() + ","; 
			});// 맛
		}
		
		if( $(this).prop("checked")){
			$("input[name=smell]:checked").each(function() { 
				smell += $(this).val() + ","; 
			});// 향
		}else{
			$("input[name=smell]:checked").each(function() { 
				smell += $(this).val() + ","; 
			});// 향
		}
		
		if( $(this).prop("checked")){
			$("input[name=allergy]:checked").each(function() { 
				allergy += $(this).val() + ",";
			});// 향
		}else{
			$("input[name=allergy]:checked").each(function() { 
				allergy += $(this).val() + ",";
			});// 향
		}
		
		
		$.ajax({
			url: "curatingSelectProduct.pro",
			data: {kinds:kinds, flavor:flavor, smell:smell, allergy:allergy, preNo:preNo, userNo:userNo},
			success:function(data){

				console.log(data);
				$tableBody = $(".snackTable #tbody");
				$tableBody.html('');
				
				$.each(data, function(index, value){
					
					var $tr = $("<tr>").attr('class', 'listBody');
					var $pCodeTd = $("<td>").text(decodeURIComponent(value.pCode)); //상품 코드
					var $pNameTd = $("<td>").text(decodeURIComponent(value.pName)); //상품명
					var $ptNameTd = $("<td>").text(decodeURIComponent(value.ptName)); //상품 종류명
					var $pVendorTd = $("<td>").text(decodeURIComponent(value.pVendor)); //업체명
					var $priceTd = $("<td>").text(decodeURIComponent(value.price)); //가격
					var $taste = $("<td>").text(decodeURIComponent(value.taste)); //맛
					var $flavor = $("<td>").text(decodeURIComponent(value.flavor)); //향
					var $allergy = $("<td>").text(decodeURIComponent(value.allergy)); //알레르기
					var $CountTd = $("<td>"); //개수
					
					var $inputTd = $("<td>").html("<input type='button' value='추가' id='proAdd'>");
					
					$tr.append($pCodeTd);
					$tr.append($pNameTd);
					$tr.append($pVendorTd);
					$tr.append($ptNameTd);
					$tr.append($taste);
					$tr.append($flavor);
					$tr.append($allergy);
					$tr.append($CountTd);
					$tr.append($priceTd);
					$tr.append($inputTd);
					$tableBody.append($tr);
					
					
				});
			},
			error:function(){
				console.log("실패!");
			}
		});
		
	});
	

	$("input[name=smell]").click(function(){
		var kinds = "";
		var flavor = "";
		var smell = "";
		var allergy = "";
		if( $(this).prop("checked")){
			$("input[name=kinds]:checked").each(function() { 
				kinds += $(this).val() + ","; 
			});// 과자 종류
		}else{
			$("input[name=kinds]:checked").each(function() { 
				kinds += $(this).val() + ","; 
			});// 과자 종류
		}
		
		if( $(this).prop("checked")){
			$("input[name=flavor]:checked").each(function() { 
				flavor += $(this).val() + ","; 
			});// 맛
		}else{
			$("input[name=flavor]:checked").each(function() { 
				flavor += $(this).val() + ","; 
			});// 맛
		}
		
		if( $(this).prop("checked")){
			$("input[name=smell]:checked").each(function() { 
				smell += $(this).val() + ","; 
			});// 향
		}else{
			$("input[name=smell]:checked").each(function() { 
				smell += $(this).val() + ","; 
			});// 향
		}
		
		if( $(this).prop("checked")){
			$("input[name=allergy]:checked").each(function() { 
				allergy += $(this).val() + ",";
			});// 향
		}else{
			$("input[name=allergy]:checked").each(function() { 
				allergy += $(this).val() + ",";
			});// 향
		}
		
		
		$.ajax({
			url: "curatingSelectProduct.pro",
			data: {kinds:kinds, flavor:flavor, smell:smell, allergy:allergy, preNo:preNo, userNo:userNo},
			success:function(data){

				console.log(data);
				$tableBody = $(".snackTable #tbody");
				$tableBody.html('');
				
				$.each(data, function(index, value){
					
					var $tr = $("<tr>").attr('class', 'listBody');
					var $pCodeTd = $("<td>").text(decodeURIComponent(value.pCode)); //상품 코드
					var $pNameTd = $("<td>").text(decodeURIComponent(value.pName)); //상품명
					var $ptNameTd = $("<td>").text(decodeURIComponent(value.ptName)); //상품 종류명
					var $pVendorTd = $("<td>").text(decodeURIComponent(value.pVendor)); //업체명
					var $priceTd = $("<td>").text(decodeURIComponent(value.price)); //가격
					var $taste = $("<td>").text(decodeURIComponent(value.taste)); //맛
					var $flavor = $("<td>").text(decodeURIComponent(value.flavor)); //향
					var $allergy = $("<td>").text(decodeURIComponent(value.allergy)); //알레르기
					var $CountTd = $("<td>"); //개수
					
					var $inputTd = $("<td>").html("<input type='button' value='추가' id='proAdd'>");
					
					$tr.append($pCodeTd);
					$tr.append($pNameTd);
					$tr.append($pVendorTd);
					$tr.append($ptNameTd);
					$tr.append($taste);
					$tr.append($flavor);
					$tr.append($allergy);
					$tr.append($CountTd);
					$tr.append($priceTd);
					$tr.append($inputTd);
					$tableBody.append($tr);
					
					
				});
			},
			error:function(){
				console.log("실패!");
			}
		});
		
	});
	
	$("input[name=allergy]").click(function(){
		var kinds = "";
		var flavor = "";
		var smell = "";
		var allergy = "";
		if( $(this).prop("checked")){
			$("input[name=kinds]:checked").each(function() { 
				kinds += $(this).val() + ","; 
			});// 과자 종류
		}else{
			$("input[name=kinds]:checked").each(function() { 
				kinds += $(this).val() + ","; 
			});// 과자 종류
		}
		
		if( $(this).prop("checked")){
			$("input[name=flavor]:checked").each(function() { 
				flavor += $(this).val() + ","; 
			});// 맛
		}else{
			$("input[name=flavor]:checked").each(function() { 
				flavor += $(this).val() + ","; 
			});// 맛
		}
		
		if( $(this).prop("checked")){
			$("input[name=smell]:checked").each(function() { 
				smell += $(this).val() + ","; 
			});// 향
		}else{
			$("input[name=smell]:checked").each(function() { 
				smell += $(this).val() + ","; 
			});// 향
		}
		
		if( $(this).prop("checked")){
			$("input[name=allergy]:checked").each(function() { 
				allergy += $(this).val() + ",";
			});// 알레르기
		}else{
			$("input[name=allergy]:checked").each(function() { 
				allergy += $(this).val() + ",";
			});// 알레르기
		}

		$.ajax({
			url: "curatingSelectProduct.pro",
			data: {kinds:kinds, flavor:flavor, smell:smell, allergy:allergy, preNo:preNo, userNo:userNo},
			success:function(data){

				console.log(data);
				$tableBody = $(".snackTable #tbody");
				$tableBody.html('');
				
				$.each(data, function(index, value){
					
					var $tr = $("<tr>").attr('class', 'listBody');
					var $pCodeTd = $("<td>").text(decodeURIComponent(value.pCode)); //상품 코드
					var $pNameTd = $("<td>").text(decodeURIComponent(value.pName)); //상품명
					var $ptNameTd = $("<td>").text(decodeURIComponent(value.ptName)); //상품 종류명
					var $pVendorTd = $("<td>").text(decodeURIComponent(value.pVendor)); //업체명
					var $priceTd = $("<td>").text(decodeURIComponent(value.price)); //가격
					var $taste = $("<td>").text(decodeURIComponent(value.taste)); //맛
					var $flavor = $("<td>").text(decodeURIComponent(value.flavor)); //향
					var $allergy = $("<td>").text(decodeURIComponent(value.allergy)); //알레르기
					var $CountTd = $("<td>"); //개수
					
					var $inputTd = $("<td>").html("<input type='button' value='추가' id='proAdd'>");
					
					$tr.append($pCodeTd);
					$tr.append($pNameTd);
					$tr.append($pVendorTd);
					$tr.append($ptNameTd);
					$tr.append($taste);
					$tr.append($flavor);
					$tr.append($allergy);
					$tr.append($CountTd);
					$tr.append($priceTd);
					$tr.append($inputTd);
					$tableBody.append($tr);
					
					
				});
			},
			error:function(){
				console.log("실패!");
			}
		});
		
	});
});

	
</script>

	
</body>
</html>