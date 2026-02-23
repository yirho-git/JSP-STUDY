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
	String info = (String)session.getAttribute("SessionInfo");
%>

<h1>결과</h1>
	<p>생년월일 : ${bir }</p>	
	<p>이메일 : ${email }</p>	
	<p>SessionInfo : ${sessionScope.SessionInfo } </p>
</body>
</html>