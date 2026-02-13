<%@page import="oracle.net.aso.p"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
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
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH07") %></h1>
			<p class="services_text">각 챕터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
					<%
						
						String path = request.getServletContext().getRealPath("/resources/upload");
						File tempFile = new File(path);
						
						if(!tempFile.exists()){
							tempFile.mkdirs();
						}
						
						String id = request.getParameter("id");		// 아이디값
						String pw = (String)request.getParameter("pw");		// 비밀번호값
						String gender = request.getParameter("gender");
						//gender = "male".equals(gender)? "남자" : "여자";
						
						String filename = "";
						int maxSize = 2 * 1024 * 1024;
						boolean flag = true;
						
						out.println("<h5 class='customer_text'>프로필이미지 등록완료</h5>");
						out.println("<p class='ddit_text'>");
						out.println("	아이디 : " + id +"<br/>");
						out.println("	비밀번호 : "+ pw +"<br/>");
						out.println("	성별 : "+ gender + "<br/>");
						out.println("</p>");
						out.println("========== 첨부파일 목록 ==========<br/>");

						Collection<Part> collect = request.getParts();
						Iterator<Part> it = collect.iterator();
				
						while(it.hasNext()){
							Part part = it.next();
							String key = part.getName();	// input.name의 값"profileImg"를 저장
							
							if("profileImg".equals(key)){
								filename = part.getSubmittedFileName();	// 업로드한 실제 파일명
								long fileSize = part.getSize();
								out.println("<table>");
								out.println("<tr>");
								out.println("<td>");
								out.println("<img src=\"" + request.getContextPath() 
						        				+ "/resources/upload/" + part.getSubmittedFileName() 
						        				+ "\" style=\"width:180px; height:200px;\"><br>");	   
								
								
								%>
<%-- 								<img src="<%=request.getContextPath()%>/resources/upload/<%=part.getSubmittedFileName()%>" --%>
<!--    									  style="width:180px; height:200px;"><br> -->
								<%
								out.println("</td>");
								out.println("</tr>");
								
								out.println("<tr>");
								out.println("<td>");
								out.println("	파일명 : " + part.getSubmittedFileName() + "<br/>");
								out.println("	파일크기 : " + part.getSize() + "<br/>");
								out.println("	파일타입 : " + part.getContentType() + "<br/>");
// 								out.println("	경로 : /upload/" + part.getSubmittedFileName() + "<br/>");
								out.println("</td>");
								out.println("</tr>");
								out.println("</table>");
								if(maxSize < fileSize){
									flag=false;
								}else{
									part.write(path + "/" +  part.getSubmittedFileName()); // 실제 경로(디스크 경로)에 파일 쓰기(복사)
// 									out.println("	실제경로 : /upload/" + path + "/" +  part.getSubmittedFileName() + "<br/>");
								}
							}
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