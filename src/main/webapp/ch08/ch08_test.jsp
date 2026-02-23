<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
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
									<p class="ddit_text" id="err_quest1" style="display: none; color: red;"> 숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정해주세요.</p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="quest2" class="col-sm-12 col-form-label">
									문제2) 시작은 영소문자 'abc'이고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="quest2" name="quest2"/>
									<p class="ddit_text" id="err_quest2" style="display: none; color: red;">시작은 영소문자 'abc'이고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.</p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="mem_id" class="col-sm-12 col-form-label">
									문제3) 아이디는 영소문자로 시작하고 영소문자, 숫자 8-16자로 설정해주세요.
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="mem_id" name="mem_id"/>
									<p class="ddit_text" id="err_id" style="display: none; color: red;">아이디는 영소문자로 시작하고 영소문자, 숫자 8-16자로 설정해주세요.</p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="mem_pw" class="col-sm-12 col-form-label">
									문제4) 비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8~16자로 설정해주세요. (조건에 부합하는 문자들이 꼭 다 들어있지 않아도 됨)
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="mem_pw" name="mem_pw"/>
									<p class="ddit_text" id="err_pw" style="display: none; color: red;"> 비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8~16자로 설정해주세요.</p>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="mem_name" class="col-sm-12 col-form-label">
									문제5) 이름은 한글 2-5글자로 설정해주세요.
								</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="mem_name" name="mem_name"/>
									<p class="ddit_text" id="err_name" style="display: none; color: red;">이름은 한글 2-5글자로 설정해주세요.</p>
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
									<p class="ddit_text" id="err_phone" style="display: none; color: red;">
										  핸드폰번호는 아래의 형식에 맞춰 설정해주세요.<br/>
									      첫번째 자리 : 011,016,017,019,070,010만 가능하게 해주세요.<br/>
									      두번째 자리 : 숫자 3자리 또는 숫자 4자리로 설정해주세요.<br/>
									      세번째 자리 : 숫자 4자리로 설정해주세요.<br/>
									      예시) 010-1234-1234, 016-123-1234
									</p>
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
	let form = document.querySelector("#frm");
	let q1 = frm.quest1.value;
	let q2 = frm.quest2.value;
	let mem_id = frm.mem_id.value;
	let mem_pw = frm.mem_pw.value;
	let mem_name = frm.mem_name.value;
	let mem_phone = frm.mem_phone.value;
	let cnt = 0;
	
	let q1Exp = /^[0-9]{7,12}$/;
	if(!q1Exp.test(q1)){
// 		alert("문제1 유효성 에러");
		cnt++;
		frm.querySelector("#err_quest1").style.display = "block";
	}else frm.querySelector("#err_quest1").style.display = "none";

	// 문제2) 시작은 영소문자 'abc'이고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.
	let q2Exp = /^(abc)[a-zA-Z]{5,7}$/;
	if(!q2Exp.test(q2)){
// 		alert("문제2 유효성 에러");
		cnt++;
		frm.querySelector("#err_quest2").style.display = "block";
	}else frm.querySelector("#err_quest2").style.display = "none";
	
	// 문제3) 아이디는 영소문자로 시작하고 영소문자, 숫자 8-16자로 설정해주세요.
	let mem_idExp = /^[a-z][a-z0-9]{7,15}$/;
	if(!mem_idExp.test(mem_id)){
// 		alert("문제3 유효성 에러");
		cnt++;
		frm.querySelector("#err_id").style.display = "block";
	}else frm.querySelector("#err_id").style.display = "none";
	
	//문제4) 비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8~16자로 설정해주세요.
	//(조건에 부합하는 문자들이 꼭 다 들어있지 않아도 됨)
	let mem_pwExp = /^[A-Z][a-zA-Z0-9].{7,15}$/;
	if(!mem_pwExp.test(mem_pw)){
// 		alert("문제4 유효성 에러");
		cnt++;
		frm.querySelector("#err_pw").style.display = "block";
	}else frm.querySelector("#err_pw").style.display = "none";
	
	//문제5) 이름은 한글 2-5글자로 설정해주세요.
	let mem_nameExp = /^[가-힣]{2,5}$/;
	if(!mem_nameExp.test(mem_name)){
// 		alert("문제5 유효성 에러");
		cnt++;
		frm.querySelector("#err_name").style.display = "block";
	}else frm.querySelector("#err_name").style.display = "none";
	
	//문제6) 핸드폰번호는 아래의 형식에 맞춰 설정해주세요.
	//첫번째 자리 : 011,016,017,019,070,010만 가능하게 해주세요.
	//두번째 자리 : 숫자 3자리 또는 숫자 4자리로 설정해주세요.
    //세번째 자리 : 숫자 4자리로 설정해주세요.
	//예시) 010-1234-1234, 016-123-1234
	
	let mem_phoneExp = /^(010|011|016|017|019|070)-[0-9]{3,4}-[0-9]{4}$/;
	if(!mem_phoneExp.test(mem_phone)){
// 		alert("문제6 유효성 에러");
		cnt++;
		frm.querySelector("#err_phone").style.display = "block";
	}else frm.querySelector("#err_phone").style.display = "none";
	
 	if(cnt<1) form.submit();
 	else return false;
}

</script>
</html>