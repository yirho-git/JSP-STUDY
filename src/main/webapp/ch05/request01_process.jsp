<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
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
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
					<%
						// 폼에서 한글 입력을 정상적으로 처리할 때 필요함.
						// 폼 페이지에서입력한 한글을 처리하도록 request 내장 객체의
						// setCharacterEncoding() 메소드에 문자 인코딩 utf-8로 작성함
						request.setCharacterEncoding("utf-8");				
					
						// 1. getParameter() 메소드로 넘겨받은 파라미터 꺼내기
						// 입력된 아이디와 비밀번호를 폼 태그로부터 전송받도록 request 내장 객체의
						// getParameter() 메소드를 작성함.
						String userId = request.getParameter("id");
						String userPw = request.getParameter("pw");
						
						// 가져온 데이터 출력
						out.println("<h class='customer_text'>getParameter() 메소드로 출력 </h5>");
						out.println("<p class='ddit_text'>");
						out.println("	아이디 : " + userId + "<br/>");
						out.println("	비밀번호 : " + userPw + "<br/>");
						out.println("</p>");
						
						// 2. getParameterNames() 메소드로 넘겨받은 파라미터 꺼내기
						
						// request로 넘어온 파라미터의 key(input요소의 name값)들을 꺼낸다.
						// Enumeration은 컬렉션은 Set의 iterator의 형태와 비슷하다.
						Enumeration<String> enumer = request.getParameterNames();
						
						out.println("<h5 class='customer_text'>getParameterNames() 메소드로 출력</h5>");
						out.println("<p class='ddit_text'>");
						// hasMoreElements() 메소드를 통해 키가 있는지 여부를 확인한다						
						while(enumer.hasMoreElements()){
							// nextElement() 메소드를 통해 키를 꺼낸다.
							String key = enumer.nextElement();
							String value = request.getParameter(key);
							out.println("KEY:" + key + ",VALUE :" +  value + "<br/>");
						}
						
						out.println("</p>");
						
						// 3. getParameterMap() 메소드로 넘겨받은 파라미터 꺼내기
						out.println("<h5 class='customer_text'>getParameterMap() 메소드로 출력</h5>)");
						Map<String, String[]> paramMap = request.getParameterMap();
						out.println("<p class='ddit_text'>");
						// value값으로 String[]타입이 들어오므로 idx를 설정하여 값을 꺼낸다.
						out.println("	아이디 : " + paramMap.get("id")[0]+"<br/>");
						out.println("	비밀번호 : " + paramMap.get("pw")[0]+"<br/>");
						out.println("</p>");
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