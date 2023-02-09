<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "msg.MsgDTO" %>    
<%@ page import = "msg.MsgDAO" %>    

<%

	request.setCharacterEncoding("utf-8");
	String userName = session.getAttribute("name").toString();

	String sender = userName; 
	String receiver = request.getParameter("receiver");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	
	MsgDTO dto = new MsgDTO();
	dto.setMsgSender(sender);
	dto.setMsgReceiver(receiver);
	dto.setMsgTitle(title);
	dto.setMsgContent(content);
	
	// 메시지 보내기
	MsgDAO dao = new MsgDAO();
	int insertResult = dao.insertMsg(dto);
	
	if(insertResult==1){
		response.sendRedirect("MSG_RCV.jsp");
	} else {
		out.println("메시지 보내기 실패");
	}

	// 보낸 메시지함에 보관
//	MsgDAO daoSndMsg = new MsgDAO();
//	int insertSndMsgResult = daoSndMsg.insertSndMsg(dto);
//	if(insertSndMsgResult==1){
//		response.sendRedirect("MSG_SND.jsp");
//	} else {
//		out.println("보낸 메시지 저장 실패");
//	}

	
	
	
%>