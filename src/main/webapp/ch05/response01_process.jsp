<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>

<body>
	<%@ include file="/module/header2.jsp"%>
	
	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH05") %></h1>
			<p class="services_text">각 챕터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
					<%
						request.setCharacterEncoding("utf-8");
					
						String userId = request.getParameter("id");
						String userPw = request.getParameter("pw");
						
						// 폼 태그로부터 전송받은 아이디와 비밀번호가 일치하면  response01_success로 이동
						if(userId.equals("admin")&&userPw.equals("1234")){
							response.sendRedirect("response01_success.jsp?id="+userId);
						}else{
							response.sendRedirect("response01_failed.jsp?id="+userId);
						}
					%>	
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
</html>