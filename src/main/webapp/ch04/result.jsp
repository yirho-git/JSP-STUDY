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
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH01")%></h1>
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<h4 class="ddit_chapter text-center">입력받은 Data</h4>
						<p class="ddit_text pb-4"></p>
						<p>입력받은 타입 :</p>
						<p>입력받은 아이디 :</p>

						<h4 class="ddit_chapter text-center">등록 완료 후</h4>
						<p class="ddit_text pb-4">페이지 이동방식 포워딩</p>

						<p>request_memberList :</p>
						<p>session_memberList :</p>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>이름</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>

						<p class="ddit_text pb-4">페이지 이동방식 리다이렉트</p>
						<p>request_memberList :</p>
						<p>session_memberList :</p>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>이름</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
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