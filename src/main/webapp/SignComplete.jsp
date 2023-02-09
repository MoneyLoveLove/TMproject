<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
<jsp:include page="CSS.jsp"></jsp:include>
</head>
<body style="background:#5882FA">

<script>
	alert("가입이 완료되었습니다. 아이디를 확인해주세요.");
</script>

<div class="container" style="background:white; width:500px; height:400px;
								border-radius:30px; justify-content:center">
	<div class="row" style="justify-content:center; margin-top:40%">
	
		<div align="center">
			<h1 class="display-3" style="color:#5882FA; font-size:3.3rem;
									padding-top:10px; font-weight:bold">TEAM MESSENGER</h1>
			<hr>
		</div>
	
		<div class="col-md-auto" style="margin-top:60px">
		
			<div align="center">
				<div class="col-md-auto" style="padding-bottom:60px">
					<p>가입을 축하드립니다.
					<p class="display-3" style="font-size:1.4rem; font-weight:bold">아이디는 <%=session.getAttribute("signId") %>입니다.
				</div>
				<div class="col-md-auto">
					<button type="button" onclick="location.href='LoginForm.jsp';"
							class="btn btn-primary">로그인</button>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>