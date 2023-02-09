<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	function logoutMsg() {
		alert("Logout");
	}
</script>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<span class="navbar-brand"><%= session.getAttribute("name") %>(<%= session.getAttribute("id") %>)</span>
		</div>
		<div class="navbar-header" align="right">
			<% if(session.getAttribute("id") == null ) { %>
				<a href="Logout.jsp" onclick="logoutMsg()"
										class="btn btn-warning">로그아웃</a>
			<% } else { response.sendRedirect("LoginForm.jsp"); } %>
		</div>
	</div>
</nav>

</body>
</html>