<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<style>
body {
	background: white;
	font-family: 'NanumSquare', sans-serif !important; 
	overflow-x: hidden;
	margin: 0 auto;
	}
.wrapper{
	width:100%;
	height:2400px;
	margin:0 auto;
	}
.main1-1{
	width:1500px;
	height: 1100px;
	}
.main1-2{
	width:1500px;
	top:0;
	left:0;
}
.main2-2{
	width:1500px;
	height:500px;
	margin-left: 200px;
}

.main4-1{
	width:1500px;
	height:150px;
}
.text{
	display: inline-block;
	margin-top: 10px;
}
.text1-1, .text1-6, .text1-7, .text1-8, .text1-9 {
	font-size: 25px;
}
.text1-6{
	margin-top: 40px;
}
.text2{
	font-size: 30px;
}
.text1-3{
	color:#F0BB00;
	font-weight:bold;
}
.text1-4{
	color:#533700;
	font-weight:bold;
}
.main3-1{
	width:1550px;
	height:1000px;
	display: inline-block;
}
.main3-2{
	width:750px;
	height:700px;
	display: inline-block;
	background: #F3F3F3;
	float: left;
}
.main3-3{
	width:300px;
	height:300px;
	margin: 0 auto;
	margin-top: 290px;
}
.main3-4{
	width:790px;
	height:700px;
	display: inline-block;
	background: #EFEFEF;
	float: left;
}
.text2{
	display: inline-block;
	font-size: 40px;
}
.que-menu{
	margin-top: 200px;
	margin-left: 80px;
	font-weight:lighter; 
	
}
.que-text1{
	color:#F0BB00;
	font-weight: bold;
}
.que-text2{
	color: #533700;
	font-weight: bold;
}

.main4-1{
	margin-top:100px;
	width:1500px;
	height:150px;
}

ul{list-style: none;}
.accordion-box{
  width: 100%; max-width: 600px;
  margin:  0 auto;
}
p.title{
  width: 100%;  
  line-height: 60px; 
  background: #000; 
  color: #fff; 
  box-sizing: border-box;
  padding: 0 10px;
}
.con{
  padding: 20px; 
  display:none;
}

