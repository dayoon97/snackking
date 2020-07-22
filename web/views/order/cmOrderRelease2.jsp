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

/*조회 결과 리스트 제목 스타일*/
#subSubTitle2{
/* width: 90px; */
height: 30px;
margin-left: 40px;
margin-bottom: 15px;
font-family: NanumSquare_ac;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 20px;
display: flex;
align-items: center;
color: #000000;
}


.listTable{
	width: 475px;
	border-collapse:collapse;
	margin: 0 auto;
	text-align:center;
}


/*조회 리스트 테이블 listHead*/
.listHead{
width: 475px;
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
#mainWrapper {
   margin-left: auto;
   margin-right: auto;
   display: table;
}
#listTableWrap {
	height: 265px;
	overflow: auto;
	display: inline-block;
	margin-left: 40px;
}
.tableWrap::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
.tableWrap::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
#productArea {
	float: right;
	width: 475px;
	height: 265px;
	overflow: auto;
	display: inline-block;
	margin-right: 40px;
}

</script>
   

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
            <div id="mainTitle">주문 관리</div>
            <div id="line1"></div>
            <div id="subTitle">출고 리스트 작성</div>
         </div>   <!--title-area end -->
         
         
         
         <!-- 조회 결과 리스트 부분 -->
            <div id="listArea">
               <!-- 조회 결과 리스트 제목 -->
               <div id="subSubTitle2">큐레이팅 리스트</div>
               <!-- 조회 리스트 테이블 -->
               <div id="listTableWrap" class="tableWrap">
	               <table id="listTable" class="listTable">
	                  <!-- 테이블 헤드 -->
	                  <thead>
		                  <tr id="listHead" class="listHead">
		                     <th>번호</th>
		                     <th>큐레이팅ID</th>
		                     <th>회원명</th>
		                     <th>회사명</th>
		                     <th>날짜</th>
		                  </tr>
	                  </thead>
	                  
	                  <!-- 리스트 바디  -->
	                  <tbody>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>CURATING01</td>
		                     <td>남궁보훈</td>
		                     <td>(주)SNACKKING</td>
		                     <td>2020-07-22</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
		                  <tr class="listBody">
		                     <td><input type="checkbox" name="chk"></td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                     <td>내용</td>
		                  </tr>
	                  </tbody>
	               </table>
               
               </div>	<!-- listTableWrap end -->
               
				<div id="productArea" class="tableWrap">
					<table class="listTable" boder="1">
						<thead>
							<tr class="listHead">
								<th width="150px">상품명</th>
								<th>재고 번호</th>
								<th>로케이션 번호</th>
								<th>총 수량</th>
								<th>선택 수량</th>
							</tr>
						</thead>
						<tbody>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							<tr class="listBody">
								<td>초코송이</td>
								<td>S1</td>
								<td>L1</td>
								<td>80</td>
								<td><input type="text" size="1"></td>
							</tr>
							
						</tbody>
					</table>
				</div>
               
            </div>
      
      </div>   <!-- background-box end -->
   </div>   <!-- outer end -->
</div>   <!-- mainWrapper end -->

   <script type="text/javascript">
      
      
   </script>   
   
</body>
</html>