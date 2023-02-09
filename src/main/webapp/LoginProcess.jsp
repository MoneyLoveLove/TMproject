<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>

<%
	String userId = request.getParameter("loginId");
	String userPw = request.getParameter("loginPw");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
	dao.close();

	if(memberDTO.getmId() != null) {
		session.setAttribute("id", memberDTO.getmId());
		session.setAttribute("pw", memberDTO.getmPw());
		session.setAttribute("name", memberDTO.getmName());
		response.sendRedirect("MSG_RCV.jsp");
	} else {
		request.setAttribute("LoginErrMsg", "로그인 오류입니다." + memberDTO.getmId());
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>