.line{
	width: 390px;
	height: 1px;
	background: black;
	margin-top: -2px;
}
.line2{
	width: 154px;
	height: 10px;
	background: #F0BB00;
	
}
#first-text{
	text-decoration: underline #F0BB00;
	text-underline-position:under #F0BB00 10px;
}
.inner{
	margin-top: -13px;
	font-size: 14px;
}
.que-title{
	
}
.que-answer{
	display: none;
	margin-left: 20px;
}
</style>
</head>
<body>
<script> AOS.init(); </script>
	<div class="wrapper">
		<%@include file="../common/index-menu.jsp" %>
		<div class="main1-1">
			<div class="main1-2">
				<img src="../../resources/image/main2.jpeg" width=1580px; height=850px; style="border-radius:50px;">
			<div class="page-start"></div>
			</div>
		</div>
		<div class="main2-1">
			<div class="main2-2" data-aos="fade-in">
				<div class="text text1-1">회사라면 (집보다)간식이 더 맛있어야 합니다.</div><br>
				<div class="text text1-2 text2">저희&nbsp; </div><div class="text text1-3 text2">스낵</div><div class="text text1-4 text2">킹</div><div class="text text1-5 text2">에서는</div>
				<br>
				<div class="text text1-6">
				<table>
					<tr>
						<td id="first-text">SAVE TIME</td>
						
						<td>(시간절약)</td>
						<td>:</td>
						<td>마트를 방문하고 선택하는 고충을 들어드립니다.</td>
					</tr>
					<tr>
						<td id="first-text">INTERESTING</td>
						<td>(흥미로운)</td>
						<td>:</td>
						<td>다채로운 과자는 새로운 선택의 기쁨을 드립니다.</td>
					</tr>
					<tr>
						<td id="first-text">DELICIOUS</td>
						<td>(맛있다)</td>
						<td>:</td>
						<td>사무실의 모든 이들이 행복해 하는 맛이 있습니다.</td>
					</tr>
					<tr>
						<td id="first-text">HEALTHIER</td>
						<td>(더 건강하게)</td>
						<td>:</td>
						<td>즐거움과 더불어 건강함이 함께합니다.</td>
					</tr>
				</table>
				</div>
				
			</div>
		</div>
		<div class="main3-1">
			<div class="main3-2">
					<div class="main3-3">
						<div class="text2 que-text1">스낵</div>
						<div class="text2 que-text2">킹</div>
						<div class="text2 que-text3">에 대해</div><br>
						<div class="text2 que-text4">궁금하세요?</div>
					</div> 
			</div>
			<div class="main3-4">
				 <div class="que-menu">
				 <ul>
				 	<li>
				    <p class="que-title">1. 스낵킹을 주문할 때는 어떻게 해야하나요?</p>
				    <div class="que-answer">선호도 조사를 한 후 데이터를 기반으로 <br>간식 큐레이션을 해드립니다.</div></li>
				 
				    <li><div class="line"></div>
				    <p class="que-title">2. 스낵킹을 이용하면 돈이 얼마나 드나요?</p>
				    <div class="que-answer" >스낵바 마련에 돈 쓸 필요가 없습니다.<br> 예산에 맞춰 설비를 무상으로 렌탈해 드립니다.</div></li>
				    
				    <li><div class="line"></div>
				    <p class="que-title">3. 스낵킹은 언제 오시나요?</p>
				    <div class="que-answer">예산에 맞춰 정기적으로 배송해드립니다!</div></li>
				    
				    <li><div class="line"></div>
				    <p class="que-title">4. 스낵킹의 큐레이션이 마음에 들지 않으면 어떡하죠?</p>
				    <div class="que-answer">안드시는 간식에 대해 고민하실 필요가 없습니다. <br>무료로 교환해드리고,큐레이션에 반영하여 <br> 더 좋아하실 간식으로 가져다 드립니다.</div></li>
				    
				    <li><div class="line"></div>
				    <p class="que-title">5. 스낵킹에서 진열과 관리도 해주시나요?</p>
				    <div class="que-answer">간식 진열과 스낵바 관리에 시간 뺏길 필요가 없습니다. <br>
						스낵24가 국내 최초로 시작한 사무실 간식 진열 & 관리 서비스로 <br>
					        본업에 집중하실 수 있도록 도와드리겠습니다.</div></li>
					
					<li><div class="line"></div>
				    <p class="que-title">6. 그렇다면 간식비용이 높은 거 아닐까요?</p>
				    <div class="que-answer">평균적으로 편의점 대비 20% 내외로 저렴하지만, <br>편의점 가격 대비 최대 40% 저렴한 상품도 있습니다.</div></li>
				    
				    <li><div class="line"></div>
				    <p class="que-title">7. 결제는 어떻게 하나요?</p>
				    <div class="que-answer">매월 말마다 해당월에 납품된 상품과 반품된 상품을 <br>
						합산하여 1회 정산을 진행합니다.<br>
						정산된 최종 금액에 대하여 세금계산서를 발행해드리며 <br>
						총 거래명세서를 이메일로 보내드립니다.<br>
						확인 하신 이후, 익월 5일 이내로 입금해주시면 됩니다.</div>
					</li>
				</ul>
		    </div>
			</div>
		</div>
		<div class="main4-1">
		<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
	<script>
	
	$("p.que-title").click(function(){
		$(this).next("div.que-answer").slideToggle(200);
		$("p.que-title").css({"color":"#363636"});
	});
	
	/* $("p.que-title").on('click',function(){
		  $(this).next("div.que-answer").slideToggle(100);
		}); */
	</script>
</body>
</html>