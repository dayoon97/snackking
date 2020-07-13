<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스낵킹</title>
<link rel="shortcut icon" href="resources/image/snakicon.ico" type="image/x-icon">
<link rel="icon" href="resources/image/snakicon.ico" type="image/x-icon">
<link src="../css/style.css" rel="stylesheet">
<link src="../css/media-queries.css" rel="stylesheet">
<script src="../js/js.script.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
<!--카루셀 css -->
/* carousel */
#quote-carousel 
{
  padding: 0 10px 30px 10px;
  margin-top: 30px;
}

/* Control buttons  */
#quote-carousel .carousel-control
{
  background: none;
  color: #222;
  font-size: 2.3em;
  text-shadow: none;
  margin-top: 30px;
}
/* Previous button  */
#quote-carousel .carousel-control.left 
{
  left: -12px;
}
/* Next button  */
#quote-carousel .carousel-control.right 
{
  right: -12px !important;
}
/* Changes the position of the indicators */
#quote-carousel .carousel-indicators 
{
  right: 50%;
  top: auto;
  bottom: 0px;
  margin-right: -19px;
}
/* Changes the color of the indicators */
#quote-carousel .carousel-indicators li 
{
  background: #c0c0c0;
}
#quote-carousel .carousel-indicators .active 
{
  background: #333333;
}
#quote-carousel img
{
  width: 250px;
  height: 100px
}
/* End carousel */

.item blockquote {
    border-left: none; 
    margin: 0;
}

.item blockquote img {
    margin-bottom: 10px;
}

.item blockquote p:before {
    content: "\f10d";
    font-family: 'Fontawesome';
    float: left;
    margin-right: 10px;
}
.col-sm-9{
	margin-left: 70px;
}


/**
  MEDIA QUERIES
*/

/* Small devices (tablets, 768px and up) */
@media (min-width: 768px) { 
    #quote-carousel 
    {
      margin-bottom: 0;
      padding: 0 40px 30px 40px;
    }
    
}

/* Small devices (tablets, up to 768px) */
@media (max-width: 768px) { 
    
    /* Make the indicators larger for easier clicking with fingers/thumb on mobile */
    
    #quote-carousel .carousel-indicators {
        bottom: -20px !important;  
    }
    #quote-carousel .carousel-indicators li {
        display: inline-block;
        margin: 0px 5px;
        width: 15px;
        height: 15px;
    }
    #quote-carousel .carousel-indicators li.active {
        margin: 0px 5px;
        width: 20px;
        height: 20px;
    }
}


<!-- 카루셀 끝-->







header{
	z-index:1;
}

body {
	background: white;
	font-family: 'NanumSquare', sans-serif !important; 
	overflow-x: hidden;
}



.main-text {
	display: inline-block;
	font-size:35px;
	color: black;
	letter-spacing: -2px;
	margin: 0;
	line-height: 60px;
}

.main-text1 {
	color: #F0BB00;
}

.main-text2 {
	color: #533700;
}
.main-text1, .main-text2{
	font-weight:bold;
}
.main {
	width: 1500px;
	height: 800px;
}

.main1-1{
	width:1500px;
	height: 1100px;
}
.main1-2{
	width:1500px;
	position: relative;
}
.main2-1 {
	width:800px;
	height:500px;
	color: white;
	margin:0 auto;
}

.main3-1{
	width: 1600px;
	height: 1000px;
	align:center;
	
}
.main3-2{
	
	height:800px;
	margin:0 auto;
	background: rgba(243, 243, 243, 0.59);
	border-radius: 31px;
	
}
.main3-3{
	width:100vw%;
}
.step-text{
	font-family: 'Nanum Gothic', sans-serif;
	font-size:30px;
}
.wrapper{
	width:100%;
	height:4900px;
	margin:0 auto;
}
.cir{
	display:inline-block;
	position: absolute;
	width: 133px;
	height: 132px;
	border-radius:100px;
	background: #EAEAEA;
	margin-top: 150px;
	left:160px;
	box-shadow: 5px 5px 5px 1px #BCC7CA;
	text-align: center;
	padding-top: 55px;
	padding-bottom:40px;
	box-sizing: border-box;
	font-size: 15px;
}
.step{
	display: inline-block;
	margin-left: 90px;
	margin-right: 90px;
	margin-top: 500px;

}

