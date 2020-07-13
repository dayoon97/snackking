<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		height: 2800px;
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
		height: 2500px;
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
		margin-top: 80px;
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
		<div id="background-box">
		
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
						<form id="searchForm" action="" method="">
						
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td width="800px"><h4>월 간식 예산을 입력해주세요.</h4></td>
								</tr>
								<tr>
								<td>
									<input type="text" name="budget" class="" size="100" style="height:40px;" placeholder="예시: 500000">
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
									<input type="text" name="personnel" class="" size="100" style="height:40px;" placeholder="예시: 500000">
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
									<tr>
										<td><input type="text" name="age1" class="" size="8" style="height:40px;" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="age2" class="" size="8" style="height:40px;" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="age3" class="" size="8" style="height:40px;" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="age4" class="" size="8" style="height:40px;" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="age5" class="" size="8" style="height:40px;" placeholder="                %"></td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>간식을 드시는 분들의 남녀 성비를 입력해주세요</h4>
								<br>
								<table>
									<tr>
										<th width="70px;"></th>
										<th width="90px;">남자</th>
										<th width="70px;"></th>
										<th width="90px;">여자</th>
										<th width="70px;"></th>
										<th width="200px;" colspan="2">남자 다수 / 여자 다수 / 반반</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text" name="genderM" class="" size="8" style="height:40px;" placeholder="                %"></td>
										<td></td>
										<td><input type="text" name="genderW" class="" size="8" style="height:40px;" placeholder="                %"></td>
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
										<td width="90px;"><input type="checkbox" name="kinds" value="snack">과자</td>
										<td width="20px;"></td>
										<td width="150px;"><input type="checkbox" name="kinds" value="candy">캔디/껌/초콜릿</td>
										<td width="20px;"></td>
										<td width="120px;"><input type="checkbox" name="kinds" value="coffee">커피/차</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="kinds" value="beverage">음료</td>
										<td width="20px;"></td>
										<td width="120px;"><input type="checkbox" name="kinds" value="curamen">컵라면/컵밥</td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>선호하는 맛을 선택해주세 (중복 선택 가능)</h4>
								<br>
								<table>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" name="flavor" value="">달콤</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="flavor" value="">짭짤</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="flavor" value="">단백</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="flavor" value="">고소</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="flavor" value="">새콤</td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>선호하는 향을 선택해주세요 (중복 선택 가능)</h4>
								<br>
								<table>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">바나나</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">초코</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">소다</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">커피</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">시나몬</td>
									</tr>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">민트</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">포도</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">딸기</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">땅콩</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="smell" value="">바닐라</td>
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
									<input type="text" class="" size="100" style="height:40px;" placeholder="예시: 민트">
								</td>
								</tr>
							</table>
							
							<div class="memberTable">
								<h4>알레르기 해당 사항을 선택 해주세요. (중복 선택 가능)</h4>
								<br>
								<table>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">밀</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">계란</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">우유</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">대두</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">게</td>
									</tr>
									<tr>
										<td width="50px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">돼지고기</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">땅콩</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">메밀</td>
										<td width="20px;"></td>
										<td width="90px;"><input type="checkbox" name="allergy" value="">호두</td>
										<td width="20px;"></td>
										<td width="200px;"><input type="checkbox" name="allergy" value="">기타 <input type="text" size="10"></td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>선호하는 구성 스타일을 선택 해주세요.</h4>
								<br>
								<table>
									<tr>
										<td width="100px;"></td>
										<td width="90px;"><input type="checkbox" name="amount" value="풍부하게" onclick="amountclick(this);">풍부하게</td>
										<td width="100px;"></td>
										<td width="90px;"><input type="checkbox" name="amount" value="고급지게" onclick="amountclick(this);">고급지게</td>
										<td width="100px;"></td>
										<td width="90px;"><input type="checkbox" name="amount" value="반반" onclick="amountclick(this);">반반</td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>선호하는 구성 스타일을 선택 해주세요.</h4>
								<br>
								<table>
									<tr>
										<td width="100px;"></td>
										<td width="150px;"><input type="checkbox" name="delivery" value="" onclick="deliveryclick(this);">방문 및 세팅 관리</td>
										<td width="100px;"></td>
										<td width="90px;"><input type="checkbox" name="delivery" value="" onclick="deliveryclick(this);">택배 배송</td>
									</tr>
								</table>
							</div>
							
							<div class="memberTable">
								<h4>필요하신 설비를 선택해주세요 (예산에 따라 제공되는 설비가 달라질 수 있으며, 사전 수요 조사용 문항입니다 ) </h4>
								<br>
								<table>
									<tr>
										<td width="50px;"></td>
										<td width="200px;"><input type="checkbox" name="equipment" value="">스낵 쇼케이스(대형)</td>
										<td width="40px;"></td>
										<td width="200px;"><input type="checkbox" name="equipment" value="">스낵 쇼케이스(소형)</td>
										<td width="40px;"></td>
										<td width="200px;"><input type="checkbox" name="equipment" value="">냉장고(대형)</td>
										<td width="40px;"></td>
										<td width="200px;"><input type="checkbox" name="equipment" value="">냉장고(소형)</td>
									</tr>
									
									<tr>
										<td></td>
										<td><img src=""></td>
										<td></td>
										<td><img src=""></td>
										<td></td>
										<td><img src=""></td>
										<td></td>
										<td><img src=""></td>
									</tr>
								</table>
							</div>
							
							<table class="memberTable">
								<tr>
									<!-- 검색 내용 타이핑하는 부분 -->
									<td width="800px"><h4>기타 필요 설비를 입력해주세요.</h4></td>
								</tr>
								<tr>
								<td>
									<input type="text" class="" size="100" style="height:40px;" placeholder="예시: 냉장고">
								</td>
								</tr>
							</table>
							
							<div class="memberTable">
								<h4>선호하는 구성 스타일을 선택 해주세요.</h4>
								<br>
								<table>
									<tr>
										<td width="100px;"></td>
										<td width="150px;"><input type="checkbox" name="packing" value="" onclick="packingclick(this);">일반 포장</td>
										<td width="100px;"></td>
										<td width="300px;"><input type="checkbox" name="packing" value="" onclick="packingclick(this);">개별 포장(인원수에 맞춰서 포장)</td>
									</tr>
								</table>
							</div>
							
						</form>
						<input class="searchBtn" type="button" onclick="preference();" value="작성 완료">
					</div> <!-- searchBox end -->
			</div>	<!-- search-area end -->
		
		</div>	<!-- background-box end -->
	</div>	<!-- outer end -->
</div>	<!-- mainWrapper end -->

<script type="text/javascript">
function amountclick(am){
    var obj = document.getElementsByName("amount");
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

function preference(){
	$("#searchForm").submit();
}
</script>

	
</body>
</html>