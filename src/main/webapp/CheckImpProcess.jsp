<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	int chkCode = Integer.parseInt(request.getParameter("sendCode"));
	MsgDAO dao = new MsgDAO();
	
	if(request.getHeader("referer").matches("(.*)RCV(.*)")) {
		dao.updateImp(chkCode);
		response.sendRedirect("MSG_RCV.jsp");
	} else if(request.getHeader("referer").matches("(.*)IMP(.*)")) {
		dao.updateImp(chkCode);
		response.sendRedirect("MSG_IMP.jsp");
	} else if(request.getHeader("referer").matches("(.*)SND(.*)")) {
		dao.updateImpS(chkCode);
		response.sendRedirect("MSG_SND.jsp");
	} else {
		return;
	}
	
	dao.close();
%>