.main3-3{
	width: 1500px;
	display: inline-block;
}
.cir1{
	margin-left: 30px;
}

.cir2{
	margin-left: 170px;
}
.cir3{
	margin-left: 310px;
}
.cir4{
	margin-left: 450px;
}
.cir5{
	margin-left: 590px;
}
.cir6{
	margin-left: 730px;
}
.cir7{
	margin-left: 870px;
}
.cir8{
	margin-left: 1010px;
}
.main4-1 {
	width: 1550px;
	height:600px;
	display: inline-block;
}
.main4-2{
	max-width: 1584px;
    margin: 0 auto;
}
.main4-3{
	height:100px;
}
.text-title{
	color: #111 !important;
}
.main-text3{
	font-weight: bold;
}
.carousel-wrapper{
  height:200px;
  position:relative;
  width:800px;
  margin:0 auto;
}
.carousel-item{
  position:absolute;
  top:0;
  bottom:0;
  left:0;
  right:0;
  padding:25px 50px;
  opacity:0;
  transition: all 0.5s ease-in-out;
}
.arrow{
    border: solid black;
    border-width: 0 3px 3px 0;
    display: inline-block;
    padding: 12px;
}

.arrow-prev{
  left:-30px;
  position:absolute;
  top:50%;
  transform:translateY(-50%) rotate(135deg);
}
 
.arrow-next{
    right:-30px;
    position:absolute;
    top:50%;
    transform:translateY(-50%) rotate(-45deg);
  }

.light{
  color:white;
}

.cl{
	text-align: center;
}
.satis{
	font-weight: 10px;
	font-size: 50px;
}
.yellow{
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 90px;
	color:#F0BB00;
}
@media (max-width: 480px) {
      .arrow, .light .arrow {
        background-size: 10px;
        background-position: 10px 50%;
      }
    }
}

/*Select every element*/
[id^="item"] {
    display: none;
  }

.item-1 {
    z-index: 2;
    opacity: 1;
  background-size:cover;
  }
.item-2{
   background-size:cover;
}
.item-3{
   background-size:cover;
}

*:target ~ .item-1 {
    opacity: 0;
  }

#item-1:target ~ .item-1 {
    opacity: 1;
  }

#item-2:target ~ .item-2, #item-3:target ~ .item-3 {
    z-index: 3;
    opacity: 1;
  }
}

.client{
	
}
.client-text{
	margin-top: 120px;
	margin-left:50px;
	font-size: 20px;
	color:#F0BB00;
	
}
.review{
	margin-left: 60px;
}
.main5-1{
	width:100%;
	height:1200px;
	
}
.main6-1{
	width:1500px;
	height:330px;
}
.main7-1{
	width:1500px;
	height:600px;
	display: inline-block;
	padding-left:200px; 
}

.main7-2{
	width:600px;
	height:800px;
	display: inline-block;
}
.main7-3{
	width:400px;
	height:800px;
	display: inline-block;
}
#ser_table{
	width:400px;
}
.main8-1{
	width: 1500px;
	height:300px;
}
.main8-2{
	width:1500px;
}


p.typing-txt{
	display: none;
	
}
.main9-1{
	width:1500px;
	height:150px;
}

