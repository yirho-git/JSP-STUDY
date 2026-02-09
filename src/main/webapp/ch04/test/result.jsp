<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>

<body>
	<%@ include file="/module/header2.jsp"%>

	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH04")%></h1>
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">

						<button class="btn btn-sm btn-primary">다시하기</button>
						<%
						String type = request.getParameter("type");
						String number = (String)session.getAttribute("number");
						int num = Integer.parseInt(number);
							
						pageContext.setAttribute("type", type);
						pageContext.setAttribute("s_num", num);
						%>
						
						<table class="table table-bordered">
							<tr>
								<td>
									<c:forEach begin="0" end="3" varStatus="vs">
										<img src="../resources/images/ch04/sin${vs.count}.jpg" width="300px" /></br>
									</c:forEach>
								</td>
								
								<td>
									<p class="ddit_text">
										페이지 이동방식 타입 : ${type }<br /> 
										입력 횟수 : ${s_num }번<br /> 
										현재 횟수 : ${s_num }번<br /> 
										현재 상태 : 횟수 사용 완료! 이미지 완성!
									</p>
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
</html>