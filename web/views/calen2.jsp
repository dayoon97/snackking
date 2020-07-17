<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.snackking.scheduler.model.vo.*" %>
<% ArrayList<Scheduler> slist = (ArrayList)request.getAttribute("sList"); %>
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
    	//값 들어가는지 확인용
         <%-- <%for(int i=0;i< slist.size(); i++) { %>
	        {
	        title : '<%=slist.get(i).getUserName()%>',
	        start : '2020-07-16',
	        }
        <%}%>  --%>
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
 
  html, body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
 
  #external-events {
    position: fixed;
    z-index: 2;
    top: 100px;
    left: 200px;
    width: 170px;
    height: 200px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    overflow-y: scroll;
  }
 
  .demo-topbar + #external-events { /* will get stripped out */
    top: 60px;
  }
 
  #external-events .fc-event {
    margin: 1em 0;
    cursor: move;
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
<div id="external-events">
    <p>
      <strong><%for(int i=0;i< slist.size(); i++) { %>
      		  <%=slist.get(i).getUserName()%>
      		  <%}%>
      </strong>
    </p>
    <div class="fc-event">My Event 1</div>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <div class="fc-event">My Event 5</div>
    <p>
      <input type="checkbox" id="drop-remove" checked="checked">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div>
<div id='calendar'></div>

</body>
<script>
</script>
</html>