.typing {  
/*       position: absolute;*/ 
     display: inline-block; 
      animation-name: cursor; 
      animation-duration: 0.3s; 
      animation-iteration-count: infinite; 
      font-size: 40px;
    } 
 @keyframes cursor{ 
      0%{border-right: 5px solid #fff} 
      50%{border-right: 5px solid #000} 
      100%{border-right: 5px solid #fff} 
 }
 .text-bar{
 	width: 90px;
	height: 10px;
	background: #F0BB00;
	margin-top:-18px;
	margin-left:365px;
 }
 .text-bar2{
 	width: 115px;
	height: 10px;
	background: #F0BB00;
	margin-top:-18px;
	margin-left:475px;
 }
 
 
 .solution-snacking{
 	position: absolute;
 	top:60%;
 	left:10%;
 	font-size: 40px;
 	color: white;
 }
</style>
</head>
<body>
	<script> AOS.init(); </script>
	<div class="wrapper">
		<%@include file="views/common/index-menu.jsp" %>
		<div class="main main1-1">
			<div class="main1-2">
			<img src="resources/image/main1.jpg" width="1580px;"height="842px;" style="overflow:hidden; border-radius:50px;">
			</div>
			<div class="solution-snacking">처리할 일도 많은데 간식까지 준비하는 번거로움<br>
			일할 맛 나는 기업 스낵킹으로 해결하세요!</div>
		<div class="page-start"></div>
		</div>
		<div class="main main2-1">
			<div class="main2-2">
				<div data-aos="zoom-out">
					<div class="main-text main-text1">스낵</div>
					<div class="main-text main-text2">킹</div>
					<div class="main-text">을 도입한 고객사 수</div><div class="main-text main-text3">&nbsp;132개</div>
					<br>
					<div class="text-bar"></div>
					<div class="main-text main-text1">스낵</div>
					<div class="main-text main-text2">킹</div>
					<div class="main-text">을 통해 간식을 먹는 직원 수</div> <div class="main-text main-text3">&nbsp;3,024명</div>
					<div class="text-bar2"></div>	
						<!--  <img src="../image/main1.jpg" width="1500px;" height="100%">-->
				</div>
			</div>
		</div>
		<div class="main main3-1">
			<div class="main3-2">
				<div class="main3-3" align="center">
				
				<div class="cir cir1">1. 컨설팅</div>
				<div class="cir cir2">2. 큐레이션</div>
				<div class="cir cir3">3. 온라인 컨펌</div>
				<div class="cir cir4">4. 상품 출고</div>
				<div class="cir cir5">5. 상품 배송</div>
				<div class="cir cir6">6. 방문 진열 관리</div>
				<div class="cir cir7">7. 피드백 및 교환</div>
				<div class="cir cir8">8. 월별 회계처리</div>
				
				<div class="step step1" >
					<div class="step-text main-text3-1" >step1</div><br>
					<div class="step-text main-text3-1" >우리 사무실<br>간식 고르기</div>
				</div>
				<div class="step step2">
					<div class="step-text main-text3-1" >step2</div><br>
					<div class="step-text main-text3-1" >결제&정산은<br>간단히</div>
				</div>
				<div class="step step3">
					<div class="step-text main-text3-1" >step3</div><br>
					<div class="step-text main-text3-1" >정기 구독<br>완료</div>
				</div>
				</div>
			</div>
		</div>
		<div class="main main4-1">
			<div class="main4-2">
				<p class="cl satis">높은 만족도</p>
			</div>
			<div class="main4-3">
				<p class="cl yellow">"</p>
			</div>


<!--          카루셀 예시                                    -->
<div class="container">
  <div class="row">
   
  </div>
  <div class='row'>
    <div class='col-md-offset-2 col-md-8'>
      <div class="carousel slide" data-ride="carousel" id="quote-carousel">
        <!-- Bottom Carousel Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
          <li data-target="#quote-carousel" data-slide-to="1"></li>
          <li data-target="#quote-carousel" data-slide-to="2"></li>
          <li data-target="#quote-carousel" data-slide-to="3"></li>
          <li data-target="#quote-carousel" data-slide-to="4"></li>
        </ol>
        
        <!-- Carousel Slides / Quotes -->
        <div class="carousel-inner">
        
          <!-- Quote 1 -->
          <div class="item active">
              <div class="row">
                <div class="col-sm-9">
                 <div class="review"><h2 class="" align="center">저 같은 막내직원에게는 <br>편해지는 길이에요</h2></div>
         			<div class="client-text"><p class="client" align="center">스마일킴 담당자</p></div>
                </div>
              </div>
          </div>
          <!-- Quote 2 -->
          <div class="item">
           
              <div class="row">
                <div class="col-sm-9">
                  <div class="review"><h2 class="" align="center">스낵 킹은 믿고 맡길 수 있는 <br>업체인 것 같습니다</h2></div>
       				<div class="client-text"><p class="client" align="center">요밋 담당자</p></div>
                </div>
              </div>
            
          </div>
          <!-- Quote 3 -->
          <div class="item">
              <div class="row">
    
                <div class="col-sm-9">
                   <div class="review"><h2 class="" align="center">저희 요청사항에 대해 <br>열심히 관리 해주세요</h2></div>
	    				<div class="client-text"><p class="client" align="center">오마이짐 직원</p></div>
                </div>
              </div>
      
          </div>
           <div class="item">
              <div class="row">
    
                <div class="col-sm-9">
                    <div class="review"><h2 class="" align="center">간식은 무조건 스낵킹!</h2></div>
	    				<div class="client-text"><p class="client" align="center">쏘이지 막내직원</p></div>
                </div>
              </div>
      
          </div>
           <div class="item">
              <div class="row">
    
                <div class="col-sm-9">
                    <div class="review"><h2 class="" align="center">스낵킹 직원분들 너무 친절하고<br> 서비스도 최고~!</h2></div>
	    				<div class="client-text"><p class="client" align="center">그루모아 관계자</p></div>
                </div>
              </div>
      
          </div>
        </div>
        
        <!-- Carousel Buttons Next/Prev -->
        <a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-chevron-left"></i></a>
        <a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-chevron-right"></i></a>
      </div>                          
    </div>
  </div>
</div>
	</div>
	<div class="main main5-1">
		<img src="resources/image/main_service.png" style="width:100%;">
	</div>
	<div class="main main6-1">
		<div class="main6-2" align="center">
		<img src="resources/image/main_service2.png" style="width:800px;">
		</div>
	</div>
	<div class="main main7-1">
		<div class="main7-2"><p style="font-size:20px;">사장님, <br>100만 원어치 주문했더니, <br>200만원 들고왔습니다!</p>
			<p>기업의 예산 등 상황에 따라 변동 될 수 있습니다.</p>
		</div>
		<div class="main7-3">
			<img src="resources/image/service_table.jpg" style="width:500px;">
		</div>
	</div>
	<div class="main main8-1">
		<div class="main8-2" align="center">
			<p class="typing-txt">이번달 사무실 간식 또 고민하고있다면 정답은 스낵킹</p>
			<p class="typing"></p> 
		</div>
	</div>
	<div class="main main9-1">
	<%@ include file="../views/common/footer.jsp" %>
	</div>
		</div>
	<script>
	var typingBool = false; 
    var typingIdx=0; 
    var typingTxt = $(".typing-txt").text(); // 타이핑될 텍스트를 가져온다 
    typingTxt=typingTxt.split(""); // 한글자씩 자른다. 
    if(typingBool==false){ // 타이핑이 진행되지 않았다면 
       typingBool=true; 
       		var tyInt = setInterval(typing,100);
    	// 반복동작 
    }
     
     function typing(){ 
       if(typingIdx<typingTxt.length){ // 타이핑될 텍스트 길이만큼 반복 
         $(".typing").append(typingTxt[typingIdx]); // 한글자씩 이어준다. 
         typingIdx++; 
       } else{ 
         clearInterval(tyInt); //끝나면 반복종료 
       } 
     }
     
     $(document).ready(function() {
    	  //Set the carousel options
    	  $('#quote-carousel').carousel({
    	    pause: true,
    	    interval: 4000,
    	  });
    	});
	</script>
</body>
</html>