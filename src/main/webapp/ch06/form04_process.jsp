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
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH06") %></h1>
			<p class="services_text">각 챕터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
					<%!
						public String getHobby(String hobby){
							String hob = null;
							if("book".equals(hobby))
								hob = "독서";
							if("sports".equals(hobby))
								hob = "운동";
							if("movie".equals(hobby))
								hob = "영화감상";
							return hob;
						}
					%>
					<%
						request.setCharacterEncoding("utf-8");
					
						String id = request.getParameter("id");
						String pw = request.getParameter("pw");
						String name = request.getParameter("name");
						String phone1 = request.getParameter("phone1");
						String phone2 = request.getParameter("phone2");
						String phone3 = request.getParameter("phone3");
						String gender = request.getParameter("gender");
						String[] hobby = request.getParameterValues("hobby");
						String comment = request.getParameter("comment");
						
					%>	
					<p class="customer_text pt-2">Result</p>
					<p class="ddit_text">
						아이디 : <%=id %><br>
						비밀번호 : <%=pw %><br>
						이름 : <%=name %><br>
						연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %><br>
						성별 : <%=gender.equals("M") ? "남자" : "여자" %><br>
						취미 : 
						<%
							if(hobby != null){
								for(int i = 0; i < hobby.length; i++){
									out.println(" " + getHobby(hobby[i]));
								}
							}
						%>
					</p>
					<p class="ddit_text" style="white-space:pre-wrap">가입인사 : <%=comment %><br></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
</html>