<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="java.util.ArrayList"%>
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
							1. 참고 이미지를 참고하여 회원 상세정보 페이지를 작성해주세요.
							
							2. 회원 프로필 이미지, 아이디, 비밀번호, 이름, 성별을 출력해주세요.
							
							3. [목록] 버튼 클릭 시, 목록페이지(ch07_test_memberList.jsp)로 이동해주세요.
						 -->
						 <h3 class="ddit_chapter">회원 상세보기</h3>
                    	 <p class="ddit_text pb-3"></p>
	                     <%
	                     	String curId = request.getParameter("detail-id");
	                     	
	                     	MemberDAO dao = MemberDAO.getInstance();
	                     	MemberVO vo = dao.getMember(curId);
	                     	
	                     	pageContext.setAttribute("n", vo);
	                     %>	
	                     	<a href="ch07_test_memberList.jsp?id=${n.mem_id }" class="ddit_btn ddit_btn_outline_info">목록</a>
	                     	<div style="height: 20px;"></div>
	                     		<div class="box" style="border: 1px solid #D4D4D4; width: 200px;">
	                     			<div class="title" style="height: 50px; border-bottom: 1px solid #D4D4D4;
	                     				 display: flex; justify-content: space-around; background-color: #F0F0F0 ;">
		                     			<div style="padding: 12px; height: 30px;">${n.mem_name }님의 정보</div>
	 								</div>
										<img alt="" src="${n.filename }" style="height:200px;" /><br/>
									<div style="display: flex; justify-content:center; vertical-align: middle;">
										<c:out value="아이디 : ${n.mem_id }" /><br/>
										<c:out value="비밀번호 : ${n.mem_pw }" /><br/>
										<c:out value="이름 : ${n.mem_name }" /><br/>
 										<c:out value="성별 : ${n.mem_sex }" /><br/>
 									</div>
 								<div style="background-color: #F0F0F0; height: 20px;"></div>
 							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
</html>