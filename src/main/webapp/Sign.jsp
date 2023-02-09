<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> teamList = dao.teamName();
	ArrayList<MemberDTO> positionList = dao.positionName();
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
	function signMsg(){
		var form = document.signForm;
		if(!form.password.value) {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if(!form.password_confirm.value) {
			alert("비밀번호 확인을 입력해주세요.");
			return false;
		} else if(form.password.value != form.password_confirm.value) {
			alert("비밀번호 확인이 잘못되었습니다.");
			return false;
		} else if(form.password.value.length > 21 || form.password.value.length < 4) {
			alert("비밀번호는 4~20자까지 입력해주세요.");
			return false;
		} else if(!form.name.value) {
			alert("이름을 입력해주세요.");
			return false;
		} else if(form.password.value.length > 6 || form.password.value.length < 2) {
			alert("이름은 2~6자까지 입력해주세요.");
			return false;
		} else if(!form.team.value) {
			alert("소속 팀을 확인해주세요.");
			return false;
		} else if(!form.position.value) {
			alert("직급을 확인해주세요.");
			return false;
		} else if(!form.phone.value) {
			alert("전화번호를 입력해주세요.");
			return false;
		} else if(form.phone.value.length > 12 || form.phone.value.length < 9) {
			alert("전화번호는 9~11자까지 입력해주세요.");
			return false;
		} else if(!form.address.value) {
			alert("주소를 입력해주세요.");
			return false;
		} else if(!form.mail1.value) {
			alert("이메일을 입력해주세요.");
			return false;
		} else if(!form.mail2.value) {
			alert("이메일 주소를 확인해주세요.");
			return false;
		} else if(!form.join.value) {
			alert("입사일을 입력해주세요.");
			return false;
		} else {
			form.action = "SignProcess.jsp";
			form.method = "post";
			form.submit();
		}
	}
</script>	

<div class="jumbotron" style="background:#5882FA; color:white">
	<div class="container">
		<div class="col-md-10">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
</div>

<div class="container">
	<div class="col-md-12">
		<div class="row" style="justify-content:center">
			<div class="form-group row">
				<h4 style="background:whitesmoke; border-radius:10px; padding:14px;
							color:#5882FA; font-weight:bold; margin-top:8px">
					회원가입 완료 페이지에서 자동 생성된 아이디를 알려드립니다.
				</h4>
			</div>
		</div>
		
		<form name="signForm" class="form-horizontal">
			<hr><br>
			<div class="form-group row">
				<label class="col-md-3">비밀번호</label>
				<div class="col-md-auto">
					<input type="password" name="password" class="form-control"
							oninput="this.value=this.value.replace(/[\W]/, '');"
							placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3">비밀번호 확인</label>
				<div class="col-md-auto">
					<input type="password" name="password_confirm" class="form-control"
							placeholder="비밀번호 확인">
				</div>	
			</div>
			<div class="form-group row">
				<label class="col-md-3">이름</label>
				<div class="col-md-auto">
					<input type="text" name="name" class="form-control"
							placeholder="이름">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3">소속 팀</label>
				<div class="col-md-auto">
					<select name="team" class="form-control" style="width:207px">
						<% 
							for(int i=0; i<teamList.size();i++) {
								MemberDTO team = teamList.get(i);
						%>
							<option value="<%=team.gettCode() %>">
											<%=team.gettName() %></option>
						<% } %>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3">직급</label>
				<div class="col-md-auto">
					<select name="position" class="form-control" style="width:207px">
						<%
							for(int i=0; i<positionList.size();i++){
								MemberDTO position = positionList.get(i);
						%>
							<option value="<%= position.getpCode()%>">
											<%= position.getpName() %></option>
						<% } %>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3">전화번호</label>
				<div class="col-md-auto">
					<input type="text" name="phone" class="form-control"
							placeholder="전화번호"
							oninput="this.value=this.value.replace(/[\D]/, '');">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3">주소</label>
					<div class="col-md-6">
						<input type="text" name="address" class="form-control"
								placeholder="주소">
					</div>	
				</div>
			<div class="form-group row">
				<label class="col-md-3">이메일</label>
				<div class="col-md-auto">
					<input type="text" name="mail1">@
					<select name="mail2">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="kakao.com">kakao.com</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3">입사일</label>
				<div class="col-md-auto">
					<input type="date" name="join" class="form-control">
				</div>	
			</div><br>
			
			<div align="center">
				<input type="submit" onclick="signMsg()" style="margin-bottom:100px"
					class="btn btn-primary" value="가입하기">	
			</div>							
		</form>	
	</div>
</div>

</body>
</html>