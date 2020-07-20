<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.snackking.board.model.vo.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
    .searchDate{
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
.pagingArea {
	position: absolute;
    top: 645px;
    left: 420px;
}
.pagingArea button {
	border: 0;
	outline: 0;
	font-size: 15px;
	background-color: rgba(0, 0, 0, 0);
}
.pagingArea button:hover {
	cursor: pointer;
	color: #F0BB00;
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
            <div id="mainTitle">회원관리
            </div>
            <div id="line1"></div>
            <div id="subTitle">문의 게시판 관리</div>
         </div>   <!--title-area end -->
         
         <!-- search-area start -->
         <div id="searchArea">
            <!-- 조회 제목 -->
            <div id="subSubTitle1">내역 조회</div>
               <!-- searchBox start -->
               <div id="searchBox">
                  <form id="searchForm" action="<%= request.getContextPath()%>/searchBoard.bo" method="post">
                     <table class="memberTable">
                        <tr>
                           
                           <td>회원 ID</td>
                           <td><input type="text" id="userId" name="userId" size="7"></td>
                           <td>문의타입</td>                     
                           <td width="100px">
                              <div id="boardTypeDrop" class="dropdown">
                                 <div class="select">
                                    <span>전체</span>
                                    <i class="fa fa-chevron-left"></i>
                                 </div>
                                 <input type="hidden" name="boardType" id="boardType" value="">
									<ul class="dropdown-menu">
										<li id="BT1">기타문의</li>
										<li id="BT2">교환문의</li>
										<li id="BT3">피드백문의</li>
									</ul>
                              </div>
                           </td>
                                                       
                           
                           <td>답변상태</td>
                           <td width="100px">
                              <div id="answerCheckDrop" class="dropdown">
                                 <div class="select">
                                    <span>전체</span>
                                    <i class="fa fa-chevron-left"></i>
                                 </div>
                                 <input type="hidden" name="checkType" id="checkType" value="">
                                 <ul class="dropdown-menu">
                                    <li id="N">답변대기</li>
                                    <li id="Y">답변완료</li>
                                 </ul>
                              </div>
                           </td>
                           <td>날짜</td>
                           <td><input type="date" id="searchDate" name="searchDate" class="searchDate" size="7"></td>
                           <!-- <td><input type="submit" class="searchBtn" value="검색하기" id="submit"></td> -->
                           <td><input type="button" class="searchBtn" value="검색하기" id="searchBtn"></td>
                        
                        </tr>
                     </table>
                  </form>
               </div> <!-- searchBox end -->
         </div>   <!-- search-area end -->
         
         <!-- 조회 결과 리스트 부분 -->
            <div id="listArea">
               <!-- 조회 결과 리스트 제목 -->
               <div id="subSubTitle2">조회 내역</div>
               <!-- 적용 버튼 -->
               <!-- <button onclick="" class="btn" id="apply">적용</button> -->
               <span id="apply"><td><input type="submit" class="searchBtn" value="삭제" id="submit"></td></span>
               
               <!-- 조회 리스트 테이블 -->
               <table id="listTable">
                  <!-- 테이블 헤드 -->
                  <tr id="listHead">
                     <th width="20px"><input type="checkbox" id="checkall"></th>
                     <th width="20px">번호</th>
                     <th width="30px">회원ID</th>
                     <th width="200px">제목</th>
                     <th width="40px">문의타입</th>
                     <th width="30px">답변상태</th>               
                     <th width="50px">날짜</th>               
                  </tr>
                  
                  <!-- 리스트 바디  -->
					<% for(Board b : list) { %>
						<tr class="listBody">
							<input id="cBid" name="cBid" type="hidden" value="<%=b.getBid()%>">
							<td><input type="checkbox"></td>
							<td><%= b.getrNum() %></td>
							<td><%= b.getUserId() %></td>
							<td><%= b.getbTitle() %></td>
							<td><%= b.getBtName() %></td>
							<td><%= b.getAnswerCheck() %></td>
							<td><%= b.getbDate() %></td>
						</tr>
					<% } %>                 
               </table>
      		<!-- pagingArea(페이징 처리 버튼) start -->
			<div class="pagingArea" align="center">
				<button onclick="location.href='<%=request.getContextPath()%>/cmBoardList.bo?currentPage=1'"><<</button>
				
				<% if(currentPage <= 1) { %>
					<button disabled><</button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/cmBoardList.bo?currentPage=<%=currentPage - 1%>'"><</button>
				<% } %>
				
				<% for(int p = startPage; p <= endPage; p++) {
					if(p == currentPage) { %>
						<button disabled><%= p %></button>
					<% } else { %>
						<button onclick="location.href='<%=request.getContextPath()%>/cmBoardList.bo?currentPage=<%=p%>'"><%= p %></button>
					<% }
				} %>
				
				
				<% if(currentPage >= maxPage) { %>
					<button disabled>></button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/cmBoardList.bo?currentPage=<%=currentPage + 1%>'">></button>
				<% } %>
				
				<button onclick="location.href='<%=request.getContextPath()%>/cmBoardList.bo?currentPage=<%=maxPage%>'">>></button>
			</div>	<!-- pagingArea end -->
            </div>
      </div>   <!-- background-box end -->
   </div>   <!-- outer end -->
</div>   <!-- mainWrapper end -->

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
      $('#boardTypeDrop .dropdown-menu li').click(
            function() {
               $(this).parents('.dropdown').find('span').text(
                     $(this).text());
               $(this).parents('.dropdown').find('input').attr('value',
                     $(this).attr('id'));
            });
      $('#answerCheckDrop .dropdown-menu li').click(
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
      
	
	$("#searchBtn").click(function() {
		var id = $("#userId").val();
		var type = $("#boardType").val();
		var check = $("#checkType").val();
		var sdate = $("#searchDate").val();
		
		if(id == "" && type == "" && check == "" && sdate == ""){
			alert("검색 조건이 없습니다.");
		} else {
			$("#searchForm").submit();
		}
		
	});

  	$(function() {
		$("#listTable td").click(function() {
			var num = $(this).parent().children("input").val();
			location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
		});
	});
      
   </script>   
   
</body>
</html>