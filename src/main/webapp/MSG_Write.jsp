<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
	String userId = session.getAttribute("id").toString();
	String userPw = session.getAttribute("pw").toString();
	String userName = session.getAttribute("name").toString();
	
	MemberDAO dao = new MemberDAO();
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
	ArrayList<MemberDTO> memberList = dao.getAllMember();
	
	dao.close();
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
</head>
<body>

<jsp:include page="Sidebar.jsp"></jsp:include>
<jsp:include page="Top.jsp"></jsp:include>

<script>
	function writeMsg() {
		var form = document.writeForm;
		if(form.receiver.value == "") {
			alert("receiver null");
			form.receiver.focus();
			return false;
		} else if(form.title.value == "") {
			alert("title null");
			form.title.focus();
			return false;
		} else if(form.content.value == "") {
			alert("content null");
			form.content.focus();
			return false;
		} else {
			alert("message send");
			form.action = "WriteProcess.jsp";
			form.method="post"
			form.submit();
		}
	}
</script>

<div class="container">
	<div class="col-sm-auto" align="left">
		<h1 class="display-3">메세지 작성</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-auto">
			<!-- if -->
			<form name="writeForm">
				<table class="table" width="100%" align="center">
					<tr align="center">
						<td align="center">보내는 사람</td>
						<td align="left">
							<%=session.getAttribute("name") %>
						</td>
					</tr>
					<tr align="center">
						<td align="center">받는 사람</td>
						<td align="left">
							<% if(memberList.isEmpty()) { %>
								<span>null</span>
							<% } else { %>
								<select name="receiver" class="form-control">
							<%
								for(int i=0; i<memberList.size(); i++) {
									MemberDTO member = memberList.get(i);
							%>
								<option value="<%=member.getmId() %>">
									<%=member.gettCode() %>
										<%=member.getmName() %>
											<%=member.getpCode() %></option>
							<% } } %>
								</select>
						</td>
					</tr>
					<tr>
						<td align="center">제목</td>
						<td align="left">
							<input type="text" name="title" placeholder="제목"
							class="form-control" width="200px">
						</td>
					</tr>
					<tr>
						<td align="center">내용</td>
						<td align="left">
							<textarea name="content" rows="20" cols="50"
							placeholder="내용" class="form-control"></textarea>
						</td>
					</tr>
					<tr align="right">
						<td></td>
						<td><input type="submit" value="보내기" onclick="writeMsg()"
							class="btn btn-primary"></td>
						</tr>
				</table>
			</form>
			<!-- else -->
		</div>
	</div>
</div>

</body>
</html>