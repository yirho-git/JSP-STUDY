<%@page import="java.util.Enumeration"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>

<style>
.content {display: none;}
#content1 {display : block;}
#content2 {display : block;}
</style>
</head>

<body>
	<%@ include file="/module/header2.jsp"%>
	
	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH06") %></h1>
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						
						<p class="customer_text pt-2">Result</p>
						<select id="menu" onchange="changeContent()" name="solution">
							<option value="">--선택해주세요 </option>
							<option value="scriptlet">스크립틀릿</option>
							<option value="jstl">JSTL</option>
						</select><br>
						
						<div id="jstl" class="content">
							<c:out value="타입 : ${param.type }"/><br>
							<c:out value="아이디 : ${param.id }"/><br>
							<c:out value="비밀번호 : ${param.pw}"/>
							<c:out value="이름 : ${param.name}"/><br>
							<c:out value="핸드폰번호 : ${param.phone1}"/>-
							<c:out value="${param.phone2}"/>-
							<c:out value="${param.phone3}"/><br>
							<c:set var="list" value="${paramValues.hobby}"/>
							<c:out value="취미 : "/>
							<c:forEach items="${list }" var="n">
								<c:if test="${n eq 'development' }">
									<c:out value="개발"/>
								</c:if>
								<c:if test="${n eq 'book' }">
									<c:out value="독서"/>
								</c:if>
								<c:if test="${n eq 'sports' }">
									<c:out value="운동"/>
								</c:if>
								<c:if test="${n eq 'movie' }">
									<c:out value="영화감상"/>
								</c:if>
								<c:if test="${n eq 'music' }">
									<c:out value="음악"/>
								</c:if>
								<c:if test="${n eq 'etc' }">
									<c:out value="${etc }"/>
								</c:if>
							</c:forEach><br>
							<c:out value="가입인사 : ${param.comment }"/><br>
						</div>
						
				   <%!
				   	public String getHobby(String hobby){
					   String hob = null;
					   	if("development".equals(hobby))
							hob = "개발";
					   	if("book".equals(hobby))
							hob = "독서";
						if("sports".equals(hobby))
							hob = "운동";
						if("movie".equals(hobby))
							hob = "영화감상";
						if("music".equals(hobby))
							hob = "음악감상";
						if("etc".equals(hobby))
							hob = "기타";
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
					<div id="scriptlet" class="content">
						<p class="ddit_text">
							아이디 : <%=id %><br>
							비밀번호 : <%=pw %><br>
							이름 : <%=name %><br>
							핸드폰번호 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %><br>
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
	</div>
	
	<script>

	
	function changeContent(){
		
		 const contents = document.querySelectorAll('.content');
	     contents.forEach(div => div.style.display = 'none');
		
	     const selectedValue = document.getElementById('menu').value;
	     document.getElementById(selectedValue).style.display = 'block';
	}
	
	
	</script>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
</html>