<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="jakarta.tags.core" prefix="c"%>
	<%@taglib uri="jakarta.tags.functions" prefix="fn"%>
<
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>
<style>
th{
	background-color: pink;
}
</style>
<body>
	<%@ include file="/module/header2.jsp"%>
	
	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH01") %></h1>
			<p class="services_text">각 챕터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
					<!-- 
						1) 304호 학생 이름 모두를 저장하고, 전체 학셍의 이름들을 출력해주세요.
						2) 학생의 각 성씨별 카운트를 출력해주세요
						
						'김'씨 00명
						'홍'씨 00명
						'이'씨 00명
						...
						
						3) JSTL을 활용해서 출력해주세요					
					 -->
					 <%
						List<String> list = new ArrayList<String>();	
					 	
					 	list.add("이용로");
					 	list.add("이윤진");
					 	list.add("최민영");
					 	list.add("임채은");
					 	list.add("김지현");
					 	list.add("도선호");
					 	list.add("노태호");
					 	list.add("임경호");
					 	list.add("오수아");
					 	list.add("손우승");
					 	list.add("박진아");
					 	list.add("김아영");
					 	list.add("한소희");
					 	list.add("김보라");
					 	
					 	Map<String, Integer> map = new HashMap<String, Integer>(); 
					 	
// 					 	for(int i = 0; i< list.size()-1; i++){
// 					 		map.put(list.get(i), 0);
// 					 	}
					 	
					 	pageContext.setAttribute("map", map);
					 	pageContext.setAttribute("list", list);
					 %>
					 
					 	<c:forEach var="n" items="${list }">
							${n }
					 	</c:forEach><br>
					 	
					 	<c:set var="last"/>
					 	<c:forEach var="n" items="${list }">
					 		<c:set var="last" value="${last }${fn:substring(n,0,1) }"/>
					 	</c:forEach>
						모든 성 : ${last }<br>
						
						<c:set var="f" value="" scope="page"/>
						<c:forEach begin="0" end="${fn:length(last)-1}" varStatus="vs">
							<c:set var="sub" value="${fn:substring(last, vs.index,vs.index+1)}"/>
							<c:if test="${!fn:contains(f, sub)}">
								<c:set var="f" value="${f}${sub }"/>
							</c:if>
					 	</c:forEach>
					 	성 중복 제거 : ${f }
					 	

					
					 	<table class="table table-borderd">
						 		<tr>
						 			<c:forEach begin="0" end="${fn:length(f)-1 }" varStatus="vs1">
						 				<th>${fn:substring(f, vs1.index, vs1.index+1)}</th>
					 				</c:forEach>
						 		</tr>
						 		
						 		<tr>
						 			<c:forEach begin="0" end="${fn:length(f)-1 }" varStatus="vs2">
						 				<td>0</td>
						 			</c:forEach>
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