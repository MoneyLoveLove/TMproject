<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
<%
	String code = request.getParameter("MsgCode");
	int MsgCode = Integer.parseInt(code);
	MsgDAO dao = new MsgDAO();
	
	MsgDTO dto = dao.selectView(MsgCode);
	dao.close();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Sidebar.jsp"></jsp:include>
	<jsp:include page="Top.jsp"></jsp:include>
	
	<form name="writeFrm">
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<%=dto.getMsgCode() %>
				<td><%=dto.getMsgTitle() %></td>
				<td><%=dto.getMsgDate() %></td>
			</tr>
			<tr>
				<td>보낸 사람</td>
				<td><%=dto.getMsgSender() %></td>
				
			
			<tr>
				<td>내용</td>
				<td colspan="3" height="100">
				<%=dto.getMsgContent().replace("\r\n","<br/>") %></td>
			</tr>
			
			
				<td colspan="4" align="center">
				<button type="button" onclick="location.href='MSG_RCV.jsp';">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>