<%@page import="kr.or.ddit.index.IndexRepository"%>
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
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<!--
							1. 회원가입 페이지를 작성해주세요.
							아이디 : _____________
							비밓번호 : _____________
							이름 : ______________
							성별 : ● 남자 ○ 여자
							프로필 이미지 : [ 파일선택 ]
							-----------------------
							[ 가입하기 ] [ 뒤로가기 ]
							
							2. 회원가입 정보를 입력 후, 가입하기 버튼을 클릭하면 ch07_test_signup_process.jsp로 이동하여
							   회원가입을 진행해주세요.
							
							3. 뒤로가기 버튼을 클릭 시, 로그인 페이지로 이동해주세요.
						-->
						<%
							String error = request.getParameter("error");
							pageContext.setAttribute("err", error);
							if(error!=null){
							%>
							<c:if test="${err=='3'}">
								<div class="alert alert-danger">
									아이디가 이미 존재합니다.						
								</div>
							</c:if>
							<c:if test="${err=='4'}">
								<div class="alert alert-danger">
									파일 크기가 초과되어 회원가입을 진행할 수 없습니다. 						
								</div>
							</c:if>
							<%
							}
						%>						
						
						 <h3 class="ddit_chapter">회원가입</h3>
						 <p class="ddit_text pb-3"></p>
						 <form action="ch07_test_signup_process.jsp" method="post" enctype="multipart/form-data">
							아이디 : <input type="text" name="id"><br/>
							비밀번호 : <input type="text"	name="pw"><br/>					 
							이름 : <input type="text" name="name"><br/>
							성별 : 
								남자 <input type="radio" name="gender" value="male" checked="checked">					 
								여자 <input type="radio" name="gender" value="female"><br/>
							프로필 이미지 :				
							<input type="file" name="profileImg"><br/><br/>
							<input type="submit" class="ddit_btn ddit_btn_outline_primary" value="가입하기">	  
	                     	<a href="ch07_test_signin.jsp" class="ddit_btn ddit_btn_outline_info">뒤로가기</a>
						 </form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
</html>