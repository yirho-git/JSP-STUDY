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
							// 파일을 업로드 하기 위한 방법
							// 2. 서버 업로드 환경에 업로드
							// 이클립스에 설정한 tomcat의 환경이 존재한다. 그렇기 때문에 우리가 개발중인
							// 프로젝트가 서버를 통해 run이 되면 .war로 변환된 프로젝트 파일이 tomcat
							// 서버 환경에 배포되어 실행되는데, 이때 해당 경로가 workspace_jsp/.metadata/plugins/xxx.server.core/temp0/wtpwebapp/JSPProject에
							// 해당하는 ROOT로부터 내가 설정한 /resources/upload라는 폴더를 찾아 해당 위치에 파일을
							// 업로드하기 시작합니다.
							// 그렇기 때문에 배포된 내 프로젝트 파일이 ROOT로서 시작하는 위치 경로를 자바 메소드를 통해서 가져올 필요가 있습니다.
							// 이때 사용할 수 있는 메소드가 getServletContext().getRealPath() 메소드를 활용할 수 있습니다.
							String path = request.getServletContext().getRealPath("/resources/upload");
							File tempFile = new File(path);
							// 해당 위치에 upload 폴더가 존재하지 않을 때
							if(!tempFile.exists()){
								tempFile.mkdirs(); // 만들어지지 않은 폴더 모두 만들어!
							}
							
							// 일반 데이터를 꺼낸다. (getParameter())
							String id = request.getParameter("id");		// 아이디값
							String pw = request.getParameter("pw");		// 비밀번호값
							String gender = request.getParameter("gender");	// 성별 값
							
							String filename = ""; // 파일명
							int maxSize = 1 * 1024 * 1024; // 1MB(파일 업로드 시 최대 사이즈)
							boolean flag = true;	// 업로드 성공
							
							out.println("<h5 class='customer_text'>가입을 완료합니다!</h5>");
							out.println("	아이디 : " + id + "<br/>");
							out.println("	비밀번호 : " + pw + "<br/>");
							out.println("	성별 : " + gender + "<br/>");
							out.println("========== 첨부파일 목록 ==========<br/>");
							
							Collection<Part> collect = request.getParts();
							Iterator<Part> ite = collect.iterator();
							while(ite.hasNext()){
								Part part = ite.next();
								String name = part.getName(); // parameter name(key)
							
								if(name.equals("profileImg")){
									%>
									<img src="/upload/<%=part.getSubmittedFileName()%>" style="width:180px; height:200px;"><br>
									<%
									
									out.println("	파일명 : " + part.getSubmittedFileName() + "<br/>");
									out.println("	파일크기 : " + part.getSize() + "<br/>");
									out.println("	파일타입 : " + part.getContentType() + "<br/>");
									// 파일복사(C:/upload/images.jpg)
									part.write(path + "/" + part.getSubmittedFileName());
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