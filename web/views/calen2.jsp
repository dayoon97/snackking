<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.snackking.scheduler.model.vo.*" %>
<% ArrayList<Scheduler> slist = (ArrayList)request.getAttribute("sList"); %>
<% ArrayList<SchedulerInfo> silist = (ArrayList)request.getAttribute("slist"); %>
<!DOCTYPE html>
<html>
<head>
<link href='<%=request.getContextPath()%>/resources/packages/core/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/resources/packages/timegrid/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/resources/packages/list/main.css' rel='stylesheet'/>
<script src='<%=request.getContextPath()%>/resources/packages/core/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/packages/interaction/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/packages/daygrid/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/packages/timegrid/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/packages/list/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/packages/core/locales/main.js'></script>

 
<!-- 캘린더 초기 설정 -->
<script>




document.addEventListener('DOMContentLoaded', function() {
  var Calendar = FullCalendar.Calendar;
  var Draggable = FullCalendarInteraction.Draggable;
 
  var containerEl = document.getElementById('external-events');
  var calendarEl = document.getElementById('calendar');
  var checkbox = document.getElementById('drop-remove');
 
  // initialize the external events
  // -----------------------------------------------------------------
 
  new Draggable(containerEl, {
    itemSelector: '.fc-event',
    eventData: function(eventEl) {
      return {
        title: eventEl.innerText
      };
    }
  });
 
  // initialize the calendar
  // -----------------------------------------------------------------
 
  var calendar = new Calendar(calendarEl, {
    plugins: [ 'interaction', 'dayGrid', 'timeGrid','list' ],
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,list'
    },
    eventLimit: true,   // 더보기 옵션
    selectable: true,   // 선택가능 옵션
    editable: true,
    droppable: true, // this allows things to be dropped onto the calendar
    drop: function(info) {
      // is the "remove after drop" checkbox checked?
      if (checkbox.checked) {
        // if so, remove the element from the "Draggable Events" list
        info.draggedEl.parentNode.removeChild(info.draggedEl);
        
      }
    },
 
    //일정 변경 할때 alert
    eventDrop: function(info) {
        alert(info.event.title + " was dropped on " + info.event.start.toISOString());

        if (!confirm("일정을 변경하시겠습니까?")) {
          info.revert();//취소했을때 이전으로 돌림.
        }
      },
    
    locale: 'ko',
    events: [

    	 
    		
    ],
    
    eventClick: function(info){
         alert('Event: ' + info.event.title);
        //모달창 추가 해서 정보 가져와야함....ㅁㄴㅇㄻㄴㅇㄹㄴㅁㅇㄻㄴㄻㄴㅇㄻㄴㄹㅇ
    }

  });
    calendar.render();
 
  
  var arrTest = getCalendarDataInDB();
  $.each(arrTest, function(index, item){
        console.log('outer loop_in_cal' + index + ' : ' + item);
        $.each(item, function(iii, ttt){
            console.log('inner loop_in_cal => ' + iii + ' : ' + ttt);
        });
  });
  
  $("#btnAddTest").click(function(){
      //var arr = getCalendarEvent();
      var arr = getCalendarDataInDB();
      //console.log('arr[0].size : ' +  Object.keys( arr[0] ).length );
      $.each(arr, function(index, item){
          calendar.addEvent( item );
          console.log('click evt loop_in_cal' + index + ' : ' + item);
          $.each(item, function(iii, ttt){
                console.log('click evt inner loop_in_cal => ' + iii + ' : ' + ttt);
          });
      });
      calendar.addEvent( {'title':'evt4', 'start':'2020-07-28', 'end':'2020-07-29'});
      calendar.render();
  });  
  //alert( '캘린더에서 알린다!!! 잘 받았다! ' + (arrTest.0.id) );
});

function getCalendarEvent(){
    //var arr = [ {'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06'} ];
    var arr = { 'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06' };
    return arr;
}
 
function getCalendarDataInDB(){
    var arr = [{title: 'evt1', start:'ssssss'}, {title: 'evt2', start:'123123123'}];
    
    //배열 초기화
    var viewData = {};
    //data[키] = 밸류
    viewData["id"] = $("#currId").text().trim();
    viewData["title"] = $("#title").val();
    viewData["content"] = $("#content").val();
    
    $.ajax({
        contentType:'application/json',
        dataType:'json',
        url:'calendar/getall',
        type:'post',
        async: false,
        data:JSON.stringify(viewData),
        success:function(resp){
            //alert(resp.f.id + ' ggg');     
            $.each(resp, function(index, item){
                console.log(index + ' : ' + item);
                $.each(item, function(iii, ttt){
                    console.log('inner loop => ' + iii + ' : ' + ttt);
                });
            });
            arr = resp;
        },
        error:function(){
            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
        }
    });
    
    return arr;
}
 
</script>

<style>
 
 /* 레이아웃 구성 */
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
#mainWrapper {
   margin-left: auto;
   margin-right: auto;
   display: table;
}
 
 
  html, body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
 
  #external-events {
    position: absolute;
    z-index: 2;
    top: 30px;
    left: 30px;
    width: 170px;
    height: 200px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    overflow-y: scroll;
    cursor: move;
     display: none; /* 디폴트값 일단 안보이게 하고 각 유저 클릭했을 때 해당하는 정보 끌어오기 */ 
  }
 
  .demo-topbar + #external-events { /* will get stripped out */
    top: 60px;
  }
 
  #external-events .fc-event {
    margin: 1em 0;
    cursor: pointer;
  }
 
  #calendar-container {
    position: relative;
    z-index: 1;
    margin-left: 200px;
  }
 
  #calendar {
    max-width: 900px;
    margin: 20px auto;
  }
  
  /* 주말 색 추가 */
