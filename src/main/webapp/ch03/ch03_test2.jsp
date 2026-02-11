<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>

<body>
	<%@ include file="/module/header2.jsp"%>

	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH03")%></h1>
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<!-- 
							문제 풀어보기
							1) 리스트에 304호 반 학생 이름을 모두 넣고 Core태그 set에 저장한 후,
							   전체를 출력해주세요.
							2) 전체 출력을 4명씩 끊어서 출력해주세요
								이름 이름 이름 이름					
								이름 이름 이름 이름					
								이름 이름 이름 이름
							3) 4명씩 끊어서 출력할 때. 본인의 이름은 '본인'으로 출력해주세요.
								- '본인' 글자를 출력 시, 굵은 글씨와 글자 색깔은 녹색으로 출력해주세요.
								이름 이름 이름 이름					
								이름 본인 이름 이름					
								이름 이름 이름 이름
								....					
						 -->
						<%
						List<String> list = new ArrayList();
						list.add("이윤진");
						list.add("김지현");
						list.add("최민영");
						list.add("노태호");
						list.add("도선호");
						list.add("이용로");
						list.add("김보라");
						list.add("한소희");
						list.add("김아영");
						list.add("임채은");
						list.add("박진아");
						list.add("손우승");
						list.add("임경호");
						list.add("오수아");

						pageContext.setAttribute("list", list);
						%>

						<table class="table table-bordered">
							<tr>
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
							</tr>

							<c:forEach items="${list}" var="n" varStatus="vs">
								<c:if test="${(vs.index % 4) == 0}">
									<tr>	
								</c:if>
								
								<c:choose>
									<c:when test="${n == '이용로'}">
										<td style=" font-weight: bold; color: green; ">${n }</td>
									</c:when>
									
									<c:otherwise>
										<td>${n }</td>
									</c:otherwise>
								</c:choose>
								
								<c:if test="${vs.last && (vs.index % 4) != 3 }">
									<c:forEach begin="${(vs.index % 4)+1 }" end="3" step="1">
										<td> </td>
									</c:forEach>
								</c:if>
																
								<c:if test="${vs.last || (vs.index % 4) == 3}">
									</tr>
								</c:if>
							</c:forEach>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
</body>
</html>