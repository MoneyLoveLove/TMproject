<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	int chkCode = Integer.parseInt(request.getParameter("sendCode"));
	MsgDAO dao = new MsgDAO();
	MsgDTO dto = dao.selectView(chkCode);
	MsgDTO dtoS = dao.selectImpViewS(chkCode);
	
	if(request.getHeader("referer").matches("(.*)RCV(.*)")) {
		dao.updateNm(chkCode);
		response.sendRedirect("MSG_RCV.jsp");
	} else if(request.getHeader("referer").matches("(.*)IMP(.*)")) {
		if(dto.getMsgTitle() != null) {
			dao.updateNm(chkCode);
			if(dtoS.getMsgTitle() != null) {
				dao.updateNmS(chkCode);
			}
		}
		response.sendRedirect("MSG_IMP.jsp");
	} else if(request.getHeader("referer").matches("(.*)SND(.*)")) {
		dao.updateNmS(chkCode);
		response.sendRedirect("MSG_SND.jsp");
	} else {
		return;
	}
	
	dao.close();
%>
