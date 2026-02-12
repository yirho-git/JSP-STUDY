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
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH05") %></h1>
			<p class="services_text">각 챕터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<!-- 
							문제를 풀어봅시다
							1. 아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소를 입력받을 form을 구성합니다.
							2. 성별 항목은 남자라면 'M'을 여자는 'G'의 값을 가질 수 있도록 설정해주세요.
							3. 입력된 데이터를 ch05_test_process.jsp로 전송 후 결과를 출력해 주세요
						 -->
						 
						 <form action="ch05_test_process.jsp" method="post">
						 	<div class="mb-3">
								<label for="id" class="form-label">아이디</label>
								<input type="text" class="form-control" id="id" name="id"/>
						 	</div>
						 	<div class="mb-3">
								<label for="pw" class="form-label">비밀번호</label>
								<input type="text" class="form-control" id="pw" name="pw"/>
						 	</div>
						 	<div class="mb-3">
								<label for="name" class="form-label">이름</label>
								<input type="text" class="form-control" id="name" name="name"/>
						 	</div>
						 	<div class="mb-3">
								<label class="form-label">성별</label>
								
								<input type="radio" value="M" name="gender">
								<label class="form-label">남자</label>
								<input type="radio" value="G" name="gender">
								<label class="form-label">여자</label>
						 	</div>
						 	<div class="mb-3">
								<label for="tel" class="form-label">핸드폰번호</label>
								<input type="tel" class="form-control" id="tel" name="tel"/>
						 	</div>
						 	<div class="mb-3">
								<label for="addr" class="form-label">주소</label>
								<input type="text" class="form-control" id="addr" name="addr"/>
						 	</div>
						 	<input type="submit" class="btn btn-primary" value="전송"/>
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