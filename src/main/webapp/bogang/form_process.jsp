<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String name = request.getParameter("name");
		String bir = request.getParameter("bir");
		String email = request.getParameter("email");
		String domain = request.getParameter("domain");
		
		request.setAttribute("bir", bir);
		request.setAttribute("email", email + "@" + domain);
		session.setAttribute("SessionInfo", "a001님이 보낸 데이터!");
		
		request.getRequestDispatcher("result.jsp").forward(request, response);
	%>
	<h2>proccess</h2>
	<p>아이디 : <%=id %></p>
	<p>비번 : <%=pw %></p>
	<p>비번확인 : <%=pw2 %></p>
	<p>이름 : <%=name %></p>
	<p>생년월일 : ${bir }</p>	
	<p>이메일 : ${email }</p>	
</body>
</html>