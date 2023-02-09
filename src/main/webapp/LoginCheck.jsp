<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		if(session.getAttribute("id")==null){
			out.print("로그인 후 이용해 주세요.");
			return;
		}
	%>
	
</body>
</html>