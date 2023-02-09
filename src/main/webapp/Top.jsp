<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO"%>
<%@ page import="msg.MsgDAO"%>
    
<%
	String mId = session.getAttribute("id").toString();
	String mName = session.getAttribute("name").toString();
	String mPst = session.getAttribute("position").toString();
	MsgDAO dao = new MsgDAO();
	int newMsg = dao.askNewMsg(mId);
%>

<jsp:include page="CSS.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
</head>
<body>

<script>
	function adminMenu() {
		var form = document.memberForm;
		form.action = "AdminPage.jsp"
		form.method = "post"
		form.submit();
	}
	function memberInfo() {
		var form = document.memberForm;
		form.action = "Profile.jsp"
		form.method = "post"
		form.submit();
	}
	function logoutMsg() {
		var form = document.memberForm;
		form.action = "Logout.jsp"
		form.method = "post"
		form.submit();
		alert("로그아웃되었습니다.");
	}
</script>

<nav class="navbar" style="border-bottom:rgb(234, 234, 244) 1px solid">
	<div class="container">
	
		<div class="navbar-header">
			<span class="navbar-brand"><%=mName %>(<%=mId %>)</span>
			
			<% if(newMsg > 0) { %>		
				<input type="button" value="<%=newMsg %>" align="center"
					style="width:27px; height:27px; align-items:center;
						background:salmon; color:white; font-size:0.8rem; font-weight:bold;
							border-radius:100px; border:NONE">
				<a href="MSG_RCV.jsp" class="navbar-brand"
					style="font-size:1rem; font-weight:bold; color:salmon">새로운 메세지</a>
			<% } %>
		</div>
		
		<div class="navbar-header" align="right">
			<% if(mId != null) { %>
				<form name="memberForm">
					<% if(mId.equals("admin")) { %>
						<input type="submit" onclick="adminMenu()" value="회원관리"
							class="btn btn-info">
					<% } %>
					<input type="submit" onclick="memberInfo()" value="내 정보"
						class="btn btn-default" style="border:lightgray 1px solid; background:NONE; color:#1E90FF">
					<input type="submit" onclick="logoutMsg()" value="로그아웃"
						class="btn btn-default" style="border:lightgray 1px solid; background:NONE; color:#1E90FF">
				</form>
			<% } else { response.sendRedirect("LoginForm.jsp"); } %>
		</div>
		
	</div>
</nav>

</body>
</html>