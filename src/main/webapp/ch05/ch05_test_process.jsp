<%@page import="java.lang.reflect.AccessFlag.Location"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
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
						<!-- 
							문제를 풀어봅시다
							1. cho05_test.jsp에서 전송받은 모든 데이터를 tablib를 이용하여 출력해주세요.
							
							[출력 예시]
							아이디 : a001
							비밀번호 : 1234
							이름 : 홍길동
							성별 : 남자
							핸드폰번호 : 010-1234-1234
							주소 : 대전시 중구 오류동 123
							
							2. 출력을 완료했으면, 5초 뒤에 www.naver.com 홈페이지로 이동시켜 주세요
							- 1) 헤더를 이용한 방법
							- 2) 스크립트를 활용한 방법
							
							두가지 방법 모두 또는 두개중에 한개를 선택해서 구현해주세요.
						 -->
						 
						 <%
// 						 	String id = request.getParameter("id");
// 						 	String pw = request.getParameter("pw");
// 						 	String name = request.getParameter("name");
// 						 	String gender = request.getParameter("gender");
// 						 	String tel = request.getParameter("tel");
// 						 	String addr = request.getParameter("addr");
						 	
// 						 	out.println("	아이디 : " + id + "<br/>");
// 							out.println("	비밀번호 : " + pw + "<br/>");
// 							out.println("	이름 : " + name + "<br/>");
// 							out.println("	성별 : " + gender + "<br/>");
// 							out.println("	전화번호 : " + tel + "<br/>");
// 							out.println("	주소 : " + addr + "<br/>");
							
// 							response.setHeader("refresh", "5,url=https://naver.com ");
						 %>
						<table class="table table-bordered">
							<tr>
								<td><c:out value="아이디"></c:out></td>
								<td><c:out value="${param.id }"/></td>
							</tr>
							<tr>
								<td><c:out value="비밀번호"></c:out></td>
								<td><c:out value="${param.pw }"/></td>
							</tr>
							<tr>
								<td><c:out value="이름"></c:out></td>
								<td><c:out value="${param.name }"/></td>
							</tr>
							<tr>
								<td><c:out value="성별"></c:out></td>
								<td><c:out value="${param.gender }"/></td>
							</tr>
							<tr>
								<td><c:out value="전화번호"></c:out></td>
								<td><c:out value="${param.tel }"/></td>
							</tr>
							<tr>
								<td><c:out value="주소"></c:out></td>
								<td><c:out value="${param.addr }"/></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
<script>
	setTimeout(() => {
		location.href = "https://www.naver.com";
	}, 5000);
</script>
</body>
</html>