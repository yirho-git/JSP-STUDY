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
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH08") %></h1>
			<p class="services_text">각 챕터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<h5 class="ddit_chapter2">유효성 검사를 위한 스크립트 이벤트</h5>
						
						<p class="customer_text">입력에 성공했습니다!</p>
						<%
							request.setCharacterEncoding("UTF-8");
						
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
						
							String id2 = request.getParameter("id2");
							String pw2 = request.getParameter("pw2");
						%>
						<h5 class="ddit_text2">Javascript 버전</h5>
						<p class="ddit_text2">
							아이디 : <%=id %><br>
							비밀번호 : <%=pw %><br>
						</p>
						
						<h5 class="ddit_text2">Jquery 버전</h5>
						<p class="ddit_text2">
							아이디 : <%=id2 %><br>
							비밀번호 : <%=pw2 %><br>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
<script type="text/javascript">
// 제이쿼리 ready function은 document가 전부 읽히고 나서 이후에 실행될 영역이다.
$(function(){
	// 버튼 태그를 testBtn변수에 담는다
	let testBtn = $("#testBtn");
	
	// 변수로 설정된 태그 객체를 Click 이벤트 핸들러 생성
	// 무작정 테스트해보기
	testBtn.on("click",function(){
		let testId = $("#testId").val();	// 아이디 값
		let testPw = $("#testPw").val();	// 비밀번호 값
		
		// 유효성 검사
		// 조건문 작성법은 다양한 방법으로 작성할 수 있습니다.
		// 아이디가 입력되었는지 입력되지 않았는지를 체크하기 위해서 null과 공백 체크에 대한 조건문 작성은
		// if(testId == null || testId == "") or if(!testId)와 같은 방법으로 작성할 수 있습니다.
		// 두 작성법에 속도차이는 미미합니다. 단지, 가독성에 차이 말고는 없는것이죠.
		// 하지만, 내가 비교할 때 조건의 대상을 명시적으로 작성하고자 한다면 전자의 방법으로 작성해야 합니다.
		// if(!testId)는 null, 공백, undefined, NaN 등등을 체크합니다.	
		if(!testId){
			alert("아이디를 입력해주세요");
			return;
		}
		
		if(!testPw){
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		$("#testForm").submit();
	});
	
	
});

</script>
</html>