<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mine.css">
<style type="text/css">
#apply{
   position:absolute;   
   top:300px !important;
   right:90px !important;
   }
.modaltableWrap{
   height: 200px;
   overflow: auto;
   display: inline-block;
   overflow-x: hidden;
}
.modaltableWrap::-webkit-scrollbar {
      width: 5px;
      padding-top: 10px;
}
.modaltableWrap::-webkit-scrollbar-thumb {
      background-color: #D9D9D9;
      border-radius: 3px;
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
         <!-- title-area start ---------------------------------------------------------------------------->
         <div id="titleArea">
            <div id="mainTitle">상품 관리</div>
            <div id="line1"></div>
            <div id="subTitle">상품 정보 확인</div>
         </div>   <!--title-area end ---------------------------------------------------------------------------->
         
         <!-- search-area start ---------------------------------------------------------------------------->
         <div id="searchArea">
            <!-- 조회 제목 -->
            <div id="subSubTitle1">상품 검색</div>
               <!-- searchBox start -->
                  <div id="searchBox" style="height:75px !important;">
                        <table id="searchProduct">
                           <tr style="height:34px !important;">
                              <!-- 검색 내용 타이핑하는 부분 -->   
                              <td style="width:170px">상품코드  :
                              <input type="text" class="searchTextBox" size="7" name="pCode"></td>                                       
                              <td style="width:220px">종류  :
                              <div class="dropdown">
                                      <div class="select">
                                           <span>선택</span>
                                        <i class="fa fa-chevron-left"></i>
                                      </div>
                                      <input type="hidden" name="ptName">
                                      <ul class="dropdown-menu">
                                                <li id="">선택</li>
                                                <li id="과자">과자</li>
                                                <li id="캔디/껌/초콜릿">캔디/껌/초콜릿</li>
                                                <li id="커피/차">커피/차</li>                                        
                                                <li id="음료">음료</li>
                                                <li id="컵라면/컵밥">컵라면/컵밥</li>
                                                <li id="케이크">케이크</li>  
                                      </ul>
                                    </div>
                                    </td>
                                    
                                    <td style="width:140px">향  :
                                    <div class="dropdown">
                                      <div class="select">
                                           <span>선택</span>
                                        <i class="fa fa-chevron-left"></i>
                                      </div>
                                      <input type="hidden" name="flavor">
                                      <ul class="dropdown-menu">
                                                <li id="">선택</li>
                                                <li id="초코">초코</li>
                                                <li id="딸기">딸기</li>
                                                <li id="바나나">바나나</li>
                                                <li id="포도">포도</li>
                                                <li id="바닐라">바닐라</li>                                        
                                                <li id="커피">커피</li>
                                                <li id="민트">민트</li>
                                                <li id="소다">소다</li>
                                                <li id="시나몬">시나몬</li>
                                                <li id="땅콩">땅콩</li>  
                                      </ul>
                                    </div>
                                    </td>
                                    <td style="width:140px">맛  :
                                       <div class="dropdown">
                                      <div class="select">
                                           <span>선택</span>
                                        <i class="fa fa-chevron-left"></i>
                                      </div>
                                      <input type="hidden" name="taste">
                                      <ul class="dropdown-menu">
                                                <li id="">선택</li>
                                                <li id="달콤">달콤</li>
                                                <li id="짭짤">짭짤</li>
                                                <li id="고소">고소</li>
                                                <li id="담백">담백</li>
                                                <li id="새콤">새콤</li>
                                                <li id="매콤">매콤</li>                                        
                                      </ul>
                                    </div>
                              </td>
                                 
                                 <td style="width:210px">기본 유통기한  :
                                    <input type="text" class="searchTextBox" size="2" name="pExp"> 개월
                                 </td>   
                           </tr>
                           <tr>   
                              <td>상품명  :
                                 <input type="text" class="searchTextBox" size="9" name="pName">
                              </td>
                                      <td colspan="4">알레르기 :
                                 <div class="dropdown">
                                      <div class="select">
                                           <span>선택</span>
                                        <i class="fa fa-chevron-left"></i>
                                      </div>
                                      <input type="hidden" name="allergy">
                                      <ul class="dropdown-menu">
                                                <li id="">선택</li>
                                                <li id="밀">밀</li>
                                                <li id="대두">대두</li>
                                                <li id="계란">계란</li>
                                                <li id="땅콩">땅콩</li>
                                                <li id="갑각류">갑각류</li>                                        
                                                <li id="메밀">메밀</li>                                        
                                                <li id="유제품">유제품</li>                                        
                                                <li id="해당없음">해당없음</li>                                        
                                         </ul>
                                    </div>
                                    <label style="margin-left: 30px;">가격  :</label>
                                       
                                 <input type="text" class="searchTextBox" size="7" name="price1"> ~
                                 <input type="text" class="searchTextBox" size="7" name="price2"> 원
                                  <label style="margin-left: 30px;">나이  :</label>
                                 <div class="dropdown">
                                      <div class="select">
                                           <span>선택</span>
                                        <i class="fa fa-chevron-left"></i>
                                      </div>
                                      <input type="hidden" name="age">
                                      <ul class="dropdown-menu">
                                                <li id="">선택</li>
                                                <li id="20">20대</li>
                                                <li id="30">30대</li>
                                                <li id="40">40대</li>
                                                <li id="50">50대</li>
                                                <li id="60">60대</li>
                                         </ul>
                                    </div>
                                 <button class="searchBtn search" id="searchBtn" style="margin-left:10px;">검색하기</button>
                              </td>
                                                   
                           </tr>
                        </table>
               </div>
            </div><!-- search-area end ---------------------------------------------------------------------------->


         
         <!-- 조회 결과 리스트 부분 -->
            <div id="listArea">
               <!-- 조회 결과 리스트 제목 -->
               
               <div id="subSubTitle2" style="top:310px !important;">상품 리스트</div>
               <!-- 적용 버튼 -->
               <!-- <button onclick="" class="btn" id="apply">적용</button> -->
               <span id="apply">조회 결과 수 :</span>
                  <!-- 테이블 시작 -->
                  <!-- 조회 리스트 테이블 -->
               <div>
               <table id="listTable12" class="productSearchListTable">
                  <thead>
                     <!-- 테이블 헤드 -->
                     <tr>
                        <th>선택</th>
                        <th>순번</th>
                        <th>상품코드</th>
                        <th>상품명</th>
                        <th>사진 </th>
                        <th>상품종류</th>
                        <th>가격</th>
                        <th>향</th>
                        <th>맛</th>
                        <th>알레르기</th>
                        <th>기본유통기한</th>
                        <th>나이</th>
                     </tr>
                  </thead>
                  <tbody style="height: 230px !important;" class="modaltableWrap">
                  <!-- 리스트 바디  -->
                  </tbody>
               </table>
            </div>
               </div>
               <!-- 테이블 끝 -->
                  <div style="margin-top: 500px; margin-left: 700px;">
                     <button onclick="addProduct();" class="searchBtn" style="margin-right: 15px;" id="btnAddProduct">추가</button>
                     <button class="searchBtn" style="margin-right: 15px;" id="btnUpdateProduct">수정</button>
                     <button class="searchBtn" id="btnDeleteProduct">삭제</button>
                  </div>
            
      </div>   <!-- background-box end -->
   </div>   <!-- outer end -->
</div>   <!-- mainWrapper end -->

</body>


<script>


/* 옵션 선택 드롭 다운 */
$('.dropdown').click(function () {
    $(this).attr('tabindex', 1).focus();
    $(this).toggleClass('active');
    $(this).find('.dropdown-menu').slideToggle(300);
});
$('.dropdown').focusout(function () {
    $(this).removeClass('active');
    $(this).find('.dropdown-menu').slideUp(300);
});
$('.dropdown .dropdown-menu li').click(function () {
    $(this).parents('.dropdown').find('span').text($(this).text());
    $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
});
/*End Dropdown Menu*/


$('.dropdown-menu li').click(function () {
  var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>',
      msg = '<span class="msg">Hidden input value: ';
  $('.msg').html(msg + input + '</span>');
}); 


/************************************************************************************/
function only(chk){ 
   var obj = document.getElementsByName("chk");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
/************************************************************************************/
   
//검색 버튼 클릭시 내용 조회하기
$(function() {
      $(".search").click(function(){
         var pCode = $("input[name=pCode]").val();
         var pName = $("input[name=pName]").val();
         var pExp = $("input[name=pExp]").val();
         var ptName = $("input[name=ptName]").val();
         var price1 = $("input[name=price1]").val();
         var price2 = $("input[name=price2]").val();
         var flavor = $("input[name=flavor]").val();
         var taste = $("input[name=taste]").val();
         var allergy = $("input[name=allergy]").val();
         var age = $("input[name=age]").val();
         var arr = {
               "pCode" : pCode,
               "pName": pName,
               "pExp" : pExp,
               "ptName" : ptName,
               "price1" : price1,
               "price2" : price2,
               "flavor" : flavor,
               "taste" : taste,
               "allergy" : allergy,
               "age" : age
         };
         //console.log(arr);
         //출력됨
             $.ajax({
               url: "<%=request.getContextPath()%>/selectProductAllList",
               data: arr,
               type: "get",
               success: function(data){
                     console.log("상품 검색 성공");
                     $tableBody = $(".productSearchListTable tbody");
                     $tableBody.html('');
                     $tableBody.find("tr").remove();
                     var num = 1;
                         for(var key in data){
                            var $tr =  $("<tr>").attr('class','listBody');
                            var $td1 = $("<td>").html('<input type="checkbox" name="chk" onclick="only(this)">');
                            console.log("확인" + data[key].changeName);
                            var $td2 = $("<td>").text(num);
                            num += 1;
                            var $td3 = $("<td>").text(data[key].pCode);
                            var $td4 = $("<td>").text(data[key].pName);
                            var imageName = data[key].changeName;
                            console.log("이미지 이름 : " + imageName);
                            var $td5 = $("<td>").html('<img src="<%=request.getContextPath()%>/product_uploadImages/' + imageName + '" width="60px" height="auto">');
                            var $td6 = $("<td>").text(data[key].ptName);
                             var $td7 = $("<td>").text(data[key].price);
                             var $td8 = $("<td>").text(data[key].flavor);
                             var $td9 = $("<td>").text(data[key].taste);
                            var $td10 = $("<td>").text(data[key].allergy);
                            var $td11 = $("<td>").text(data[key].pExp + '개월');
                            var $td12 = $("<td>").text(data[key].age);
                            $tr.append($td1);
                             $tr.append($td2);
                             $tr.append($td3);
                             $tr.append($td4);
                             $tr.append($td5);
                             $tr.append($td6);
                             $tr.append($td7);
                             $tr.append($td8);
                             $tr.append($td9);
                             $tr.append($td10);
                             $tr.append($td11);
                            $tr.append($td12);
                            $tableBody.append($tr);
                         }   
                      
                         
                      alert("조회 성공하셨습니다");
                         
                         
                },
                error: function(error){
                   alert("조회에 실패했습니다 ^-^!!");
                }
            }); 
         });
      });




   //추가 버튼 클릭시
   function addProduct() {
      location.href="<%=request.getContextPath() %>/views/product/productAdd.jsp";
   };


   //수정 버튼 클릭시 상품정보 업데이트 함수를 실행한다.
   $("#btnUpdateProduct").click(function(){
      //함수를 실행했을 때 2가지 경우로 나누고 if, else 구문을 사용한다.
      //checked 속성이 들어간 체크박스 요소들을 선택자로 찾아낸 후 길이가 1보다 작으면(체크 된것이 없는 것)
       if ($("input:checkbox[name=chk]:checked").length < 1) {
         //체크박스가 선택이 안된 상태로 수정하기 버튼을 눌렀을 경우에 alert 창을 띄워주고
           alert("체크박스 체크 후 수정버튼을 눌러주세요");
           //다시 원래 화면으로 돌아감
           return false;
       }else{//체크 박스 클릭한 경우엔 그대로 진행해준다. 
      //수정할 대상의 상품 코드가 담길 변수를 만든다.
         var strUpdate = "";
         //체크박스 업데이트 변수에 name 이 chk이고 checked 속성인(:) input 타입 요소들을 담는다.
         var checkOK = $("input[name=chk]:checked");
            //각 요소들에 each(function(i){} 을 이용해서 반복문을 실행한다.
         checkOK.each(function(i){
            //checkbox 요소인 input type 요소들의 부모인 td, 그리고 td의 부모인 tr 중에서 i번째 순서인 tr을 담는다. 
            var trUpdate = checkOK.parent().parent().eq(i);
            //td 변수에는 tr의 자손요소인 td를 담는다. 
            var tdUpdate = trUpdate.children();
            //현재 선택된 tr안에 있는 td들 중에서 세번째 td를 선택한 후 그 안에 있는 문자를 가져온다.
            //$(셀렉터).html() : 하위에 있는 자식 태그들을 태그나 문자 상관없이 다 가져온다. > <  안에 있는 것 전부
            //$(셀렉터).text() : 하위에 있는 자식 태그들의 문자열만 출력한다.
            //text()라서 세번째 td의 내용인 상품코드를 가져온다.
            strUpdate = tdUpdate.eq(2).text();
            console.log(strUpdate);  //콘솔에서 확인해봄.
               //strUpdate가 변수라서 "로 주소 닫아주고 + 해줌.
               //? 하고 key=value&이런식으로 써준다.
            location.href="<%=request.getContextPath() %>/updateProductSelect?tCode=" + strUpdate;
          });
      }
   });
   
/***************************************************************************************/
//삭제 버튼 클릭시 상품 조회 안되게 update 하기
      $("#btnDeleteProduct").click(function(){
         //체크 된 것 조회 불가능하게 상태 UPDATE
         var str = "";
         var checkbox = $("input[name=chk]:checked");
            checkbox.each(function(i){
               var tr = checkbox.parent().parent().eq(i);
               var td = tr.children();
               str = td.eq(2).text();
            });
         var pCode = str;
         //console.log(str);
          $.ajax({
            url: "<%=request.getContextPath()%>/delProduct",
            data: {"pCode" : pCode},
            type: "get",
            success: function(data){
            //console.log("성공");
               if(data > 0){
                  alert("삭제 성공!");
                  //새로 고침함
                  location.reload();
                  /************************************************************/
               }else{
                  alert("삭제 실패!");
               }
             },
             error: function(error){
                console.log("에러!" + error);
             }
         }); 
      });



</script>


</html>