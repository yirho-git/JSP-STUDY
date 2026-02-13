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
	                    	1. 참고 이미지를 참고하여 회원 목록 페이지를 작성해주세요.
	                    		- 목록은 프로필 이미지, 아이디, 이름 항목이 함께 출력될 수 있도록 해주세요.
	                    	2. 현재 로그인 한 사용자의 아이디가 일치하는 목록 데이터는 [본인]을 표시해주세요.
	                    	3. [회원등록] 버튼 클릭 시, 회원가입 페이지로 이동하여 회원을 새롭게 등록할 수 있도록 해주세요.
	                    	4. 각 회원목록의 내용 중 [상세정보] 버튼 클릭 시, 해당 회원의 상세정보 페이지(ch07_test_memberDetail.jsp)로 이동해주세요.
	                     -->
	                     <h3 class="ddit_chapter">회원목록</h3>
                    	 <p class="ddit_text pb-3"></p>
	                     <a href="ch07_test_signup.jsp" class="ddit_btn ddit_btn_outline_info">회원등록</a>
	                     <br/>
	                     <%
	                     	String curId = request.getParameter("id");
	                     	
	                     	MemberDAO dao = MemberDAO.getInstance();
	                     	List<MemberVO> list = dao.getMemberList();  
	                     	
	                     	pageContext.setAttribute("curId", curId);
	                     	pageContext.setAttribute("list", list);
	                     %>	
	                     <div style="height: 20px;"></div>
	                     <c:forEach items="${list }" var="n" varStatus="vs">
							<div class="box" style="border: 1px solid #D4D4D4; width: 200px; margin: 15px;">
								<div class="title" style="height: 50px; border-bottom: 1px solid #D4D4D4;
	                     				 display: flex; justify-content: space-around; background-color: #F0F0F0 ;">
									<c:if test="${n.mem_id == curId }">
										<span style="color: red; font-size: 15px;">[본인]</span>
									</c:if>
									<c:out value="${n.mem_name }님의 정보" />
								</div>
								<img alt="" src="${n.filename }" style="width:180px; height:200px;" />
								<div style="display: flex; justify-content:center; vertical-align: middle;">
									<c:out value="아이디 : ${n.mem_id }" /><br/>
									<c:out value="이름 : ${n.mem_name }" /><br/>
								</div>
								<div style="border-bottom: 1px solid #D4D4D4; display: flex; justify-content: space-around; vertical-align : middle;
											height:35px; background-color: #F0F0F0 ;">
									<form action="ch07_test_memberDetail.jsp" method="get">
										<button type="submit" name="detail-id" value="${n.mem_id}" style="padding: 1px; padding-left:2px;
										 padding-right: 2px; border-radius : 10%; background-color: white; border: 1px solid black;">상세정보</button>
									</form>
								</div>
							</div>
	                   	</c:forEach>
	                     
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
</body>
</html>