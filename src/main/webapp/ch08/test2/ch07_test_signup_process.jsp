<%@page import="java.lang.reflect.AccessFlag.Location"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>

<body>
	<%@ include file="/module/header2.jsp"%>
	
	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH08") %></h1>
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<!--
							1. 회원가입 처리를 진행해주세요.
								- 회원가입 시, 등록에 필요한 항목 모두를 이용해 가입을 진행해주세요.
								  > MemberDAO의 insertMember() 메소드를 활용하여 가입을 진행해주세요.
								- 프로필 이미지가 있기 때문에 파일 처리도 함께 해주세요.
								- 가입 완료 후, 로그인 페이지로 이동해주세요.
								
							2. 프로필 이미지를 업로드 할 때, 파일 크기가 1MB를 넘어가는 경우 "파일 크기가 초과되어 회원가입을 진행할 수 없습니다." 라는 
							   에러 메세지를 회원가입 페이지(ch07_test_signup.jsp)에서 출력해주세요.
							  *server.xml 에서 maxPostSize설정해야함(디폴트는 2mb)
							<Connector connectionTimeout="20000" maxParameterCount="1000" port="8080" protocol="HTTP/1.1" redirectPort="8443"
							  maxPostSize="20971520"/>
							   
						-->
						<%
							MemberDAO dao = MemberDAO.getInstance();
							String path = request.getServletContext().getRealPath("/resources/upload");
							File tempFile = new File(path);
							
							if(!tempFile.exists()){
								tempFile.mkdirs();
							}
							
							String id = request.getParameter("id");
							MemberVO v1 = null; 
							v1 = dao.getMember(id);
							String pw = request.getParameter("pw");		// 비밀번호값
							String name = request.getParameter("name"); 
							String gender = "male".equals(request.getParameter("gender")) ? "남자" : "여자";
							
							if (v1 != null && v1.getMem_name()!=null) {
							    request.getRequestDispatcher("ch07_test_signup.jsp?error=3")
							           .forward(request, response);
							    return;
							}
							
							
							String filename = "";
							int maxSize = 1 * 1024 * 1024;
							boolean flag = true;
							
							Part part = request.getPart("profileImg");
							
							if(part!=null && part.getSubmittedFileName() != null && !part.getSubmittedFileName().equals("")){
								filename = part.getSubmittedFileName();
								long fileSize = part.getSize();
								
								if(maxSize < fileSize){
									flag = false;
									request.getRequestDispatcher("ch07_test_signup.jsp?error=4")
										.forward(request, response);
									return;
								}else{
									filename = request.getContextPath() + "/resources/upload/" + part.getSubmittedFileName();
									part.write(path + "/" + part.getSubmittedFileName());
								}
							}
							
							MemberVO vo = new MemberVO(id, pw, name, gender, filename);
						
							
							dao.insertMember(vo);
							
							request.getRequestDispatcher("ch07_test_signin.jsp")
							.forward(request, response);
						%>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
<script>
// 	setTimeout(() => {
// 		location.href = "ch07_test_signin.jsp";
// 	}, 1000);
</script>
</body>
</html>