.fc-sat { background-color:#a4ccf1}
.fc-sun { background-color:#f7b5c0}

</style>
 
</head>
<body>
<!--  mainWrapper start -->
<div id="mainWrapper">

   <!--  -->
   <%@ include file ="common/userMenu.jsp" %>
   
   <!--  outer start -->
   <div id="outer">
      <!-- background-box start -->
      <div id="background-box">
   <!-- draagle box -->
<div id="external-events">
    <p>
      <strong><%-- <%for(int i=0;i< slist.size(); i++) { %>
              <%=slist.get(i).getUserName()%>
              <%}%> --%>
              <%for(int i=0;i<slist.size(); i++) { %>
              <% } %>
              <%-- <%=slist.get(0).getUserName() %> --%>
      </strong>
    </p>
    <%System.out.println(loginUser.getUserNo()); %>
    <%-- <div class="content-count" /* 월배송회차 가져올 것 */ ><%=(slist.get(0).getDelivCount())%></div> --%>
     <%int j = 1;%>
    <%while(j <= slist.get(0).getDelivCount()) {%>
    <div class="fc-event"><%=j%>회차</div> 
    <% j++; }%> 
    <div id="a"></div>

    <p>
      <input type="checkbox" id="drop-remove" checked="checked">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div>
  
<div id='calendar'>

<table>
   <tr class="userlist">
   <td><input type="checkbox">전체일정</td>
   <%for(int i=0; i< slist.size(); i++) { %>
   <!-- 계약 회원 체크박스 -->
   <td><input type="checkbox" value="<%=i%>" class="ccc" name="box" onclick="check(this)"><%=(slist.get(i).getUserName()) %></td>
   <%} %>

   </tr>
</table>
</div>

      </div> <!-- background-box end -->
   </div> <!-- outer end -->
</div> <!-- mainWrapper end -->

</body>

<!-- external-events 이동가능 -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
          <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
          <script>
          $( '#external-events' ).draggable();
          </script> -->
          
<!-- 유저 리스트 체크 이벤트 -->
<script>

//체크 박스 클릭시 회색 일정 박스 보이게 함
function check(box) {
if(box.checked == true){
   if(box.value == "0"){
       $('#external-events').show(); 
   } else if(box.value == "1"){
	   $('#external-events').show();
   } else if(box.value == "2"){
	   $('#external-events').show();
   } else if(box.value == "3"){
	   $('#external-events').show();
   }
}      
else{
   if(box.value == "0"){
   $('#external-events').hide();
   } else if(box.value == "1"){
	   $('external-events').hide();
   } else if(box.value == "2"){
	   $('external-events').hide();
   } else if(box.value == "3"){
	   $('external-events').hide();
   }
}
}

<%-- function check(box) {
   /************************************************************************************/
   //계약 회원 체크박스 한개만 선택되게 하기
   //이름이 chk 인 애들만 배열에 담음
      var obj = document.getElementsByName("box");
   //배열 반복문 돌리면서,  
      var number = 0;  //체크박스에 선택된 회원의 index (= 리스트 순번)
      for(var i=0; i<obj.length; i++){
           if(obj[i] != box){ //현재 선택되지 않은 애들은 체크 해제하고
               obj[i].checked = false;
           }else{
              number = i; //선택된 체크박스의 순번을 찾아낸다.
           }
       }
       
   /************************************************************************************/
  
   
   /************************************************************************************/
   //현재 선택된 계약 회원의 월 배송횟수 확인한다. 자바의 arraylist를 자바 스크립트에서 바로 쓸 수 없어서
   //ArrayList 를 javaScript 배열에 새로 담은다음 가져다 쓴다.
   var jsArray = [];
   <%for(int i = 0; i < slist.size(); i++) {%>
      jsArray.push("<%= slist.get(i).getDelivCount()%>");
   <%}%>
   //출력
   console.log("나의 계약 회원들의 배송 횟수 리스트 " + jsArray);
   //내가 체크박스에서 선택한 회원 index는 number에 담겨 있는데 jsArray에서 이 index 회원의 정보를 가져온다
   console.log("내가 체크박스 선택한 회원의 배송 횟수 " + jsArray[number] + "회");

   /************************************************************************************/
   //선택된 체크 박스에 해당하는 유저의 월배송횟수만큼 박스 만들어줌

    
   for(var i = 0; i < jsArray[number]; i++){
      if(i == 0){
        var $a = $("#a");
         $a.attr('class','fc-event'); //박스에 파란색 한줄
         $a.html('횟수 : ' + (i + 1 ) + "번째 방문"); //파란색 한줄에 글씨쓰기
      } else{
         $b = $("<div>").attr('class','fc-event');
         $b.html('횟수 : ' + (i + 1 ) + "번째 방문");
         $a.append($b);
            if(i = jsArray[number] - 1){
                $b.before($a); 
            }
         
      }
   }
   
   
}
 --%>



$(function() {

    $(".ccc").on("click", function() {
       var member = {
             "email":"test@naver.com",
             "password":"1234"
       }
   
        $.ajax({
             url: "getinfo.da", // 클라이언트가 요청을 보낼 서버의 URL 주소
               dataType: 'json',                
               type: "POST",                             // HTTP 요청 방식(GET, POST)
               data: JSON.stringify(member), //json을 String으로 파싱
               contentType: "<%=request.getContextPath()%>apllication/json; charset=UTF-8",
               success: function(result) {
                  if (result) {
                     alert("저장되었습니다.");
                     console.log(result);
                  } else {
                     alert("잠시 후에 시도해주세요.");
                  }
               },
               error: function() {
                  alert("에러 발생");
               }
        })

        


    });

});




   


</script>          
          
</html>\