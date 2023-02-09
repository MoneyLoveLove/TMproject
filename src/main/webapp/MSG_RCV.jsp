<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="msg.MsgDTO"%>
<%@ page import="msg.MsgDAO"%>

<%
	MsgDAO dao = new MsgDAO();
	String mId = session.getAttribute("id").toString();
	List<MsgDTO> msgList = dao.selectMsg(mId);

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

<div class="container">
	<div class="col-sm-auto" align="left">
		<h1 class="display-3">받은 메세지</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			
			<!-- 메세지 검색 -->
			<form method="get">  
			    <table width="100%">
				    <tr>
						<td align="right">
							<select name="searchField" class="form-control"
								style="width:90px; float:left; margin-right:10px">
								<option value="title">제목</option> 
								<option value="content">내용</option>
							</select>
							<input type="text" name="searchWord" class="form-control"
							style="width:240px; float:left; margin-right:10px">
							<input type="submit" value="검색하기" class="btn btn-secondary"
							style="float:left; margin-right:10px">
						</td>
				    </tr>   
			    </table><br>
		    </form>
		    
		    <!-- 받은 메세지 -->
		    <table class="table table-hover" width="100%">
			        <!-- 각 칼럼의 이름 --> 
			        <tr align="center">
			            <th width="5%">@</th>
			            <th width="5%">@</th>
			            <th width="20%">보낸 사람</th>
			            <th width="50%">제목</th>
			            <th width="20%">보낸 날짜</th>
			        </tr>
			        
			        <% if(msgList.isEmpty()) { %>
			        <tr>
				        <td colspan="5" align="center">
				        	<br>받은 메세지가 없습니다.
				        </td>
			        </tr>
			        
			        <%
			        } else {
			        	for(MsgDTO dto : msgList) {
			        %>
					<tr align="center">
						<td>null</td>
						<td>null</td>
						<td><%=dto.getMsgSender() %></td>
						<td><a href="View.jsp?MsgCode=<%=dto.getMsgCode() %>"><%=dto.getMsgTitle() %></a></td>
						<td><%=dto.getMsgDate() %></td>
					</tr>
					<% } } %>
			    </table>
			    
		</div>
	</div>
</div>

</body>
</html>