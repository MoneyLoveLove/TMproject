<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>

<%
	String mId = session.getAttribute("id").toString();
	String mPw = session.getAttribute("pw").toString();
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(mId, mPw);
	ArrayList<MemberDTO> teamList = dao.teamName();
	ArrayList<MemberDTO> positionList = dao.positionName();
	dao.close();
	
	String tCode = dto.gettCode();
	String pCode = dto.getpCode();
	
	String[] email = dto.getmEmail().split("@");
	String mail1 = email[0];
	String mail2 = email[1];
%>

<jsp:include page="CSS.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
</head>
<body style="overflow:hidden">

<jsp:include page="Sidebar.jsp"></jsp:include>
<jsp:include page="Top.jsp"></jsp:include>

<script>
	function updateMember() {
		var form = document.updateForm;
		if(!form.password_confirm.value) {
			alert("비밀번호 확인을 입력해주세요.");
			return false;
		} else if(form.password.value != form.password_confirm.value) {
			alert("비밀번호 확인이 잘못되었습니다.");
			return false;
		} else if(form.password.value.length > 21 || form.password.value.length < 4) {
			alert("비밀번호는 4~20자까지 입력해주세요.");
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
		} else {
			form.action = "UpdateProcess.jsp";
			form.method = "post";
			form.submit();
		}
	}
</script>

<nav class="navbar">
<div class="container">
	<div class="col-md-12" style="margin:30px 0px 40px 0px">
		<h1 class="display-3">내 정보 수정</h1>
		<br><hr>
	</div>

	<div class="col-md-12">
		<form name="updateForm" class="form-horizontal">
		
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">아이디</label>
				<div class="col-md-auto" style="color:grey">
					<%=mId %>
					<input type="text" name="id" value="<%=mId %>" hidden>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">비밀번호 변경</label>
				<div class="col-md-auto">
					<input type="password" name="password" class="form-control"
							oninput="this.value=this.value.replace(/[\W]/, '');"
							placeholder="비밀번호" value="<%=mPw %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">비밀번호 확인</label>
				<div class="col-md-auto">
					<input type="password" name="password_confirm" class="form-control"
							placeholder="비밀번호 확인">
				</div>	
			</div>
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">이름</label>
				<div class="col-md-auto" style="color:grey">
					<% if(pCode.equals("PR") || pCode.equals("AD")) {%>
						<input type="text" name="name" value="<%=dto.getmName() %>" class="form-control">
					<% } else { %>
						<%=dto.getmName() %>
						<input type="text" name="name" value="<%=dto.getmName() %>" class="form-control" hidden>
					<% } %>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">소속 팀</label>
				<div class="col-md-auto" style="color:grey">
					<% if(pCode.equals("PR") || pCode.equals("AD")) {%>
						<select name="team" class="form-control" style="width:207px">
					<% 
						for(int i=0; i<teamList.size();i++) {
							MemberDTO team = teamList.get(i);
					%>
						<option value="<%=team.gettCode() %>"
							<% if(tCode.equals(team.gettCode())) {%> selected <%}%>>
								<%=team.gettName() %></option>
					<% } %>
				
					
					</select>
					<% } else {%>
						<%=dto.gettName()%>
						<input type="text" name="team" value="<%=dto.gettCode()%>" hidden>
					<% } %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">직급</label>
				<div class="col-md-auto" style="color:grey">
					<% if(pCode.equals("PR") || pCode.equals("AD")) {%>
						<select name="position" class="form-control" style="width:207px">
					<%
						for(int i=0; i<positionList.size();i++){
							MemberDTO position = positionList.get(i);
					%>
						<option value="<%=position.getpCode()%>"
							<% if(pCode.equals(position.getpCode())) {%> selected <%}%>>
								<%=position.getpName() %></option>
				
					<% } %>
					</select>
					<% } else { %>
						<%=dto.getpName() %>
						<input type="text" name="position" value="<%=dto.getpCode() %>" hidden>
					<% } %>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">휴대폰</label>
				<div class="col-md-auto" style="color:grey">
					<input type="text" name="phone" class="form-control"
							placeholder="전화번호"
							oninput="this.value=this.value.replace(/[\D]/, '');" value="<%=dto.getmCall() %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">주소</label>
					<div class="col-md-6">
						<input type="text" name="address" class="form-control"
								placeholder="주소" value="<%=dto.getmAddr() %>">
					</div>	
				</div>
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">이메일</label>
				<div class="col-md-auto">
					<input type="text" name="mail1" value="<%= mail1 %>">@
					<select name="mail2" >
						<option value="naver.com"
							<% if(mail2.equals("naver.com")){%> selected <%}%>>
								naver.com</option>
						<option value="daum.net"
							<% if(mail2.equals("daum.net")){%> selected <%}%>>
								daum.net</option>
						<option value="nate.com"
							<% if(mail2.equals("nate.com")){%> selected <%}%>>
								nate.com</option>
						<option value="gmail.com"
							<% if(mail2.equals("gmail.com")){%> selected <%}%>>
								gmail.com</option>
						<option value="yahoo.com"
							<% if(mail2.equals("yahoo.com")){%> selected <%}%>>
								yahoo.com</option>
						<option value="kakao.com"
							<% if(mail2.equals("kakao.com")){%> selected <%}%>>
								kakao.com</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3" style="font-weight:bold">입사일</label>
				<div class="col-md-auto" style="color:grey">
					<input type="date" name="join" class="form-control" 
							value="<%=dto.getmJoin() %>"
								<% if(!(pCode.equals("PR") || pCode.equals("AD"))){%> readonly <%}%>>
				</div>	
			</div>
			
			
			<div style="float:right">
				<input type="submit" onclick="updateMember()"
						class="btn btn-primary" value="수정하기">
			</div>
		</form>	
	</div>
</div>

</div>
</nav>

</body>
</html>