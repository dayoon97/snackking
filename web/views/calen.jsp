<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='../resources/packages/core/main.css' rel='stylesheet' />
<link href='../resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='../resources/packages/timegrid/main.css' rel='stylesheet' />
<link href='../resources/packages/list/main.css' rel='stylesheet'/>
<script src='../resources/packages/core/main.js'></script>
<script src='../resources/packages/interaction/main.js'></script>
<script src='../resources/packages/daygrid/main.js'></script>
<script src='../resources/packages/timegrid/main.js'></script>
<script src='../resources/packages/list/main.js'></script>
<script src='../resources/packages/core/locales/main.js'></script>

<!-- 캘린더 초기설정 -->
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid','list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,list'
      },
      //defaultDate: '2019-06-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('일정 입력:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      
      editable: true,
      eventResourceEditable: true,
      resourceEditable: true,
      eventLimit: true, // allow "more" link when too many events
      locale:'ko',
      
      
      events: [
       /*  {
          title: 'asd',
          start: '2020-07-16'
        }, */
        
        /* {
          start: '2020-07-20',
          end: '2020-07-22',
          backgroundColor: '#ff9f89',
          rendering: 'background'
        } */
      ]
    
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  /* 주말 색 추가 */
.fc-sat { background-color:#a4ccf1}
.fc-sun { background-color:#f7b5c0}

</style>
</head>
<body>

  <div id='calendar'></div>
  <form action="<%=request.getContextPath()%>/search.da" method="get">
  <label>큐레이터 아이디 : </label>
  <input type="text" name="userId">
  <button type="submit">가져오기</button>
  
  </form>
  
	
</body>
</html>
