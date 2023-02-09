<%@page import="com.mysql.cj.protocol.OutputStreamWatcher"%>
<%@page import="javax.swing.filechooser.FileNameExtensionFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="msg.MsgDAO" %>
<%@ page import="msg.MsgDTO" %>

<%
	int MsgCode = Integer.parseInt(request.getParameter("MsgCode"));
	MsgDAO dao = new MsgDAO();
	MsgDTO dto = dao.selectView(MsgCode);
	
	/*
	if(request.getParameter("uri").toString().matches("(.*)SND(.*)")) {
		dto = dao.selectSndView(MsgCode);
	} else if(request.getParameter("uri").toString().matches("(.*)DEL(.*)")) {
		dto = dao.selectDelView(MsgCode);
	} else if(request.getParameter("uri").toString().matches("(.*)IMP(.*)")) {
		dto = dao.selectImpView(MsgCode);
	}
	*/
	
	String MsgFName = dto.getMsgFName();
	String MsgFPath = dto.getMsgFPath() + MsgFName;
	File oFlie = new File(MsgFPath);
	byte [] b = new byte[10*1024*1024];
	FileInputStream in = new FileInputStream(oFlie);
	String sMimeType = getServletContext().getMimeType(MsgFPath);
	
	System.out.print("유형:"+ sMimeType);

	if(sMimeType==null) {
		sMimeType="application.octec-stream";
	}

	response.setContentType(sMimeType);
	String sEncoding = URLEncoder.encode(MsgFName,"utf-8");
	String AA = "Content-Disposition";
	String BB = "attachment; filename="+sEncoding;
	response.setHeader(AA,BB);
	
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead = 0;
	while((numRead=in.read(b,0,b.length))!=-1) {
		out2.write(b,0,numRead);
	}
	
	dao.close();
	
	out2.flush();
	out2.close();
	in.close();
%>
