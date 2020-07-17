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
					errorsMessage = "회원 가입에 실패하였습니다!!";
					movePath = "<%= request.getContextPath() %>/views/common/join.jsp";
					break;
				case "loginUser" : 
					errorsMessage = "로그인에 실패하였습니다!!";
					movePath = "<%= request.getContextPath() %>/views/common/login.jsp";
					break;
				case "equipmentList" : 
					errorsMessage = "설비 게시판 조회에 실패하였습니다!!";
					movePath = "<%= request.getContextPath() %>/views/common/equipmentList.jsp";
					break;
				case "updatePwdCheck" : 
					errorsMessage = "비밀번호가 일치하지 않습니다!!";
					movePath = "<%= request.getContextPath() %>/views/common/userUpdateInfoPwdCheck.jsp";
					break;
				case "updateUser" : 
					errorsMessage = "회원정보 수정에 실패했습니다!!";
					movePath = "<%= request.getContextPath() %>/views/common/userUpdateInfoPwdCheck.jsp";
					break;
				case "selectBoardList" : 
					errorsMessage = "게시판을 읽어오는데 실패했습니다!!";
					movePath = "<%= request.getContextPath() %>/index.jsp";
					break;
			}
			alert(errorsMessage);
			
			location.href = movePath;
			
		})();
	</script>
</body>
</html>