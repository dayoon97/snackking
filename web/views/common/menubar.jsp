<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body{
      background:#F9F9F9;

      /*가로 스크롤 바 없애기*/
      overflow-x:hidden;
   }
   #wrapper{
      width:100%;
      height:1024px;
   }
   nav{
      width:250px;
      /*height:1024px;*/
      height: 100vh;
      display: inline-block;
      
   }
   #menu{
      width:100%;
      height:100%;
      background: #F0BB00;
      border-radius: 10px;
      
   }
   #inside-menu{
      position: absolute;
      width:225px;
      height:81vh;
      top : 100px;
      left: 20px;
      text-align: center;
      background: #F2F2F2;
      border-radius: 10px;
      padding-top: 80px;
      font-weight: 500;
        font-size: 25px;
        font-family: NanumSquare_ac;
        line-height: 60px;
   }

   /*로고 + 스낵킹*/
   #inside-menu-logo-corpName{
    margin:0 auto;
    display: flex;
    padding-top: 15px;
    padding-left: 20px;
    
   
   }

   /*로고 옆 스낵킹*/
   #inside-menu-corpName{
    font-weight: 500;
    font-size: 25px;
    font-family: NanumSquare_ac;
    line-height: 60px;
   text-align: center;
   
   }

   /*과자로고*/
   #inside-menu-logo{
    width: 70px;
    height: auto;
   }



    a{
    text-decoration: none;
    color: black;
    line-height: initial;
   }


   #logout{
    color: white;
    font-weight: bold;
    font-size: 25px;
    font-family: NanumSquare_ac;
    border-radius: 10px;

   }


   section{
      position: absolute;
      width:1220px;
      height:1024px;
      
      display: inline-block;
      
   }
   article {
      position: absolute;
      
      width:1100px;
      height:450px;
   }
   .article1{
      top:50px;
      left: 50px;
   }
   .article2{
      top :550px;
      left: 50px;
   }
   .main-article1{
      position: absolute;
      width: 519px;
      height: 400px;
      top: 10%;
            
      background: #FFFFFF;
      box-shadow: 0px 2px 8px rgba(134, 140, 144, 0.05);
      border-radius: 16px;
   }
   .main-article2{
      position: absolute;
      width: 519px;
      height: 400px;
      left : 55%;
      top: 10%;
            
      background: #FFFFFF;
      box-shadow: 0px 2px 8px rgba(134, 140, 144, 0.05);
      border-radius: 16px;
   }
   #logo{
      padding-left: 10px;
   }
   #logout{
      position: absolute;
      width: 200px;
      height: 50px;
      left: 13px;
      top: 750px;
      background: rgba(205, 135, 0, 0.66);
      border-radius: 4px;
      border-color: rgba(205, 135, 0, 0.66);
      border: 0;
      outline:0;
   }
   #logout:hover{
      outline:rgba(205, 135, 0, 0.66);
      cursor:pointer;
   }
   
   label{
      font-family: NanumSquare_ac;
      font-style: normal;
      font-weight: bold;
      font-size: 16px;
      line-height: 18px;
      /* identical to box height */
      
      display: flex;
      align-items: center;
      margin-left: 70px;
      margin-top: 17px;
      
      color: #F1F1F1;
   }
</style>

</head>
<body>

   <div id="wrapper">
   <nav>
      <div id="menu">
        <div id="inside-menu-logo-corpName">
           <img src="logo.PNG" name="logo" id="inside-menu-logo">&nbsp;&nbsp;&nbsp;
           <div id="inside-menu-corpName">스낵킹</div>
        </div> 

         <div id="inside-menu">
            <a href="">회원 관리</a><br>
            <a href="">직원 관리</a><br>
            <a href="">상품 관리</a><br>
            <a href="">주문 관리</a><br>
            <a href="">교환 관리</a><br>
            <a href="">설비 관리</a><br>
            <a href="">정산 관리</a><br>
            <a href="">계약 관리</a>
            <button id="logout" value="logout">
               로그아웃
            </button>
         </div>
      </div>
   </nav>
   <section>
      <article class="article1">
         <div class="main-article1">
            
         </div>
         <div class="main-article2">
         
         </div>
      </article>
      <article class="article2">
         <div class="main-article1">
         
         </div>
         <div class="main-article2">
         
         </div>
      </article>
   </section>
   </div>
</body>

</html>