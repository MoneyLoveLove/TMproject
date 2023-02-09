<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="msg.MsgDTO"%>
<%@ page import="msg.MsgDAO"%>
<%@ page import="member.MemberDTO"%>
<%@ page import="member.MemberDAO"%>

<%
	MsgDAO dao = new MsgDAO();
	MemberDAO daoMem = new MemberDAO();
	String mId = session.getAttribute("id").toString();
	SimpleDateFormat dateFormat= new SimpleDateFormat("yy-MM-dd HH:mm");

	Map<String, Object> param = new HashMap<>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int count = dao.selectCountD(mId, param);
	String tempStart = request.getParameter("page");
	int startPage = 0;
	int onePageCount = 10;	// 10개씩 출력
	count = (int)Math.ceil((double)count/(double)onePageCount);
	if(tempStart != null) { 
		startPage = (Integer.parseInt(tempStart)-1)*onePageCount;
	}
	
	List<MsgDTO> msgList = dao.selectPageD(mId, startPage, onePageCount, param);
	
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
<jsp:include page="CSS.jsp"></jsp:include>
</head>
<body style="overflow:hidden">

<jsp:include page="Sidebar.jsp"></jsp:include>
<jsp:include page="Top.jsp"></jsp:include>

<script>
	var msgCode = "";
	var index = false;
	var bool = false;
	
	function checkMsg(obj) {
		var form = document.checkForm;
		var chkMsg = document.getElementsByName("rowCheck");
		var check = obj.checked;
		if(check) {
			if(index) {
				msgCode = msgCode + '-';
			}
			msgCode = msgCode + obj.value;
			index = true;
		} else {
			msgCode = "";
			index = false;
			for(var i=0; i<=chkMsg.length; i++) {
				if(chkMsg[i].type == "checkbox" && chkMsg[i].checked) {
					if(index) {
						msgCode = msgCode + '-';
					}
					msgCode = msgCode + chkMsg[i].value;
					index = true;
				}
			}
		}
		console.log(msgCode);
	}
	
	function deleteMsg() {
		var form = document.checkForm;
		var chkMsg = document.getElementsByName("rowCheck");
		var checkList = "";
		
		for(var i=0; i<chkMsg.length; i++) {
			if(chkMsg[i].checked) {
				if(bool) {
					checkList = checkList + '-';
				}
				checkList = checkList + chkMsg[i].value;
				bool = true;
			}
		}
		console.log(checkList);
		if(!bool) {
			alert("메세지를 선택해주세요.");
			return;
		}
		var confirmed = confirm("메세지를 영구히 삭제하시겠습니까?");
		if(confirmed) {
			alert("선택된 메세지가 삭제되었습니다.")
			form.chkCode.value = checkList;
			form.action = "DeleteChkProcess.jsp";
			form.method = "post";
			form.submit();
		}
	}
	
	function checkAll(obj) {
		var chkMsg = document.getElementsByName("rowCheck");
		var count = chkMsg.length - 1;
		var check = obj.checked;
		if(check) {
			msgCode = "";
			index = false;
			for(var i=0; i<=count; i++) {
				if(chkMsg[i].type == "checkbox") {
					if(index) {
						msgCode = msgCode + '-';
					}
					msgCode = msgCode + chkMsg[i].value;
					index = true;
					chkMsg[i].checked = true;
					console.log(chkMsg[i].value, "true");
				}
			}
		} else {
			for(var i=0; i<=count; i++) {
				if(chkMsg[i].type == "checkbox") {
					chkMsg[i].checked = false;
					index = false
					msgCode = "";
					console.log(chkMsg[i].value, "false");
				}
			}
		}
		console.log(msgCode);
	}
</script>

<nav class="navbar">
<div class="container">
	<div class="col-md-12" align="left" style="margin:30px 0px 40px 0px">
		<h1 class="display-3">휴지통</h1>
	</div>
	
	<div class="row" style="width:100%">
		<div class="col-md-12">
			
			<!-- 메세지 검색 -->
			<form name="searchForm" method="get">  
			    <table width="100%">
				    <tr>
						<td align="right">
							<select name="searchField" class="form-control"
								style="width:120px; float:left; margin-right:10px">
								<option value="SENDER">보낸 사람</option>
								<option value="RECEIVER">받는 사람</option>
								<option value="MSG_TITLE">제목</option>
								<option value="MSG_CNT">내용</option>
							</select>
							<input type="text" name="searchWord" class="form-control"
								style="width:360px; float:left; margin-right:10px"
								placeholder="메세지 검색">
							<input type="submit" value="검색" class="btn btn-secondary"
								style="float:left; margin-right:10px">
						</td>
				    </tr>   
			    </table><br>
		    </form>
		    
			<form name="checkForm">
		    	<input type="hidden" name="chkCode">
			    	<table class="table" width="100%"
			 	  		style="border-bottom:lightgray 1px solid">
			        <tr align="center">
						<th width="5%">
							<input type="checkbox" name="chkAllBTN" onclick="checkAll(this)">
						</th>
						<th width="10%"></th>
						<th width="15%">보낸 사람</th>
						<th width="50%">제목</th>
						<th width="20%">보낸 날짜</th>
			        </tr>
			        
			        <% if(msgList.isEmpty()) { %>
				        <tr>
					        <td colspan="5" align="center">
					        	받은 메세지가 없습니다.
					        </td>
				        </tr>
			        
			        <%
			        } else {
			        	for(int i=0; i<msgList.size(); i++) {
			        		MsgDTO dto = msgList.get(i);
			        %>
					<tr align="center">
						<td>
							<input type="checkbox" name="rowCheck"
								onclick="checkMsg(this)" value="<%=dto.getMsgCode() %>">
						</td>
						<td></td>
						<td><%=daoMem.nameS(dto.getMsgSender()) %></td>
						<td style="padding:0px">
							<button type="button" class="btn btn-link" style="width:100%; height:49px"
									onclick="location.href='MSG_View.jsp?MsgCode=<%=dto.getMsgCode() %>';">
								<%=dto.getMsgTitle() %>
								<% if(dto.getMsgFName() != null) { %>
									<img src="data:image/png;base64,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"
										alt="file" style="width:16px; height:16px; margin-bottom:4px">
								<% } %>
							</button>
						</td>
						<td><%=dateFormat.format(dto.getMsgDate()) %></td>
					</tr>
				<% } } %>
			    </table>
			    
			    <div align="center">
					<%
					for(int i=1; i<=count; i++) {
						if(searchWord != null) {
					%>
						<input type="button" value="<%=i %>" class="btn btn-secondary"
							onclick="location.href='MSG_DEL.jsp?page=<%=i%>&searchField=<%=searchField%>&searchWord=<%=searchWord%>';"
							style="border-radius:100px; width:40px; height:40px;
							align-items:center; justify-content:center;
							background:#D8D8D8; border:NONE; font-weight:bold">
					<% } else { %>
						<input type="button" value="<%=i %>" class="btn btn-secondary"
							onclick="location.href='MSG_DEL.jsp?page=<%=i%>';"
							style="border-radius:100px; width:40px; height:40px;
							align-items:center; justify-content:center;
							background:#D8D8D8; border:NONE; font-weight:bold">
					<%
						}
					}
					%>
					<button type="submit" onclick="deleteMsg()"
						style="float:right" class="btn btn-warning">삭제하기</button>
				<div>
		    </form>
			    
		</div>
	</div>
</div>
</nav>

</body>
</html>