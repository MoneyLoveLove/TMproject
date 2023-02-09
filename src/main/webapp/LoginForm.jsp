<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Team Messenger</title>
</head>
<body style="background:#5882FA">

<script>
	function loginMsg() {
		var form = document.loginForm;
		if(form.loginId.value == "") {
			alert("id null");
			form.loginId.focus();
		} else if(form.loginPw.value == "") {
			alert("password null");
			form.loginPw.focus();
		} else {
			form.action = "LoginProcess.jsp";
			form.method = "post"
			form.submit();
		}
	}
</script>


<div class="container" style="background:white; width:600px; height:400px;
								border-radius:50px; item-align:center">
	<div class="row">
		<div class="col-sm-auto">
		
		<% if(session.getAttribute("userId") == null ) { %>
			<form name="loginForm">
				<div class="row">
					<label class="col-sm-3">아이디</label>
					<div class="col-sm-auto">
						<input type="text" name="loginId" class="form-control"
						style="width:200px">
					</div>
				</div>
				
				<div class="row">
					<label class="col-sm-3">비밀번호</label>
					<div class="col-sm-auto">
						<input type="password" name="loginPw" class="form-control"
						style="width:200px; float:left; margin-right:10px">
						
						<input type="submit" value="로그인" onclick="loginMsg()"
						class="btn btn-primary" style="float:right">
					</div>
				</div>
			</form>
		<% } else { response.sendRedirect("MSG_RCV.jsp"); } %>
			
		</div>
	</div>
</div>

</body>
</html>