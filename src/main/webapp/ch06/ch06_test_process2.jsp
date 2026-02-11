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
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH06") %></h1>
			<p class="services_text">각 챕터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
					<h5 class="ddit_chapter2">CH06 TEST RESULT</h5>
						<select name="result" id="selectEle">
							<option value="선택">--선택해주세요--</option>
							<option value="스크립틀릿">스크립틀릿</option>
							<option value="JSTL">JSTL</option>
						</select>
						<table class="table table-bordered" id="scriptletTable" style="display:none;">
							<tr>
								<th>스크립트 태그를 이용한 방법</th>
							</tr>
							
						<%!
							public String getHobby(String hobby){
								String hob = null;
								if(hobby.equals("development"))
									hob = "개발";
								if(hobby.equals("book"))
									hob = "독서";
								if(hobby.equals("movie"))
									hob = "영화감상";
								if(hobby.equals("music"))
									hob = "음악감상";
								if(hobby.equals("sports"))
									hob = "운동";
								if(hobby.equals("etc"))
									hob = "기타";
								return hob;
							}
						%>
						<%
						request.setCharacterEncoding("UTF-8");
						
						
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
						<tr>
							<td>
								<%
									String role = request.getParameter("role");
								%>
								<p class="ddit_text"><%=role.equals("admin") ? "관리자" : "사용자" %> '<%=name %>'님, 환영합니다!</p>
								<p class="ddit_text">
									타입 : <%=role %><br/>
									아이디 : <%=id %><br/>
									비밀번호 : <%=pw %><br/>
									이름 : <%=name %><br/>
									연락처 : <%=phone1 %> - <%=phone2 %> - <%=phone3 %><br/>
									성별 : <%=gender.equals("male") ? "남자" : "여자" %><br/>
									취미 : 
									<%
										if(hobby != null){
											for(int i = 0; i < hobby.length; i++){
												out.println(" " + getHobby(hobby[i]));
											}
										}
									%>
								</p>
								<p class="ddit_text" style="white-space: pre-wrap;">가입인사 : <%=comment %><br/></p>
							</td>
						</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
<script>
// dom 완성 후 이벤트 실행
$(function(){
	let selectEle = $("#selectEle");	// document.querySelector("#selectEle");
	
	selectEle.on("change", function(){
		// 1. JSTL로 출력을 먼저 해놓기
		
		// 2. 선택한 값이 스크립틀릿이라면
		
		// 3. 테이블 영역이 보여진다.
		$("#scriptletTable").show();
	});
});
</script>
</html>