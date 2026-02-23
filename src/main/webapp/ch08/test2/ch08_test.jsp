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
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<h5 class="ddit_chapter2">유효성 검사를 위한 스크립트 이벤트</h5>
						
						<!-- 
							문제 풀어보기
							- 각 항목별 입력 데이터가 정규 표현식과 일치하는지 여부에 따라 메세지를 표시해주세요.
							- 테스트에 통과 시, id가 'success'로 설정된 출력란에 '통과하셨습니다'라고 출력해주세요. 
							
							정규식 테스트 URL : https://regexr.com
						-->
						<p class="ddit_text pt-3">ch08_test</p>
						<form action="ch08_test_process.jsp" method="post" id="frm">
							<div class="mb-3 row">
								<label for="quest1" class="col-sm-12 col-form-label">
									문제1) 숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정해주세요.
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="quest1" name="quest1"/>
									<p class="ddit_text" id="err_quest1"></p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="quest2" class="col-sm-12 col-form-label">
									문제2) 시작은 영소문자 'abc'이고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="quest2" name="quest2"/>
									<p class="ddit_text" id="err_quest2"></p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="mem_id" class="col-sm-12 col-form-label">
									문제3) 아이디는 영소문자로 시작하고 영소문자, 숫자 8-16자로 설정해주세요.
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="mem_id" name="mem_id"/>
									<p class="ddit_text" id="err_id"></p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="mem_pw" class="col-sm-12 col-form-label">
									문제4) 비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8~16자로 설정해주세요. (조건에 부합하는 문자들이 꼭 다 들어있지 않아도 됨)
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="mem_pw" name="mem_pw"/>
									<p class="ddit_text" id="err_pw"></p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="mem_name" class="col-sm-12 col-form-label">
									문제5) 이름은 한글 2-5글자로 설정해주세요.
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="mem_name" name="mem_name"/>
									<p class="ddit_text" id="err_name"></p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="mem_phone" class="col-sm-12 col-form-label">
									문제6) 핸드폰번호는 아래의 형식에 맞춰 설정해주세요.<br/>
									      첫번째 자리 : 011,016,017,019,070,010만 가능하게 해주세요.<br/>
									      두번째 자리 : 숫자 3자리 또는 숫자 4자리로 설정해주세요.<br/>
									      세번째 자리 : 숫자 4자리로 설정해주세요.<br/>
									      예시) 010-1234-1234, 016-123-1234
								</label>
								
								<div class="col-sm-12">
									<input type="text" class="form-control" id="mem_phone" name="mem_phone"/>
									<p class="ddit_text" id="err_phone"></p>
								</div>
							</div>
							<p class="ddit_text pt-3" id="success"></p>
							<input class="ddit_btn ddit_btn_outline_primary" type="button" id="sendBtn" value="전송" onclick="Check()"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
<script type="text/javascript">
function Check(){
	let form = document.frm;
	let q1 = frm.quest1.value;
	let q2 = frm.quest2.value;
	
	let q1Exp = /^[0-9]{7,12}/;
	if(!q1Exp.test(q1)){
// 		alert("숫자를 입력하되, 7-12자리까지만 입력받을 수 있게 설정해 주세요");
		 request.getRequestDispatcher("ch07_test_signup.jsp?error=3")
         .forward(request, response);
  		return;
	}
}

</script>
</html>