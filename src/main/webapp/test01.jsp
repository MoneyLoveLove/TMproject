<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "msg.MsgDAO" %>
<%@ page import = "msg.MsgDTO" %>
<%@ page import = "msg.RcvMsgDAO" %>
<%@ page import = "msg.RcvMsgDTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 테스트</title>
</head>
<body>

<%
	MsgDAO dao = new MsgDAO();
	ArrayList<MsgDTO> list = dao.getMsgById("admin");
	int num = list.size();
	
	
	
	if(num>0){
		MsgDTO dto = new MsgDTO();
		dto.set
		
		for(MsgDTO msg : list){
			out.println(msg.getMsgSender());
			out.println(msg.getMsgTitle()); 
			out.println(msg.getMsgContent()); 
			out.println(msg.getMsgDate()); %><br/><%
		}
	}
%>
   

</body>
</html>