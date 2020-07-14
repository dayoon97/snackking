<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorCode = (String) request.getAttribute("errorCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		/* 스스로 동작하는 함수 */
		(function() {
			
			var errorCode = "<%= errorCode %>";
			
			var errorsMessage = "";
			var movePath = "";
			
			switch(errorCode) {
				case "insertUser" : 
					errorsMessage = "회원 가입에 실패하였습니다!";
					movePath = "<%= request.getContextPath() %>/views/common/join.jsp";
					break;
				case "loginUser" : 
					errorsMessage = "로그인에 실패하였습니다!!";
					movePath = "<%= request.getContextPath() %>/views/common/login.jsp";
					break;
				
			}
			alert(errorsMessage);
			
			location.href = movePath;
			
		})();
	</script>
</body>
</html>